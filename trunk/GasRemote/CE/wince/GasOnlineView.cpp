// GasOnlineView.cpp : CGasOnlineView 类的实现
//

#include "stdafx.h"
#include "GasOnline.h"

#include "GasOnlineDoc.h"
#include "GasOnlineView.h"
#include "mainfrm.h"
#include "SetParaDlg.h"
#include "IniParse.h"
#include <string.h> 
#include <stdlib.h> 
#include <stdio.h>
#include <math.h>
#include "time.h"
#include "QuitTipDlg.h"
#include "HDI_API.h"

//#define BYPASS
#define HOSTID 0
#ifdef _DEBUG
#define new DEBUG_NEW
#endif

//定义串口数据接收消息常量
#define WM_RECV_SERIALPORT1_DATA WM_USER + 101
#define WM_RECV_SERIALPORT2_DATA WM_USER + 102
#define WM_RECV_SERIALPORT3_DATA WM_USER + 103


// CGasOnlineView

IMPLEMENT_DYNCREATE(CGasOnlineView, CFormView)

BEGIN_MESSAGE_MAP(CGasOnlineView, CFormView)
	ON_MESSAGE(WM_RECV_SERIALPORT1_DATA,OnRecvSerialPort1Data)
	ON_MESSAGE(WM_RECV_SERIALPORT2_DATA,OnRecvSerialPort2Data)
	ON_MESSAGE(WM_RECV_SERIALPORT3_DATA,OnRecvSerialPort3Data)
	ON_BN_CLICKED(IDC_BUTTON_EXIT, &CGasOnlineView::OnBnClickedButtonExit)
	ON_WM_TIMER()
	ON_WM_PAINT()
	ON_BN_CLICKED(IDC_BUTTON_SET, &CGasOnlineView::OnBnClickedButtonSet)
	ON_EN_SETFOCUS(IDC_EDIT_H2S, &CGasOnlineView::OnEnSetfocusEditH2s)
	ON_EN_KILLFOCUS(IDC_EDIT_H2S, &CGasOnlineView::OnEnKillfocusEditH2s)
	ON_EN_SETFOCUS(IDC_EDIT_SO2, &CGasOnlineView::OnEnSetfocusEditSo2)
	ON_EN_KILLFOCUS(IDC_EDIT_SO2, &CGasOnlineView::OnEnKillfocusEditSo2)
	ON_EN_SETFOCUS(IDC_EDIT_COMB, &CGasOnlineView::OnEnSetfocusEditComb)
	ON_EN_KILLFOCUS(IDC_EDIT_COMB, &CGasOnlineView::OnEnKillfocusEditComb)
	ON_BN_CLICKED(IDC_BUTTON_H2S, &CGasOnlineView::OnBnClickedButtonH2s)
	ON_BN_CLICKED(IDC_BUTTON_SO2, &CGasOnlineView::OnBnClickedButtonSo2)
	ON_BN_CLICKED(IDC_BUTTON_COMB, &CGasOnlineView::OnBnClickedButtonComb)
END_MESSAGE_MAP()

// CGasOnlineView 构造/析构
SerialRcvBuffer CGasOnlineView::m_rcvBufPort1;

CGasOnlineView::CGasOnlineView()
	: CFormView(CGasOnlineView::IDD)
{
	// TODO: 在此处添加构造代码

	m_bmpBackground.LoadBitmap(IDB_BITMAPBACKGROUND);	/// 加载背景

	m_pSerialPort1 = NULL;
	m_pSerialPort2 = NULL;
	m_pSerialPort3 = NULL;

	m_SO2 = new GasType(0.07564296520423600605143721633888f);
	m_H2S = new GasType(0.05703125f);
	m_Fel = new GasType(0.038124285169653069004956157072055f);

	usID = HOSTID;
	for (int i=0;i<8;i++)
	{
		ucmima[i] = i;
	}
	
	usAlarmEn = 0xFFFF;
	ucSamInterval = 10;	
	m_strMima = _T("");
}

CGasOnlineView::~CGasOnlineView()
{
	if (m_pSerialPort1 != NULL)
	{
		m_pSerialPort1->ClosePort();

		delete m_pSerialPort1;
		m_pSerialPort1 = NULL;
	}

	if (m_pSerialPort2 != NULL)
	{
		m_pSerialPort2->ClosePort();

		delete m_pSerialPort2;
		m_pSerialPort2 = NULL;
	}

	if (m_pSerialPort3 != NULL)
	{
		m_pSerialPort3->ClosePort();

		delete m_pSerialPort3;
		m_pSerialPort3 = NULL;
	}

}

