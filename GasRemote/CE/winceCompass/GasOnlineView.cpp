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

#include "IniParse.h"

//#define BYPASS
#define HOSTID 0	//本机ID, 0 ~ 127
#define REMOTEID 0x040014	//监显中断北斗ID号
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
	ON_EN_SETFOCUS(IDC_EDIT_O2, &CGasOnlineView::OnEnSetfocusEditO2)
	ON_EN_KILLFOCUS(IDC_EDIT_O2, &CGasOnlineView::OnEnKillfocusEditO2)
	ON_EN_SETFOCUS(IDC_EDIT_CO, &CGasOnlineView::OnEnSetfocusEditCo)
	ON_EN_KILLFOCUS(IDC_EDIT_CO, &CGasOnlineView::OnEnKillfocusEditCo)

	ON_BN_CLICKED(IDC_BUTTON_H2S, &CGasOnlineView::OnBnClickedButtonH2s)
	ON_BN_CLICKED(IDC_BUTTON_SO2, &CGasOnlineView::OnBnClickedButtonSo2)
	ON_BN_CLICKED(IDC_BUTTON_COMB, &CGasOnlineView::OnBnClickedButtonComb)
	ON_BN_CLICKED(IDC_BUTTON_O2, &CGasOnlineView::OnBnClickedButtonO2)
	ON_BN_CLICKED(IDC_BUTTON_CO, &CGasOnlineView::OnBnClickedButtonCo)
	ON_BN_CLICKED(IDC_BUTTON_USB, &CGasOnlineView::OnBnClickedButtonUsb)
END_MESSAGE_MAP()

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

// CGasOnlineView 构造/析构
//SerialRcvBuffer CGasOnlineView::m_rcvBufPort1;

