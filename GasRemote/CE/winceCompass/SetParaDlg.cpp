// SetParaDlg.cpp : implementation file
//

#include "stdafx.h"
#include "GasOnline.h"
#include "SetParaDlg.h"
#include "IniParse.h"

// CSetParaDlg dialog

IMPLEMENT_DYNAMIC(CSetParaDlg, CDialog)

CSetParaDlg::CSetParaDlg(UINT32 hID, UINT32 rID, CWnd* pParent /*=NULL*/)
	: CDialog(CSetParaDlg::IDD, pParent)
{
	hostID = hID;
	remoteID = rID;
}

CSetParaDlg::~CSetParaDlg()
{
}

void CSetParaDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Text(pDX, IDC_EDIT_ID, hostID);
	DDX_Text(pDX, IDC_EDIT_RID, remoteID);
}


BEGIN_MESSAGE_MAP(CSetParaDlg, CDialog)
	ON_BN_CLICKED(IDC_BUTTON_SET, &CSetParaDlg::OnBnClickedButtonSet)
	ON_BN_CLICKED(IDC_BUTTON_EXIT, &CSetParaDlg::OnBnClickedButtonExit)
	ON_WM_TIMER()
	ON_EN_CHANGE(IDC_EDIT_ID, &CSetParaDlg::OnEnChangeEditId)
	ON_EN_KILLFOCUS(IDC_EDIT_ID, &CSetParaDlg::OnEnKillfocusEditId)
	ON_EN_SETFOCUS(IDC_EDIT_ID, &CSetParaDlg::OnEnSetfocusEditId)
END_MESSAGE_MAP()


// CSetParaDlg message handlers
BOOL CSetParaDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);

	return TRUE;
}

void CSetParaDlg::OnBnClickedButtonDefault()
{


}

void CSetParaDlg::OnBnClickedButtonExit()
{
	OnCancel();
}

void CSetParaDlg::InitCtrol()
{
	
	CString strtmp;
	CIniParse iniParse; 
	//打开相应的ini文件 
	iniParse.Open(TEXT("\\ResidentFlash\\GasOnline.ini")); 
	TSTRING strValue ; 
	int iValue = -1; 
	int iALH = -1;
	int iALLOW = -1;

	
	UpdateData(FALSE);

}


void CSetParaDlg::OnTimer(UINT_PTR nIDEvent)
{
	// TODO: Add your message handler code here and/or call default
	switch(nIDEvent)
	{
	case 1001: 
		{
			CTime tm;
			tm = CTime::GetCurrentTime();
			CString strtmp;
			strtmp = tm.Format(_T("%Y-%m-%d-%H:%M:%S"));
			SetDlgItemText(IDC_EDIT_TIMESET,strtmp);
		}
		break;
	default:
		break;
	}

	CDialog::OnTimer(nIDEvent);
}

void CSetParaDlg::OnCbnSelchangeComboGasname()
{

	
}

void CSetParaDlg::SaveGasSel()
{

}

void CSetParaDlg::OnEnChangeEditAllow()
{
	
}

void CSetParaDlg::OnEnChangeEditAlh()
{
}


void CSetParaDlg::OnBnClickedCheckEnable()
{
}


void CSetParaDlg::OnEnChangeEditTimeint()
{
}

void CSetParaDlg::OnBnClickedCheckPoweral()
{
}

void CSetParaDlg::OnBnClickedCheckZigbee()
{
}

void CSetParaDlg::OnBnClickedCheckBlue()
{
}

void CSetParaDlg::OnEnChangeEditId()
{
}

void CSetParaDlg::OnEnChangeEditPassword()
{
}

void CSetParaDlg::OnBnClickedCheckOthal()
{
}


void CSetParaDlg::OnBnClickedButtonSet()
{
	UpdateData(TRUE);

	CString strtmp;
	TSTRING strValue ;
	CIniParse iniParse; 
	//打开相应的ini文件 
	if(iniParse.Open(TEXT("\\ResidentFlash\\GasOnline.ini")))
	{
		iniParse.SetPrivateProfileInt(TEXT("General"),TEXT("RemoteID"),remoteID);
		iniParse.SetPrivateProfileInt(TEXT("General"),TEXT("HOSTID"),hostID);

		iniParse.Flush();
		//remoteID = iniParse.GetPrivateProfileInt(TEXT("General"),TEXT("RemoteID"));  
		//usID = iniParse.GetPrivateProfileInt(TEXT("General"),TEXT("HOSTID"));
	}

	//strValue = m_strTimeIntvel.GetBuffer();
	//iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("上传间隔"),strValue);

	//strValue = m_strID.GetBuffer();
	//iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("本机ID"),strValue);

	//strValue = m_strPassword.GetBuffer();
	//iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("密码设置"),strValue);

	//strtmp.Format(_T("%d"),m_bIsPowerAlarm);
	//strValue = strtmp.GetBuffer();
	//iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("低电量报警"),strValue);

	//strtmp.Format(_T("%d"),m_bIsZigbeeEnable);
	//strValue = strtmp.GetBuffer();
	//iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("Zigbee传输"),strValue);

	//strtmp.Format(_T("%d"),m_bIsBlueTeethSel);
	//strValue = strtmp.GetBuffer();
	//iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("蓝牙接口"),strValue);

	//strtmp.Format(_T("%d"),m_bIsOtherAlarmEnable);
	//strValue = strtmp.GetBuffer();
	//iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("其它报警"),strValue);

	GetDlgItem(IDC_BUTTON_SET)->EnableWindow(FALSE);
}


void CSetParaDlg::OnEnSetfocusEditTimeint()
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

void CSetParaDlg::OnEnKillfocusEditTimeint()
{
	// TODO: 在此添加控件通知处理程序代码
}

void CSetParaDlg::OnEnSetfocusEditAlh()
{
}

void CSetParaDlg::OnEnKillfocusEditAlh()
{
	// TODO: 在此添加控件通知处理程序代码
}

void CSetParaDlg::OnEnSetfocusEditAllow()
{
}

void CSetParaDlg::OnEnKillfocusEditAllow()
{
}

void CSetParaDlg::OnEnKillfocusEditTimeset()
{
	
}

void CSetParaDlg::OnEnSetfocusEditTimeset()
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

void CSetParaDlg::OnEnKillfocusEditId()
{
	SipShowIM(SIPF_OFF);
    SIPINFO    si;
    si.dwImDataSize = 0;
    si.cbSize = sizeof(si);

    BOOL bSip = SipGetInfo(&si);
    si.rcSipRect.top = 195;
    SipSetInfo(&si);
}

void CSetParaDlg::OnEnSetfocusEditId()
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

void CSetParaDlg::OnEnKillfocusEditPassword()
{
}

void CSetParaDlg::OnEnSetfocusEditPassword()
{
}