void CGasOnlineView::DoDataExchange(CDataExchange* pDX)
{
	CFormView::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_STATIC_O2, m_ctlCSO2);
	DDX_Control(pDX, IDC_STATIC_ID, m_ctlCSID);
	DDX_Control(pDX, IDC_STATIC_LONGITUDE, m_ctlCSGPSLANG);
	DDX_Control(pDX, IDC_STATIC_LATITUDE, m_ctlCSGPSLAT);
	DDX_Control(pDX, IDC_STATIC_TIME, m_ctlCSTime);
	DDX_Control(pDX, IDC_STATIC_TEMPERATURE, m_ctlCSTemper);
	DDX_Control(pDX, IDC_STATIC_DATE, m_ctlCSDate);
	DDX_Control(pDX, IDC_STATIC_WEEK, m_ctlCSWeek);
	DDX_Control(pDX, IDC_STATIC_NAME, m_ctlCSNAME);
	DDX_Control(pDX, IDC_STATIC_VALUE, m_ctlCSVALUE);
	DDX_Control(pDX, IDC_STATIC_HIGHTLEV, m_ctlCSALH);
	DDX_Control(pDX, IDC_STATIC_LOWLEV, m_ctlCSALLOW);
	DDX_Control(pDX, IDC_STATIC_O2VALUE, m_ctlCSO2Value);
	/*DDX_Control(pDX, IDC_STATIC_O2ALH, m_ctlCSO2ALH);
	DDX_Control(pDX, IDC_STATIC_O2ALLOW, m_ctlCSO2ALLOW);*/
	DDX_Control(pDX, IDC_STATIC_H2SVALUE, m_ctlCSH2SValue);
	/*DDX_Control(pDX, IDC_STATIC_H2SALH, m_ctlCSH2SALH);
	DDX_Control(pDX, IDC_STATIC_H2SALLOW, m_ctlCSH2SALLOW);*/
	DDX_Control(pDX, IDC_STATIC_COVALUE, m_ctlCSCOValue);
	/*DDX_Control(pDX, IDC_STATIC_COALH, m_ctlCSCOALH);
	DDX_Control(pDX, IDC_STATIC_COALLOW, m_ctlCSCOALLOW);*/
	DDX_Control(pDX, IDC_STATIC_SO2VALUE, m_ctlCSSO2Value);
	/*DDX_Control(pDX, IDC_STATIC_SO2ALH, m_ctlCSSO2ALH);
	DDX_Control(pDX, IDC_STATIC_SO2ALLOW, m_ctlCSSO2ALLOW);*/
	DDX_Control(pDX, IDC_STATIC_VOCVALUE, m_ctlCSVOCValue);
	/*DDX_Control(pDX, IDC_STATIC_VOCALH, m_ctlCSVOCALH);
	DDX_Control(pDX, IDC_STATIC_VOCALLOW, m_ctlCSVOCALLOW);*/
	DDX_Control(pDX, IDC_STATIC_COMBVALUE, m_ctlCSCOMBValue);
	/*DDX_Control(pDX, IDC_STATIC_COMBALH, m_ctlCSCOMBALH);
	DDX_Control(pDX, IDC_STATIC_COMBALLOW, m_ctlCSCOMBALLOW);*/
	DDX_Control(pDX, IDC_STATIC_H2S, m_ctlCSH2S);
	DDX_Control(pDX, IDC_STATIC_CO, m_ctlCSCO);
	DDX_Control(pDX, IDC_STATIC_SO2, m_ctlCSSO2);
	DDX_Control(pDX, IDC_STATIC_VOC, m_ctlCSVOC);
	DDX_Control(pDX, IDC_STATIC_COMB, m_ctlCSCOMB);
	DDX_Text(pDX, IDC_EDIT_H2S, m_H2S->set);
	DDX_Text(pDX, IDC_EDIT_SO2, m_SO2->set);
	DDX_Text(pDX, IDC_EDIT_COMB, m_Fel->set);
}

BOOL CGasOnlineView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: 在此处通过修改
	//  CREATESTRUCT cs 来修改窗口类或样式

	return CFormView::PreCreateWindow(cs);
}



void CGasOnlineView::OnInitialUpdate()
{
	CFormView::OnInitialUpdate();

	ucmima[0] = '1';
	ucmima[1] = '2';
	ucmima[2] = '3';
	ucmima[3] = '4';
	ucmima[4] = '5';
	ucmima[5] = '6';
	ucmima[6] = '7';
	ucmima[7] = '8';

	ReadRegPara();
	CString strtmp;
	//strtmp = _T("本机ID号：123456789ABC");
	//SetDlgItemText(IDC_STATIC_ID,strtmp);
	/*strtmp.Format(_T("经度：东经116°41′"));
	SetDlgItemText(IDC_STATIC_LONGITUDE,strtmp);
	strtmp.Format(_T("纬度：北纬40°12′"));
	SetDlgItemText(IDC_STATIC_LATITUDE,strtmp);
*/
	InitCtrol();

	GetDlgItem(IDC_BUTTON_USB)->EnableWindow(FALSE);

	//新建串口通讯对象
	m_pSerialPort1 = new CCESeries();
	m_pSerialPort1->m_OnSeriesRead = OnPort1Read; //

	//打开串口--与sensor通信用
	if (m_pSerialPort1->OpenPort(this,
		1,
		9600,
		NOPARITY,
		8,
		ONESTOPBIT))
	{
		m_rcvBufPort1.valid = 0;
		TRACE(L"SENSOR打开成功");
	}
	else
	{
		TRACE(L"SENSOR打开失败");
	}

	//新建串口通讯对象
	m_pSerialPort2 = new CCESeries();
	m_pSerialPort2->m_OnSeriesRead = OnPort2Read; //

	//打开串口--与主机板通信用
	if (m_pSerialPort2->OpenPort(this,
		2,
		38400,
		NOPARITY,
		8,
		ONESTOPBIT))
	{
		TRACE(L"主机通信打开");
	}
	else
	{
		TRACE(L"主机通信失败");
	}

		//新建串口通讯对象
	m_pSerialPort3 = new CCESeries();
	m_pSerialPort3->m_OnSeriesRead = OnPort3Read; //

	//打开串口--与GPS通信用
	if (m_pSerialPort3->OpenPort(this,
		3,
		9600,
		NOPARITY,
		8,
		ONESTOPBIT))
	{
		TRACE(L"GPS打开成功");
	}
	else
	{
		TRACE(L"GPS打开失败");
	}

	SetWdtTimeOut(10);
	EnableWdt();
	//DisableWdt();

	SetTimer(1001,1000,NULL);
	SetTimer(1002,2000,NULL);
	SetTimer(1003,3000,NULL);
}