CGasOnlineView::CGasOnlineView()
	: CFormView(CGasOnlineView::IDD)
	, localID(0)
	, bLocationValid(FALSE)
{
	// TODO: 在此处添加构造代码

	m_bmpBackground.LoadBitmap(IDB_BITMAPBACKGROUND);	/// 加载背景

	m_pSerialPort1 = NULL;
	m_pSerialPort2 = NULL;

	//m_pSerialPort3 = NULL;

	m_SO2 = new GasType(0.07564296520423600605143721633888f);
	m_H2S = new GasType(0.05703125f);
	m_Fel = new GasType(0.038124285169653069004956157072055f);
	m_O2 = new GasType(30/(0xFFFF-0x0840));
	m_CO = new GasType(1500/(0xFFFF-0x0840));

	CIniParse iniParse; 
	iniParse.Open(TEXT("\\ResidentFlash\\GasOnline.ini")); 
	TSTRING strValue;

	remoteID = iniParse.GetPrivateProfileInt(TEXT("General"),TEXT("RemoteID"));  
	usID = iniParse.GetPrivateProfileInt(TEXT("General"),TEXT("HOSTID"));

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
	DDX_Text(pDX, IDC_EDIT_CO, m_CO->set);
	DDX_Text(pDX, IDC_EDIT_O2, m_O2->set);
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
	ReadRegPara();
	CString strtmp;

	InitCtrol();

	GetDlgItem(IDC_BUTTON_USB)->EnableWindow(TRUE);
	GetDlgItem(IDC_BUTTON_SET)->EnableWindow(FALSE);

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
		19200,
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

	// SetWdtTimeOut(10);
	// EnableWdt();
	DisableWdt();

	SetTimer(1001,61*1000,NULL);
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
	//m_ctlCSO2.SetTextColor(RGB(255,0,255));	
	//m_ctlCSO2.SetFontSize(16);
	//m_ctlCSO2.SetFontBold(TRUE);
	//m_ctlCSO2.SetBkColor(RGB(0,0,0));
	//strtmp.Format(_T("O2"));
	//m_ctlCSO2.SetWindowText(strtmp);

	m_ctlCSO2Value.SetTextColor(RGB(0,0,255));	
	m_ctlCSO2Value.SetFontSize(16);
	m_ctlCSO2Value.SetFontBold(TRUE);
	m_ctlCSO2Value.SetBkColor(RGB(0,0,0));
	m_ctlCSO2Value.SetWindowText(_T(""));

	//m_ctlCSH2S.SetTextColor(RGB(255,0,255));	
	//m_ctlCSH2S.SetFontSize(16);
	//m_ctlCSH2S.SetFontBold(TRUE);
	//m_ctlCSH2S.SetBkColor(RGB(0,0,0));
	//strtmp.Format(_T("H2S"));
	//m_ctlCSH2S.SetWindowText(strtmp);

	m_ctlCSH2SValue.SetTextColor(RGB(0,0,255));	
	m_ctlCSH2SValue.SetFontSize(16);
	m_ctlCSH2SValue.SetFontBold(TRUE);
	m_ctlCSH2SValue.SetBkColor(RGB(0,0,0));
	m_ctlCSH2SValue.SetWindowText(_T(""));

	//m_ctlCSCO.SetTextColor(RGB(255,0,255));	
	//m_ctlCSCO.SetFontSize(16);
	//m_ctlCSCO.SetFontBold(TRUE);
	//m_ctlCSCO.SetBkColor(RGB(0,0,0));
	//strtmp.Format(_T("CO"));
	//m_ctlCSCO.SetWindowText(strtmp);

	m_ctlCSCOValue.SetTextColor(RGB(0,0,255));	
	m_ctlCSCOValue.SetFontSize(16);
	m_ctlCSCOValue.SetFontBold(TRUE);
	m_ctlCSCOValue.SetBkColor(RGB(0,0,0));
	m_ctlCSCOValue.SetWindowText(_T(""));

	//m_ctlCSSO2.SetTextColor(RGB(255,0,255));	
	//m_ctlCSSO2.SetFontSize(16);
	//m_ctlCSSO2.SetFontBold(TRUE);
	//m_ctlCSSO2.SetBkColor(RGB(0,0,0));
	//strtmp.Format(_T("SO2"));
	//m_ctlCSSO2.SetWindowText(strtmp);

	m_ctlCSSO2Value.SetTextColor(RGB(0,0,255));	
	m_ctlCSSO2Value.SetFontSize(16);
	m_ctlCSSO2Value.SetFontBold(TRUE);
	m_ctlCSSO2Value.SetBkColor(RGB(0,0,0));
	m_ctlCSSO2Value.SetWindowText(_T(""));

	//m_ctlCSVOC.SetTextColor(RGB(255,0,255));	
	//m_ctlCSVOC.SetFontSize(16);
	//m_ctlCSVOC.SetFontBold(TRUE);
	//m_ctlCSVOC.SetBkColor(RGB(0,0,0));
	//strtmp.Format(_T("VOC"));
	//m_ctlCSVOC.SetWindowText(strtmp);

	m_ctlCSVOCValue.SetTextColor(RGB(0,0,255));	
	m_ctlCSVOCValue.SetFontSize(16);
	m_ctlCSVOCValue.SetFontBold(TRUE);
	m_ctlCSVOCValue.SetBkColor(RGB(0,0,0));
	m_ctlCSVOCValue.SetWindowText(_T(""));

	//m_ctlCSCOMB.SetTextColor(RGB(255,0,255));	
	//m_ctlCSCOMB.SetFontSize(12);
	//m_ctlCSCOMB.SetFontBold(TRUE);
	//m_ctlCSCOMB.SetBkColor(RGB(0,0,0));
	//strtmp.Format(_T("可燃气"));
	//m_ctlCSCOMB.SetWindowText(strtmp);

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

	strtmp.Format(_T("%.2f	ppm "), m_H2S->value());
	m_ctlCSH2SValue.SetWindowText(strtmp);
	strtmp.Format(_T("%.2f	ppm "), m_SO2->value());
	m_ctlCSSO2Value.SetWindowText(strtmp);
	strtmp.Format(_T("%.2f	％LEL "), m_Fel->value());
	m_ctlCSCOMBValue.SetWindowText(strtmp);
	strtmp.Format(_T("%.2f	ppm "), m_CO->value());
	m_ctlCSCOValue.SetWindowText(strtmp);
	strtmp.Format(_T("%.2f	％ "), m_O2->value());
	m_ctlCSO2Value.SetWindowText(strtmp);

	strtmp.Format(_T("东经：%d°%d'%d\""), gLng.deg, gLng.min, gLng.sec);
	SetDlgItemText(IDC_STATIC_LONGITUDE, strtmp);
	strtmp.Format(_T("北纬：%d°%d'%d\""), gLat.deg, gLat.min, gLat.sec);
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

		DisableWdt();

		CMainFrame* pMainFrm = (CMainFrame*)AfxGetApp()->GetMainWnd();
		pMainFrm->PostMessage(WM_CLOSE,0,0);
	}
}