// CGasOnlineView 诊断

#ifdef _DEBUG
void CGasOnlineView::AssertValid() const
{
	CFormView::AssertValid();
}

CGasOnlineDoc* CGasOnlineView::GetDocument() const // 非调试版本是内联的
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CGasOnlineDoc)));
	return (CGasOnlineDoc*)m_pDocument;
}
#endif //_DEBUG


// CGasOnlineView 消息处理程序
void CGasOnlineView::InitCtrol()
{
	m_ctlCSID.SetTextColor(RGB(255,0,255));	
	m_ctlCSID.SetFontSize(12);
	m_ctlCSID.SetFontBold(TRUE);
	m_ctlCSID.SetBkColor(RGB(0,0,0));

	m_ctlCSGPSLANG.SetTextColor(RGB(0,0,255));	
	m_ctlCSGPSLANG.SetFontSize(12);
	m_ctlCSGPSLANG.SetFontBold(TRUE);
	m_ctlCSGPSLANG.SetBkColor(RGB(0,0,0));

	m_ctlCSGPSLAT.SetTextColor(RGB(0,0,255));	
	m_ctlCSGPSLAT.SetFontSize(12);
	m_ctlCSGPSLAT.SetFontBold(TRUE);
	m_ctlCSGPSLAT.SetBkColor(RGB(0,0,0));

	m_ctlCSTemper.SetTextColor(RGB(0,0,255));	
	m_ctlCSTemper.SetFontSize(24);
	m_ctlCSTemper.SetFontBold(TRUE);
	m_ctlCSTemper.SetBkColor(RGB(0,0,0));

	m_ctlCSTime.SetTextColor(RGB(0,0,255));	
	m_ctlCSTime.SetFontSize(14);
	m_ctlCSTime.SetFontBold(TRUE);
	m_ctlCSTime.SetBkColor(RGB(0,0,0));

	m_ctlCSDate.SetTextColor(RGB(0,0,255));	
	m_ctlCSDate.SetFontSize(12);
	m_ctlCSDate.SetFontBold(TRUE);
	m_ctlCSDate.SetBkColor(RGB(0,0,0));

	m_ctlCSWeek.SetTextColor(RGB(0,0,255));	
	m_ctlCSWeek.SetFontSize(16);
	m_ctlCSWeek.SetFontBold(TRUE);
	m_ctlCSWeek.SetBkColor(RGB(0,0,0));

	m_ctlCSNAME.SetTextColor(RGB(255,0,255));	
	m_ctlCSNAME.SetFontSize(12);
	m_ctlCSNAME.SetFontBold(TRUE);
	m_ctlCSNAME.SetBkColor(RGB(0,0,0));

	m_ctlCSVALUE.SetTextColor(RGB(255,0,255));	
	m_ctlCSVALUE.SetFontSize(12);
	m_ctlCSVALUE.SetFontBold(TRUE);
	m_ctlCSVALUE.SetBkColor(RGB(0,0,0));

	m_ctlCSALH.SetTextColor(RGB(255,0,255));	
	m_ctlCSALH.SetFontSize(12);
	m_ctlCSALH.SetFontBold(TRUE);
	m_ctlCSALH.SetBkColor(RGB(0,0,0));

	m_ctlCSALLOW.SetTextColor(RGB(255,0,255));	
	m_ctlCSALLOW.SetFontSize(12);
	m_ctlCSALLOW.SetFontBold(TRUE);
	m_ctlCSALLOW.SetBkColor(RGB(0,0,0));


	CString strtmp;
	m_ctlCSO2.SetTextColor(RGB(255,0,255));	
	m_ctlCSO2.SetFontSize(16);
	m_ctlCSO2.SetFontBold(TRUE);
	m_ctlCSO2.SetBkColor(RGB(0,0,0));
	strtmp.Format(_T("O2"));
	m_ctlCSO2.SetWindowText(strtmp);

	m_ctlCSO2Value.SetTextColor(RGB(0,0,255));	
	m_ctlCSO2Value.SetFontSize(16);
	m_ctlCSO2Value.SetFontBold(TRUE);
	m_ctlCSO2Value.SetBkColor(RGB(0,0,0));
	m_ctlCSO2Value.SetWindowText(_T(""));

	m_ctlCSH2S.SetTextColor(RGB(255,0,255));	
	m_ctlCSH2S.SetFontSize(16);
	m_ctlCSH2S.SetFontBold(TRUE);
	m_ctlCSH2S.SetBkColor(RGB(0,0,0));
	strtmp.Format(_T("H2S"));
	m_ctlCSH2S.SetWindowText(strtmp);

	m_ctlCSH2SValue.SetTextColor(RGB(0,0,255));	
	m_ctlCSH2SValue.SetFontSize(16);
	m_ctlCSH2SValue.SetFontBold(TRUE);
	m_ctlCSH2SValue.SetBkColor(RGB(0,0,0));
	m_ctlCSH2SValue.SetWindowText(_T(""));

	m_ctlCSCO.SetTextColor(RGB(255,0,255));	
	m_ctlCSCO.SetFontSize(16);
	m_ctlCSCO.SetFontBold(TRUE);
	m_ctlCSCO.SetBkColor(RGB(0,0,0));
	strtmp.Format(_T("CO"));
	m_ctlCSCO.SetWindowText(strtmp);

	m_ctlCSCOValue.SetTextColor(RGB(0,0,255));	
	m_ctlCSCOValue.SetFontSize(16);
	m_ctlCSCOValue.SetFontBold(TRUE);
	m_ctlCSCOValue.SetBkColor(RGB(0,0,0));
	m_ctlCSCOValue.SetWindowText(_T(""));

	//
	m_ctlCSSO2.SetTextColor(RGB(255,0,255));	
	m_ctlCSSO2.SetFontSize(16);
	m_ctlCSSO2.SetFontBold(TRUE);
	m_ctlCSSO2.SetBkColor(RGB(0,0,0));
	strtmp.Format(_T("SO2"));
	m_ctlCSSO2.SetWindowText(strtmp);

	m_ctlCSSO2Value.SetTextColor(RGB(0,0,255));	
	m_ctlCSSO2Value.SetFontSize(16);
	m_ctlCSSO2Value.SetFontBold(TRUE);
	m_ctlCSSO2Value.SetBkColor(RGB(0,0,0));
	m_ctlCSSO2Value.SetWindowText(_T(""));

	m_ctlCSVOC.SetTextColor(RGB(255,0,255));	
	m_ctlCSVOC.SetFontSize(16);
	m_ctlCSVOC.SetFontBold(TRUE);
	m_ctlCSVOC.SetBkColor(RGB(0,0,0));
	strtmp.Format(_T("VOC"));
	m_ctlCSVOC.SetWindowText(strtmp);

	m_ctlCSVOCValue.SetTextColor(RGB(0,0,255));	
	m_ctlCSVOCValue.SetFontSize(16);
	m_ctlCSVOCValue.SetFontBold(TRUE);
	m_ctlCSVOCValue.SetBkColor(RGB(0,0,0));
	m_ctlCSVOCValue.SetWindowText(_T(""));

	m_ctlCSCOMB.SetTextColor(RGB(255,0,255));	
	m_ctlCSCOMB.SetFontSize(12);
	m_ctlCSCOMB.SetFontBold(TRUE);
	m_ctlCSCOMB.SetBkColor(RGB(0,0,0));
	strtmp.Format(_T("可燃气"));
	m_ctlCSCOMB.SetWindowText(strtmp);

	m_ctlCSCOMBValue.SetTextColor(RGB(0,0,255));	
	m_ctlCSCOMBValue.SetFontSize(16);
	m_ctlCSCOMBValue.SetFontBold(TRUE);
	m_ctlCSCOMBValue.SetBkColor(RGB(0,0,0));
	m_ctlCSCOMBValue.SetWindowText(_T(""));
}

void CGasOnlineView::SetStatusData()
{
	CString weekday[7] = {_T("星期日"), _T("星期一"), _T("星期二"), _T("星期三"),\
		_T("星期四"), _T("星期五"), _T("星期六")};
	CTime tm;
	CString strtmp;

	tm = CTime::GetCurrentTime();
	//strtmp += tm.Format(_T("%X"));
	SetDlgItemText(IDC_STATIC_TIME, tm.Format(_T("%X")));

	SetDlgItemText(IDC_STATIC_DATE, tm.Format(_T("%Y/%m/%d")));

	SetDlgItemText(IDC_STATIC_WEEK, weekday[tm.GetDayOfWeek()-1]);

	strtmp = _T("");//21℃
	SetDlgItemText(IDC_STATIC_TEMPERATURE, strtmp);

	strtmp.Format(_T("本机ID号：%04d"), usID);//本机ID 格式 00 + 串口XX
	SetDlgItemText(IDC_STATIC_ID, strtmp);
}

void CGasOnlineView::SetGasInfo()
{
	CString strtmp;

	//m_H2S->setValue(12, 34);
	//m_SO2->setValue(07, 45);
	//m_Fel->setValue(55, 13);

	strtmp.Format(_T("%.2f	ppm "), m_H2S->value());
	m_ctlCSH2SValue.SetWindowText(strtmp);
	strtmp.Format(_T("%.2f	ppm "), m_SO2->value());
	m_ctlCSSO2Value.SetWindowText(strtmp);
	strtmp.Format(_T("%.2f	％LEL "), m_Fel->value());
	m_ctlCSCOMBValue.SetWindowText(strtmp);
	
    strtmp = _T("东经：") + GpsPosJing+_T("'") ;
	SetDlgItemText(IDC_STATIC_LONGITUDE, strtmp);
	strtmp = _T("北纬：") + GpsPosWei+_T("'");
	SetDlgItemText(IDC_STATIC_LATITUDE, strtmp);
}
void CGasOnlineView::OnBnClickedButtonExit()
{
	CQuitTipDlg dlg;
	if(dlg.DoModal()==IDOK){
		if (m_pSerialPort1 != NULL)
		{
			m_pSerialPort1->ClosePort();

			delete m_pSerialPort1;
			m_pSerialPort1 = NULL;
		}

		if (m_pSerialPort2 != NULL)
		{
			m_pSerialPort2->ClosePort();

			delete m_pSerialPort2;
			m_pSerialPort2 = NULL;
		}

		if (m_pSerialPort3 != NULL)
		{
			m_pSerialPort3->ClosePort();

			delete m_pSerialPort3;
			m_pSerialPort3 = NULL;
		}

		/*HWND hTaskBar;
		hTaskBar = ::FindWindow(TEXT("HHTaskBar"), NULL); 
		::ShowWindow(hTaskBar,SW_SHOWNORMAL);*/

		DisableWdt();

		CMainFrame* pMainFrm = (CMainFrame*)AfxGetApp()->GetMainWnd();
		pMainFrm->PostMessage(WM_CLOSE,0,0);
	}
}