void CGasOnlineView::OnTimer(UINT_PTR nIDEvent)
{
	static int cycles = 0;
	switch(nIDEvent)
	{
	case 1001: 
		{
			if (cycles == 30 || (!bLocationValid))
			{
				cycles = 0;
				SendDWSQ();
			}
			else
			{
				SendSensorData();
			}
			cycles += 1;
		}
		break;
	case 1002:
		{
			SetStatusData();
			SetGasInfo();
		}
		break;
	case 1003:
		{
			FeedWdt();
			SendADCtrolData(0x0200);
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

	CRect rect;
	GetClientRect(&rect);
	CDC dcMem; 
	dcMem.CreateCompatibleDC(&dc); 
	BITMAP bitMap;
	m_bmpBackground.GetBitmap(&bitMap);
	CBitmap *pbmpOld=dcMem.SelectObject(&m_bmpBackground);
	dc.StretchBlt(0,0,rect.Width(),rect.Height(),&dcMem,0,0,bitMap.bmWidth,bitMap.bmHeight,SRCCOPY);

}

void CGasOnlineView::ValidateCmd(BYTE * buffer, int &valid, const BYTE* buf, const DWORD bufLen)
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

//定义串口接收主站数据函数类型
void CALLBACK CGasOnlineView::OnPort2Read(void * pOwner, BYTE* buf, DWORD bufLen)
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
void CGasOnlineView::SendDWSQ()
{
	const int MSGLEN = 22;

	BYTE sendBuf[MSGLEN];
	memset(sendBuf, 0, MSGLEN*sizeof(BYTE));

	sendBuf[0] = '$'; sendBuf[1] = 'D'; sendBuf[2] = 'W';
	sendBuf[3] = 'S'; sendBuf[4] = 'Q'; 
	sendBuf[5] = 0;	sendBuf[6] = MSGLEN; 
	sendBuf[7] = (localID >> 16) & 0xFF; 
	sendBuf[8] = (localID >> 8) & 0xFF; sendBuf[9] = (localID) & 0xFF;
	sendBuf[10] = 0x04; 
	sendBuf[11] = 0; sendBuf[12] = 0; sendBuf[13] = 0; sendBuf[14] = 0; 
	sendBuf[15] = 0; sendBuf[16] = 0; sendBuf[17] = 0; sendBuf[18] = 0;
	sendBuf[19] = 0; sendBuf[20] = 0; 

	for (int i=0; i<MSGLEN-1; ++i)
	{
		sendBuf[MSGLEN-1] = sendBuf[MSGLEN-1] ^ sendBuf[i];
	}

	m_pSerialPort2->WriteSyncPort(sendBuf, MSGLEN*sizeof(BYTE));
	TRACE(_T("$DWSQ sent!\n"));
}

void CGasOnlineView::SendSensorData()
{
	const int DATALEN = 32;
	const int MSGLEN = 18 + DATALEN;

	BYTE sendBuf[MSGLEN];
	memset(sendBuf, 0, MSGLEN*sizeof(BYTE));

	//lat = 1534.7;
	//lng = 13423.8;
	//m_fH2s.value = 22.13;
	//m_fSo2.value = 87.12;
	//m_fComb.value = 57.9;

	sendBuf[0] = '$'; sendBuf[1] = 'T'; sendBuf[2] = 'X';
	sendBuf[3] = 'S'; sendBuf[4] = 'Q'; 
	sendBuf[5] = 0;	sendBuf[6] = MSGLEN; 
	sendBuf[7] = (localID >> 16) & 0xFF; 
	sendBuf[8] = (localID >> 8) & 0xFF; sendBuf[9] = (localID) & 0xFF;
	sendBuf[10] = 0x46; 
	sendBuf[11] = (remoteID >> 16) & 0xFF; 
	sendBuf[12] = (remoteID >> 8) & 0xFF; sendBuf[13] = (remoteID >> 0) & 0xFF;
	sendBuf[14] = (DATALEN*8) >> 8; sendBuf[15] = (DATALEN*8) & 0xFF; sendBuf[16] = 0;
	sendBuf[17] = 0x66;
	sendBuf[18] = 0x77;
	sendBuf[19] = usID;
	CopyMemory(&sendBuf[21], (char *)&gLat.fDeg, 4);
	CopyMemory(&sendBuf[25], (char *)&gLng.fDeg, 4);
	float value = m_H2S->value();
	CopyMemory(&sendBuf[29], (char *)&value, 4);
	value = m_SO2->value();
	CopyMemory(&sendBuf[33], (char *)&value, 4);
	value = m_Fel->value();
	CopyMemory(&sendBuf[37], (char *)&value, 4);
	value = m_O2->value();
	CopyMemory(&sendBuf[41], (char *)&value, 4);
	value = m_CO->value();
	CopyMemory(&sendBuf[45], (char *)&value, 4);
	for (int i=0; i<MSGLEN-1; ++i)
	{
		sendBuf[MSGLEN-1] = sendBuf[MSGLEN-1] ^ sendBuf[i];
	}

	m_pSerialPort2->WriteSyncPort(sendBuf, MSGLEN*sizeof(BYTE));

	TRACE(_T("$TXSQ sent!\n"));

}
// 串口接收主站数据处理函数
LONG CGasOnlineView::OnRecvSerialPort2Data(WPARAM wParam, LPARAM lParam)
{
	BYTE * buf = (BYTE*)wParam;
	TRACE(_T("ch2: valid: %d, len: %d\n"), m_rcvBufPort2.valid, (int)lParam);
	m_rcvBufPort2.append(buf, (int)lParam);
	delete []buf;

	int indexTx = m_rcvBufPort2.indexOf("$TXXX", 5);
	int indexDw = m_rcvBufPort2.indexOf("$DWXX", 5);
	int indexFk = m_rcvBufPort2.indexOf("$FKXX", 5);

	if (indexFk >= 0 && m_rcvBufPort2.valid-indexFk >= 10)
	{
		BYTE * offset = m_rcvBufPort2.buffer + indexFk;
		localID = (offset[7] << 16) + (offset[8] << 8) + (offset[9] << 0);
		m_rcvBufPort2.remove(indexFk, 10);

	}
	
	if(indexDw >= 0 && m_rcvBufPort2.valid-indexDw >= 26)
	{
		bLocationValid = true;
		BYTE * offset = m_rcvBufPort2.buffer + indexDw;
		gLng.fromFloat(offset[18]+offset[19]/60.0f+offset[20]/3600.0f);
		gLat.fromFloat(offset[22]+offset[23]/60.0f+offset[24]/3600.0f);
		m_rcvBufPort2.remove(indexDw, 26);

	}

	if (indexTx >= 0 && m_rcvBufPort2.valid-indexTx >= 22)
	{
		BYTE * offset = m_rcvBufPort2.buffer + indexTx + 18;

		if (offset[0] == 'G' && offset[1] == 'e' && offset[2] == 't')
		{
		}
		
		if (offset[0] == 'W' && offset[1] == 'N' && offset[2] == 'G')
		{
			SendADCtrolData(0x1000);
			m_rcvBufPort2.remove(indexTx, 22);
		}

		if (offset[0] == 'O' && offset[1] == 'F' && offset[2] == 'F')
		{
			SendADCtrolData(0x1100);
			m_rcvBufPort2.remove(indexTx, 22);
		}

	}
	
	return 0;
}

//定义串口接收SENSOR数据函数类型
void CALLBACK CGasOnlineView::OnPort1Read(void * pOwner, BYTE* buf, DWORD bufLen)
{
	//得到父对象指针
	CGasOnlineView* pThis = (CGasOnlineView*)pOwner;

	//将接收的缓冲区拷贝到pRecvBuf种
	BYTE * pRecvBuf = new BYTE[bufLen];
	CopyMemory(pRecvBuf, buf, bufLen);

	//发送异步消息，表示收到串口数据，消息处理完，应释放内存
	pThis->PostMessage(WM_RECV_SERIALPORT1_DATA, WPARAM(pRecvBuf), bufLen);
}

// 串口接收SENSOR数据处理函数
LONG CGasOnlineView::OnRecvSerialPort1Data(WPARAM wParam, LPARAM lParam)
{
	const int DATALEN = 20;
	BYTE * buf = (BYTE*)wParam;
	TRACE(_T("ch1: valid: %d, len: %d\n"), m_rcvBufPort1.valid, (int)lParam);
	m_rcvBufPort1.append(buf, (int)lParam);
	delete []buf;

	//串口接收到的BUF
	CHAR *pBuf = (CHAR *)m_rcvBufPort1.buffer;
	char slice[3]; slice[0] = 0x66; slice[1] = 0x77; slice[2] = 0x02; 
	int t = m_rcvBufPort1.indexOf(slice, 3);
	if ( t >= 0 )
	{
		m_rcvBufPort1.remove(0, t);
	}else
	{
		m_rcvBufPort1.clear();
	}
	
	if (m_rcvBufPort1.valid > DATALEN)
	{
		BYTE * offset = m_rcvBufPort1.buffer;
		m_SO2->setValue(pBuf[9], pBuf[10]);
		m_H2S->setValue(pBuf[3], pBuf[4]);
		m_Fel->setValue(pBuf[11], pBuf[12]);

		m_O2->setValue(offset[5], offset[6]);
		m_CO->setValue(offset[7], offset[8]);

		m_rcvBufPort1.clear();
	}
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
	BYTE cmdbuf[2];
	memset(cmdbuf, 0, 2*sizeof(BYTE));
	cmdbuf[0] = 0xFF & (cmd >> 8);
	cmdbuf[1] = 0xFF & cmd;
	SendCmd(cmdbuf, 2);
}

void CGasOnlineView::SendADCtrolData(unsigned short cmd, unsigned char para)
{
	BYTE cmdbuf[3];
	memset(cmdbuf, 0, 3*sizeof(BYTE));
	cmdbuf[0] = para;
	cmdbuf[1] = 0xFF & (cmd >> 8);
	cmdbuf[2] = 0xFF & cmd;
	SendCmd(cmdbuf, 3);
}

void CGasOnlineView::SendCmd(const BYTE* cmd, int len)
{
	BYTE sendBufTOAD[32];
	memset(sendBufTOAD, 0, 32*sizeof(BYTE));

	sendBufTOAD[0] = 0x55;
	sendBufTOAD[1] = 0xAA;

	memcpy(sendBufTOAD+2, cmd, len);
	for (int i=0; i<31; ++i)
	{
		sendBufTOAD[31] += sendBufTOAD[i];
	}
	m_pSerialPort1->WriteSyncPort(sendBufTOAD,32*sizeof(BYTE));

}

void CGasOnlineView::SetEditFocus()
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

void CGasOnlineView::KillEditFocus()
{
	SipShowIM(SIPF_OFF);
	SIPINFO    si;
	si.dwImDataSize = 0;
	si.cbSize = sizeof(si);

	BOOL bSip = SipGetInfo(&si);
	si.rcSipRect.top = 195;
	SipSetInfo(&si);
}
void CGasOnlineView::OnEnSetfocusEditH2s()
{
	SetEditFocus();
}

void CGasOnlineView::OnEnKillfocusEditH2s()
{
	KillEditFocus();
}

void CGasOnlineView::OnEnSetfocusEditSo2()
{
	SetEditFocus();
}

void CGasOnlineView::OnEnKillfocusEditSo2()
{
	KillEditFocus();
}

void CGasOnlineView::OnEnSetfocusEditComb()
{
	SetEditFocus();
}

void CGasOnlineView::OnEnKillfocusEditComb()
{
	KillEditFocus();
}

void CGasOnlineView::OnEnSetfocusEditCo()
{
	SetEditFocus();
}

void CGasOnlineView::OnEnKillfocusEditCo()
{
	KillEditFocus();
}

void CGasOnlineView::OnEnSetfocusEditO2()
{
	SetEditFocus();
}

void CGasOnlineView::OnEnKillfocusEditO2()
{
	KillEditFocus();
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

	lResult = RegQueryValueEx(m_hKeyPara,_T("氧气校准值"),0,&dwType,(LPBYTE)szKeyValue,&dwKeyValueLength);
	if(ERROR_SUCCESS == lResult)
	{		
		m_O2->setDelta( (float)wcstod(szKeyValue, &strStop) );
	}

	lResult = RegQueryValueEx(m_hKeyPara,_T("一氧化碳校准值"),0,&dwType,(LPBYTE)szKeyValue,&dwKeyValueLength);
	if(ERROR_SUCCESS == lResult)
	{		
		m_CO->setDelta( (float)wcstod(szKeyValue, &strStop) );
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

	unsigned short cali = 0;
	unsigned char set = m_H2S->set;
	cali += 0 << 8;
	cali += set;
	SendADCtrolData(cali, 0x20);
}

void CGasOnlineView::OnBnClickedButtonSo2()
{
	UpdateData(TRUE);
	WCHAR* szKeyName = L"二氧化硫校准值";
	setKey(m_hKeyPara, szKeyName, m_SO2);

	unsigned short cali = 0;
	unsigned char set = m_SO2->set;
	cali += 3 << 8;
	cali += set;
	SendADCtrolData(cali, 0x20);
}

void CGasOnlineView::OnBnClickedButtonComb()
{
	UpdateData(TRUE);
	WCHAR* szKeyName = L"可燃气校准值";
	setKey(m_hKeyPara, szKeyName, m_Fel);

	unsigned short cali = 0;
	unsigned char set = m_Fel->set;
	cali += 4 << 8;
	cali += set;
	SendADCtrolData(cali, 0x20);
}

void CGasOnlineView::OnBnClickedButtonO2()
{
	UpdateData(TRUE);
	WCHAR* szKeyName = L"氧气校准值";
	setKey(m_hKeyPara, szKeyName, m_O2);

	unsigned short cali = 0;
	unsigned char set = m_O2->set;
	cali += 1 << 8;
	cali += set;
	SendADCtrolData(cali, 0x20);
}

void CGasOnlineView::OnBnClickedButtonCo()
{
	UpdateData(TRUE);
	WCHAR* szKeyName = L"一氧化碳校准值";
	setKey(m_hKeyPara, szKeyName, m_CO);

	unsigned short cali = 0;
	unsigned char set = m_CO->set;
	cali += 2 << 8;
	cali += set;
	SendADCtrolData(cali, 0x20);
}
float CGasOnlineView::Average(float *array, float val, int len)
{
#if 0
	return val;
#endif // BYPASS
	float sum = 0.0f;
	array[0] = val;
	for (int i=0; i<len; ++i)
	{
		sum += array[i];
	}
#if 1
	for (int i=0; i<len-1; ++i)
	{
		array[i+1] = array[i];
	}
	return sum/len;
#endif
#if 0
	for (int i=0; i<len; ++i)
	{
		array[i] = sum/len;
	}
	return array[0];
#endif
}


void CGasOnlineView::OnBnClickedButtonUsb()
{
	// TODO: 在此添加控件通知处理程序代码
	const int SIZE = 21;
	BYTE cmd[SIZE];
	memset(cmd, 0, SIZE);
	cmd[0] = 0x50;

	CIniParse iniParse; 
	iniParse.Open(TEXT("\\ResidentFlash\\GasOnline.ini")); 
	TSTRING strValue;

	UINT32 para = iniParse.GetPrivateProfileInt(TEXT("Gas1"),TEXT("Coe"));  
	for (int i=0; i<4; ++i)
	{
		cmd[1+i] = (para >> (8*(3-i))) & 0xFF;
	}
	para = iniParse.GetPrivateProfileInt(TEXT("Gas2"),TEXT("Coe"));  
	for (int i=0; i<4; ++i)
	{
		cmd[5+i] = (para >> (8*(3-i))) & 0xFF;
	}
	para = iniParse.GetPrivateProfileInt(TEXT("Gas3"),TEXT("Coe"));  
	for (int i=0; i<4; ++i)
	{
		cmd[9+i] = (para >> (8*(3-i))) & 0xFF;
	}
	para = iniParse.GetPrivateProfileInt(TEXT("Gas4"),TEXT("Coe"));  
	for (int i=0; i<4; ++i)
	{
		cmd[13+i] = (para >> (8*(3-i))) & 0xFF;
	}
	para = iniParse.GetPrivateProfileInt(TEXT("Gas5"),TEXT("Coe"));  
	for (int i=0; i<4; ++i)
	{
		cmd[17+i] = (para >> (8*(3-i))) & 0xFF;
	}

	//cmd[1] = 0x07;
	//cmd[2] = 0;
	//cmd[3] = 0x04;
	//cmd[4] = 0x1a;

	//cmd[5] = 0x03;
	//cmd[6] = 0xd2;
	//cmd[7] = 0x03;
	//cmd[8] = 0;

	//cmd[9] = 0x07;
	//cmd[10] = 0;
	//cmd[11] = 0x04;
	//cmd[12] = 0;

	//cmd[13] = 0x07;
	//cmd[14] = 0;
	//cmd[15] = 0x04;
	//cmd[16] = 0;

	//cmd[17] = 0x0f;
	//cmd[18] = 0xff;
	//cmd[19] = 0x54;
	//cmd[20] = 0x28;

	SendCmd(cmd, SIZE);
}