void CGasOnlineView::OnTimer(UINT_PTR nIDEvent)
{
	switch(nIDEvent)
	{
	case 1001: 
		{
			SetStatusData();
		}
		break;
	case 1002:
		{
			SetGasInfo();
		}
		break;
	case 1003:
		{
			FeedWdt();
			SendADCtrolData(0x02FF);
		}
		break;
	default:
		break;
	}

	CFormView::OnTimer(nIDEvent);
}


void CGasOnlineView::DisplayCommData()
{
	
}

void CGasOnlineView::OnPaint()
{
	CPaintDC dc(this); // device context for painting
	// TODO: Add your message handler code here
	// Do not call CFormView::OnPaint() for painting messages
	//画背景
	CRect rect;
	GetClientRect(&rect);
	CDC dcMem; 
	dcMem.CreateCompatibleDC(&dc); 
	BITMAP bitMap;
	m_bmpBackground.GetBitmap(&bitMap);
	CBitmap *pbmpOld=dcMem.SelectObject(&m_bmpBackground);
	dc.StretchBlt(0,0,rect.Width(),rect.Height(),&dcMem,0,0,bitMap.bmWidth,bitMap.bmHeight,SRCCOPY);

}

//定义串口接收主站数据函数类型
void CALLBACK CGasOnlineView::OnPort2Read(void * pOwner,BYTE* buf,DWORD bufLen)
{
	BYTE *pRecvBuf = NULL; //接收缓冲区
	//得到父对象指针
	CGasOnlineView* pThis = (CGasOnlineView*)pOwner;
	//将接收的缓冲区拷贝到pRecvBuf种
	pRecvBuf = new BYTE[bufLen];
	CopyMemory(pRecvBuf, buf, bufLen);

	//发送异步消息，表示收到串口数据，消息处理完，应释放内存
	pThis->PostMessage(WM_RECV_SERIALPORT2_DATA, WPARAM(pRecvBuf), bufLen);

}

float String2Float(CString str)
{
	float value = 0.0; float reminder = 0.0;
	int mid = str.Find('.');
	for (int i=0; i<mid; ++i)
	{
		value = value * 10 + (str[i] - '0');
	}
	for (int i=str.GetLength()-1; i>mid; --i)
	{
		reminder = reminder / 10 + (str[i] - '0');
	}

	return (value + reminder);
}

// 串口接收主站数据处理函数
LONG CGasOnlineView::OnRecvSerialPort2Data(WPARAM wParam,LPARAM lParam)
{
	const int MSGLEN = 24;
	//串口接收到的BUF长度
	DWORD dwBufLen = lParam;
	if (dwBufLen <4)
	{
		return 0;
	}
	//串口接收到的BUF
	CHAR *pBuf = (char*)wParam;		//new CHAR(dwBufLen);
	//CopyMemory(pBuf, (char*)wParam, dwBufLen);

	CString strtmp;

	for (int i=0; i<=dwBufLen-4; ++i)
	{
		if (pBuf[i] == 'G' && pBuf[i+1] == 'e' && pBuf[i+2] == 't' && pBuf[i+3] == usID)
		{
			//strtmp.Format(_T("Length is %d, %c%c%c%x"), dwBufLen, pBuf[i], pBuf[i+1], pBuf[i+2], pBuf[i+3]);
			//MessageBox(strtmp);
			BYTE sendBuf[MSGLEN];
			memset(sendBuf, 0, MSGLEN*sizeof(BYTE));
			float lat, lng;
			lat = String2Float(GpsPosWei);
			lng = String2Float(GpsPosJing);

			//lat = 1534.7;
			//lng = 13423.8;
			//m_fH2s.value = 22.13;
			//m_fSo2.value = 87.12;
			//m_fComb.value = 57.9;
			sendBuf[0] = 0x66;
			sendBuf[1] = 0x77;
			sendBuf[2] = usID;//本机ID 请更改：
			CopyMemory(&sendBuf[4], (char *)&lat, 4);
			CopyMemory(&sendBuf[8], (char *)&lng, 4);
			float value = m_H2S->value();
			CopyMemory(&sendBuf[12], (char *)&value, 4);
			value = m_SO2->value();
			CopyMemory(&sendBuf[16], (char *)&value, 4);
			value = m_Fel->value();
			CopyMemory(&sendBuf[20], (char *)&value, 4);

			m_pSerialPort2->WriteSyncPort(sendBuf, MSGLEN*sizeof(BYTE));
			break;
		}
		if (pBuf[i] == 'W' && pBuf[i+1] == 'N' && pBuf[i+2] == 'G' && pBuf[i+3] == usID)
		{
			SendADCtrolData(0x1000);
		}
		if (pBuf[i] == 'O' && pBuf[i+1] == 'F' && pBuf[i+2] == 'F' && pBuf[i+3] == usID)
		{
			SendADCtrolData(0x1100);
		}
	}

	//释放内存
	delete[] pBuf;
	pBuf = NULL;
	return 0;

}

void ValidateCmd(BYTE * buffer, int &valid, const BYTE* buf, const DWORD bufLen)
{
	int toCopy = (valid + bufLen) > RCVBUFLEN*2 ? RCVBUFLEN*2 - valid : bufLen;
	CopyMemory(buffer+valid, buf, toCopy);
	valid += toCopy;

	if (valid > 0)
	{
		for (int i=0; i<valid-1; ++i)
		{
			if (buffer[i] == 0x66 && buffer[i+1] == 0x77)
			{
				if (i>0)
				{
					CopyMemory(buffer, buffer+i, valid-i);
				}
				valid -= i;
				break;
			}
		}
	}
	if ((buffer[0] != 0x66 || buffer[1] != 0x77))
	{
		valid = 0;
	}

}
//定义串口接收SENSOR数据函数类型
void CALLBACK CGasOnlineView::OnPort1Read(void * pOwner, BYTE* buf, DWORD bufLen)
{
	//得到父对象指针
	CGasOnlineView* pThis = (CGasOnlineView*)pOwner;
	
	ValidateCmd(m_rcvBufPort1.buffer, m_rcvBufPort1.valid, buf, bufLen);
	
	if (m_rcvBufPort1.valid >= RCVBUFLEN)
	{
		pThis->PostMessage(WM_RECV_SERIALPORT1_DATA, NULL, NULL);
	}
}

float CGasOnlineView::Average(float *array, float val, int len)
{
#if 0
	return val;
#endif // BYPASS
#if 1
	float sum = 0.0f;
	array[0] = val;
	for (int i=0; i<len; ++i)
	{
		sum += array[i];
	}
	for (int i=0; i<len-1; ++i)
	{
		array[i+1] = array[i];
	}
	return sum/len;
#endif
#if 0
	float sum = 0.0f;
	array[0] = val;
	for (int i=0; i<len; ++i)
	{
		sum += array[i];
	}
	for (int i=0; i<len; ++i)
	{
		array[i] = sum/len;
	}
	return array[0];
#endif
}

// 串口接收SENSOR数据处理函数
LONG CGasOnlineView::OnRecvSerialPort1Data(WPARAM wParam, LPARAM lParam)
{
	//串口接收到的BUF
	CHAR *pBuf = (CHAR *)m_rcvBufPort1.buffer;

	m_SO2->setValue(pBuf[5], pBuf[6]);
	m_H2S->setValue(pBuf[15], pBuf[16]);
	m_Fel->setValue(pBuf[17], pBuf[18]);

    m_rcvBufPort1.valid = 0;
	return 0;
}

//定义串口接收GPS数据函数类型
void CALLBACK CGasOnlineView::OnPort3Read(void * pOwner,BYTE* buf,DWORD bufLen)
{
	BYTE *pRecvBuf = NULL; //接收缓冲区
	//得到父对象指针
	CGasOnlineView* pThis = (CGasOnlineView*)pOwner;
	//将接收的缓冲区拷贝到pRecvBuf种
	pRecvBuf = new BYTE[bufLen];
	CopyMemory(pRecvBuf, buf, bufLen);

	//发送异步消息，表示收到串口数据，消息处理完，应释放内存
	pThis->PostMessage(WM_RECV_SERIALPORT3_DATA,WPARAM(pRecvBuf), bufLen);

}

// 串口接收GPS数据处理函数
LONG CGasOnlineView::OnRecvSerialPort3Data(WPARAM wParam,LPARAM lParam)
{
	CString strOldRecv = L"";
	CString strRecv = L"";
	CString strtmp;
	//串口接收到的BUF
	CHAR *pBuf = (CHAR*)wParam;
	//Wendu = *pBuf;
	//串口接收到的BUF长度
	DWORD dwBufLen = lParam;
    strRecv = CString(pBuf);    
   //数据存放变量
	//从m_str中读取时间和经纬度
	int start = 0, end = 0;
	if((start =strRecv.Find(_T("$GPRMC"))) >= 0) 
	{
		end = strRecv.Find('$', start + 1);
		if(end > start) 
		{
			int index = 0;
			//截取得数据帧
			strtmp = strRecv.Mid(start, end - start);
			//m_str = _T("");
			start= end = 0;
			while(index <=12) 
			{
				++ index;
				end = strtmp.Find(',', start); //end指向第index个逗号
				switch(index) 
				{
				case 2://读得格林威治时间
					GpsTime = strtmp.Mid(start, end - start);
					break;
				case 4://读得纬度
					GpsPosWei = strtmp.Mid(start, end - start);
					break;
				case 5://读得纬度方向
					GpsDirWei = strtmp.Mid(start, end - start);
					break;
				case 6://读得经度
					GpsPosJing = strtmp.Mid(start, end - start);
				case 7://读得经度方向
					GpsDirJing = strtmp.Mid(start, end - start);
					break;
				case 10://读得当前日期
					GpsDate = strtmp.Mid(start, end - start);
					break;
				}
				start = end + 1;
			}
			//SetDlgItemText(IDC_STATIC_LATITUDE,GpsPosWei);

		} 
	}

	//strRecv = CString(pBuf);
	//释放内存
	delete[] pBuf;
	pBuf = NULL;
	return 0;
}

void CGasOnlineView::OnBnClickedButtonSet()
{
	CSetParaDlg dlg;
	if (dlg.DoModal()==IDOK)
	{

	}
}

void CGasOnlineView::GetParaData()
{
	return;
	
}

void CGasOnlineView::SendADCtrolData(unsigned short cmd)
{
	BYTE sendBufTOAD[32];
	memset(sendBufTOAD,0,32*sizeof(BYTE));
	sendBufTOAD[0] = 0x55;
	sendBufTOAD[1] = 0xAA;
	sendBufTOAD[2] = 0xFF & cmd >> 8;
	sendBufTOAD[3] = 0xFF & cmd;
	sendBufTOAD[4] = 0x00;
	m_pSerialPort1->WriteSyncPort(sendBufTOAD,32*sizeof(BYTE));
}

int CGasOnlineView::String2Hex(CString str, CByteArray &hexdata)
{
char singlechar=0;
    int singleResult=0;
    int totalResult=0;
    int nlength=str.GetLength();
    if (nlength<1)
    {
        return 0;
    }

    for (int i=0;i<nlength;i++)
    {
        singleResult=str[i];
        //对每个字符进行转换
        if ((singleResult>='0') && (singleResult<='9'))
        {
            singleResult=(str[i]-'0');
            
        }
        else
        {
            if ((singleResult>='a') && (singleResult<='f'))
            {
                singleResult=(str[i]-'a')+10;
            }
            else
            {
                if ((singleResult>='A') && (singleResult<='F'))
                {
                    singleResult=(str[i]-'A')+10;
                }
                else
                {
                 if ((singleResult=='.'))
                {
                    singleResult=str[i]+2;
                }
					//如果字符不为16进制则放弃处理此字符串
                    return 0;
                    
                }
                
            }
            
        }

        //保存16进制的每一位

        hexdata.Add(singleResult);
        
        //计算每个字符位置的数值
        for (int j=0;j<(nlength-1-i);j++)
        {
            singleResult=singleResult*16;
        }
        //计算总的数值
        totalResult+=singleResult;
        
    }


    return totalResult;
}

void CGasOnlineView::OnEnSetfocusEditH2s()
{
	RECT rect;
    GetClientRect( &rect );
    ClientToScreen(&rect);
    SIPINFO    si;

    si.dwImDataSize = 0;
    si.cbSize = sizeof(si);
    BOOL bSip = SipGetInfo(&si);
    if(rect.top >= 150)
    {
        si.rcSipRect.top = 0;
    }
	else
    {
		si.rcSipRect.top = 195;//half of the screen 

    }
    SipSetInfo(&si);
    SipShowIM(SIPF_ON);
}

void CGasOnlineView::OnEnKillfocusEditH2s()
{
	SipShowIM(SIPF_OFF);
    SIPINFO    si;
    si.dwImDataSize = 0;
    si.cbSize = sizeof(si);

    BOOL bSip = SipGetInfo(&si);
    si.rcSipRect.top = 195;
    SipSetInfo(&si);
}

void CGasOnlineView::OnEnSetfocusEditSo2()
{
	RECT rect;
    GetClientRect( &rect );
    ClientToScreen(&rect);
    SIPINFO    si;

    si.dwImDataSize = 0;
    si.cbSize = sizeof(si);
    BOOL bSip = SipGetInfo(&si);
    if(rect.top >= 150)
    {
        si.rcSipRect.top = 0;
    }
	else
    {
		si.rcSipRect.top = 195;//half of the screen 

    }
    SipSetInfo(&si);
    SipShowIM(SIPF_ON);
}

void CGasOnlineView::OnEnKillfocusEditSo2()
{
	SipShowIM(SIPF_OFF);
    SIPINFO    si;
    si.dwImDataSize = 0;
    si.cbSize = sizeof(si);

    BOOL bSip = SipGetInfo(&si);
    si.rcSipRect.top = 195;
    SipSetInfo(&si);
}

void CGasOnlineView::OnEnSetfocusEditComb()
{
	RECT rect;
    GetClientRect( &rect );
    ClientToScreen(&rect);
    SIPINFO    si;

    si.dwImDataSize = 0;
    si.cbSize = sizeof(si);
    BOOL bSip = SipGetInfo(&si);
    if(rect.top >= 150)
    {
        si.rcSipRect.top = 0;
    }
	else
    {
		si.rcSipRect.top = 195;//half of the screen 

    }
    SipSetInfo(&si);
    SipShowIM(SIPF_ON);
}

void CGasOnlineView::OnEnKillfocusEditComb()
{
	SipShowIM(SIPF_OFF);
    SIPINFO    si;
    si.dwImDataSize = 0;
    si.cbSize = sizeof(si);

    BOOL bSip = SipGetInfo(&si);
    si.rcSipRect.top = 195;
    SipSetInfo(&si);
}

void CGasOnlineView::ReadRegPara()
{
	wchar_t *strStop;
	
	long lResult;
	DWORD dwDisp;

	DWORD dwType = 0;
	TCHAR szKeyValue[128];
	ZeroMemory(szKeyValue,128*2);
	DWORD dwKeyValueLength = 128*2;

	DWORD dwIDLength = sizeof(DWORD);
	lResult = RegCreateKeyEx(HKEY_CURRENT_USER,_T("WiTeamSoft\\GasOnline"),0,NULL,REG_OPTION_NON_VOLATILE,0,NULL,&m_hKeyPara,&dwDisp);

	//DWORD dwID;
	//lResult = RegQueryValueEx(m_hKeyPara,_T("本机ID"),0,&dwType,(LPBYTE)&dwID,&dwIDLength);
	//if(ERROR_SUCCESS == lResult)
	//{
	//	usID = (unsigned short)dwID;
	//}
	//else
	//{
	//	usID = 2;
	//	dwID = usID;
	//	lResult = RegSetValueEx(m_hKeyPara,_T("本机ID"),0,REG_DWORD,(LPBYTE)&dwID,sizeof(DWORD));
	//}
	//
	lResult = RegQueryValueEx(m_hKeyPara,_T("硫化氢校准值"),0,&dwType,(LPBYTE)szKeyValue,&dwKeyValueLength);
	if(ERROR_SUCCESS == lResult)
	{
		m_H2S->setDelta((float)wcstod(szKeyValue, &strStop));
	}
	
	lResult = RegQueryValueEx(m_hKeyPara,_T("二氧化硫校准值"),0,&dwType,(LPBYTE)szKeyValue,&dwKeyValueLength);
	if(ERROR_SUCCESS == lResult)
	{		
		m_SO2->setDelta( (float)wcstod(szKeyValue, &strStop) );
	}

	lResult = RegQueryValueEx(m_hKeyPara,_T("可燃气校准值"),0,&dwType,(LPBYTE)szKeyValue,&dwKeyValueLength);
	if(ERROR_SUCCESS == lResult)
	{		
		m_Fel->setDelta( (float)wcstod(szKeyValue, &strStop) );
	}

}
void CGasOnlineView::setKey(HKEY key, WCHAR* subKey, GasType* gas)
{
	gas->setDelta( (float)(gas->set - gas->orignal()) ) ;

	long lResult;
	CString str;
	str.Format(_T("%.4f"), gas->delta());
	lResult = RegSetValueEx(key, subKey, 0, REG_SZ, (LPBYTE)str.GetBuffer(), 128*2);

}
void CGasOnlineView::OnBnClickedButtonH2s()
{
	UpdateData(TRUE);
	WCHAR* szKeyName = L"硫化氢校准值";

	setKey(m_hKeyPara, szKeyName, m_H2S);
}

void CGasOnlineView::OnBnClickedButtonSo2()
{
	UpdateData(TRUE);
	WCHAR* szKeyName = L"二氧化硫校准值";
	setKey(m_hKeyPara, szKeyName, m_SO2);
}

void CGasOnlineView::OnBnClickedButtonComb()
{
	UpdateData(TRUE);
	WCHAR* szKeyName = L"可燃气校准值";
	setKey(m_hKeyPara, szKeyName, m_Fel);
}