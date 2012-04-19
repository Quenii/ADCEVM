// SetParaDlg.cpp : implementation file
//

#include "stdafx.h"
#include "GasOnline.h"
#include "SetParaDlg.h"
#include "IniParse.h"

// CSetParaDlg dialog

IMPLEMENT_DYNAMIC(CSetParaDlg, CDialog)

CSetParaDlg::CSetParaDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSetParaDlg::IDD, pParent)
	, m_bIsThisGasSel(TRUE)
	, m_bIsPowerAlarm(TRUE)
	, m_bIsZigbeeEnable(TRUE)
	, m_bIsBlueTeethSel(FALSE)
	, m_bIsOtherAlarmEnable(FALSE)
	, m_strTimeIntvel(_T(""))
	, m_strID(_T(""))
	, m_strPassword(_T(""))
{
	m_bInit = FALSE;
}

CSetParaDlg::~CSetParaDlg()
{
}

void CSetParaDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COMBO_GASNAME, m_ctlComboGasName);
	DDX_Check(pDX, IDC_CHECK_ENABLE, m_bIsThisGasSel);
	DDX_Check(pDX, IDC_CHECK_POWERAL, m_bIsPowerAlarm);
	DDX_Check(pDX, IDC_CHECK_ZIGBEE, m_bIsZigbeeEnable);
	DDX_Check(pDX, IDC_CHECK_BLUE, m_bIsBlueTeethSel);
	DDX_Check(pDX, IDC_CHECK_OTHAL, m_bIsOtherAlarmEnable);
	DDX_Text(pDX, IDC_EDIT_TIMEINT, m_strTimeIntvel);
	DDX_Text(pDX, IDC_EDIT_ID, m_strID);
	DDX_Text(pDX, IDC_EDIT_PASSWORD, m_strPassword);
}


BEGIN_MESSAGE_MAP(CSetParaDlg, CDialog)
	ON_BN_CLICKED(IDC_BUTTON_SET, &CSetParaDlg::OnBnClickedButtonSet)
	ON_BN_CLICKED(IDC_BUTTON_DEFAULT, &CSetParaDlg::OnBnClickedButtonDefault)
	ON_BN_CLICKED(IDC_BUTTON_EXIT, &CSetParaDlg::OnBnClickedButtonExit)
	ON_BN_CLICKED(IDC_CHECK_ENABLE, &CSetParaDlg::OnBnClickedCheckEnable)
	ON_WM_TIMER()
	ON_CBN_SELCHANGE(IDC_COMBO_GASNAME, &CSetParaDlg::OnCbnSelchangeComboGasname)
	ON_EN_CHANGE(IDC_EDIT_ALH, &CSetParaDlg::OnEnChangeEditAlh)
	ON_EN_CHANGE(IDC_EDIT_ALLOW, &CSetParaDlg::OnEnChangeEditAllow)
	ON_EN_CHANGE(IDC_EDIT_TIMEINT, &CSetParaDlg::OnEnChangeEditTimeint)
	ON_BN_CLICKED(IDC_CHECK_POWERAL, &CSetParaDlg::OnBnClickedCheckPoweral)
	ON_BN_CLICKED(IDC_CHECK_ZIGBEE, &CSetParaDlg::OnBnClickedCheckZigbee)
	ON_BN_CLICKED(IDC_CHECK_BLUE, &CSetParaDlg::OnBnClickedCheckBlue)
	ON_EN_CHANGE(IDC_EDIT_ID, &CSetParaDlg::OnEnChangeEditId)
	ON_EN_CHANGE(IDC_EDIT_PASSWORD, &CSetParaDlg::OnEnChangeEditPassword)
	ON_BN_CLICKED(IDC_CHECK_OTHAL, &CSetParaDlg::OnBnClickedCheckOthal)
	ON_EN_SETFOCUS(IDC_EDIT_TIMEINT, &CSetParaDlg::OnEnSetfocusEditTimeint)
	ON_EN_KILLFOCUS(IDC_EDIT_TIMEINT, &CSetParaDlg::OnEnKillfocusEditTimeint)
	ON_EN_SETFOCUS(IDC_EDIT_ALH, &CSetParaDlg::OnEnSetfocusEditAlh)
	ON_EN_KILLFOCUS(IDC_EDIT_ALH, &CSetParaDlg::OnEnKillfocusEditAlh)
	ON_EN_SETFOCUS(IDC_EDIT_ALLOW, &CSetParaDlg::OnEnSetfocusEditAllow)
	ON_EN_KILLFOCUS(IDC_EDIT_ALLOW, &CSetParaDlg::OnEnKillfocusEditAllow)
	ON_EN_KILLFOCUS(IDC_EDIT_TIMESET, &CSetParaDlg::OnEnKillfocusEditTimeset)
	ON_EN_SETFOCUS(IDC_EDIT_TIMESET, &CSetParaDlg::OnEnSetfocusEditTimeset)
	ON_EN_KILLFOCUS(IDC_EDIT_ID, &CSetParaDlg::OnEnKillfocusEditId)
	ON_EN_SETFOCUS(IDC_EDIT_ID, &CSetParaDlg::OnEnSetfocusEditId)
	ON_EN_KILLFOCUS(IDC_EDIT_PASSWORD, &CSetParaDlg::OnEnKillfocusEditPassword)
	ON_EN_SETFOCUS(IDC_EDIT_PASSWORD, &CSetParaDlg::OnEnSetfocusEditPassword)
END_MESSAGE_MAP()


// CSetParaDlg message handlers
BOOL CSetParaDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	
	m_bInit = FALSE;
	
	InitCtrol();

	GetDlgItem(IDC_BUTTON_SET)->EnableWindow(FALSE);
	GetDlgItem(IDC_BUTTON_DEFAULT)->EnableWindow(TRUE);

	SetTimer(1001,1000,NULL);

	GetModuleFileName(NULL,m_strCurPath.GetBufferSetLength(MAX_PATH+1),MAX_PATH);
	m_strCurPath.ReleaseBuffer();
	/*MessageBox(m_strCurPath);

	FILE *fp;
	fp = fopen(("\\temp.txt"),("a")) ;
	fwrite(("12345678"),sizeof(wchar_t), 8,fp);
	fclose(fp);*/

	m_bInit = TRUE;
	return TRUE;
}

void CSetParaDlg::OnBnClickedButtonDefault()
{
	// TODO: Add your control notification handler code here
	CString strtmp;
	CIniParse iniParse; 
	//打开相应的ini文件 
	iniParse.Open(TEXT("\\ResidentFlash\\Default.ini")); 
	TSTRING strValue ; 
	int iValue = -1; 
	int iALH = -1;
	int iALLOW = -1;

	//获取特定的SECTION和KEY的数值。可以有两种返回形式，一种是TSTRING，另一种是int。 
	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体一"),TEXT("名称"));  
	iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体一"),TEXT("使能"));
	iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体一"),TEXT("报警上限"));
	iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体一"),TEXT("报警下限"));

	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("O2"));
	}

	if (iValue!=0)
	{
		m_bIsThisGasSel = (BOOL)iValue;
	}
	else{
		m_bIsThisGasSel = FALSE;
	}

	if (iALH!=0)
	{
		strtmp.Format(_T("%d"),iALH);
		SetDlgItemText(IDC_EDIT_ALH,strtmp);
	}
	else{
		strtmp.Format(_T("40"));
		SetDlgItemText(IDC_EDIT_ALH,strtmp);
	}

	if (iALLOW!=0)
	{
		strtmp.Format(_T("%d"),iALLOW);
		SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
	}
	else{
		strtmp.Format(_T("0"));
		SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体二"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("H2S"));
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体三"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("CO"));
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体四"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("SO2"));
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体五"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("VOC"));
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体六"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("可燃气体"));
	}

	iValue = iniParse.GetPrivateProfileInt(TEXT("其它参数"),TEXT("上传间隔"));
	if (iValue!=0)
	{
		strtmp.Format(_T("%d"),iValue);
		SetDlgItemText(IDC_EDIT_TIMEINT,strtmp);
	}
	else{
		strtmp.Format(_T("30"));
		SetDlgItemText(IDC_EDIT_TIMEINT,strtmp);
	}

	iValue = iniParse.GetPrivateProfileInt(TEXT("其它参数"),TEXT("本机ID"));  
	if (iValue != 0)
	{
		strtmp.Format(_T("0x%X"),iValue);
		SetDlgItemText(IDC_EDIT_ID,strtmp);
	} 
	else
	{
		strtmp.Format(_T("0x%X"),4660);
		SetDlgItemText(IDC_EDIT_ID,strtmp);
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("其它参数"),TEXT("密码设置"));  
	if (strValue != (L""))
	{
		SetDlgItemText(IDC_EDIT_PASSWORD,strValue.c_str());
	} 
	else
	{
		strtmp.Format(_T("12345678"));
		SetDlgItemText(IDC_EDIT_PASSWORD,strtmp);
	}

	UpdateData(FALSE);

	m_ctlComboGasName.SetCurSel(0);

}

void CSetParaDlg::OnBnClickedButtonExit()
{
	OnCancel();
}

void CSetParaDlg::InitCtrol()
{
	
	/*m_ctlComboGasName.AddString(_T("O2"));
	m_ctlComboGasName.AddString(_T("H2S"));
	m_ctlComboGasName.AddString(_T("CO"));
	m_ctlComboGasName.AddString(_T("SO2"));
	m_ctlComboGasName.AddString(_T("VOC"));
	m_ctlComboGasName.AddString(_T("可燃气体"));*/
	/*int nIndex = 0;
	int nCount = m_ctlComboGasName.GetCount();
	if ((nIndex != CB_ERR) && (nCount >= 1))
	{
		if (nIndex < nCount){
			m_ctlComboGasName.DeleteString(nIndex);
		}
	}*/


	
	CString strtmp;
	CIniParse iniParse; 
	//打开相应的ini文件 
	iniParse.Open(TEXT("\\ResidentFlash\\GasOnline.ini")); 
	TSTRING strValue ; 
	int iValue = -1; 
	int iALH = -1;
	int iALLOW = -1;

	//增加新的SECTION和KEY数值 
	//iniParse.SetPrivateProfileString(TEXT("VERSION_INI_FILE_NEW"),TEXT("VERSION_CONFIG_INFO_NEW"),TEXT("98600")); 

	//获取特定的SECTION和KEY的数值。可以有两种返回形式，一种是TSTRING，另一种是int。 
	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体一"),TEXT("名称"));  
	iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体一"),TEXT("使能"));
	iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体一"),TEXT("报警上限"));
	iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体一"),TEXT("报警下限"));

	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("O2"));
	}

	if (iValue!=0)
	{
		m_bIsThisGasSel = (BOOL)iValue;
	}
	else{
		m_bIsThisGasSel = FALSE;
	}

	if (iALH!=0)
	{
		strtmp.Format(_T("%d"),iALH);
		SetDlgItemText(IDC_EDIT_ALH,strtmp);
	}
	else{
		strtmp.Format(_T("40"));
		SetDlgItemText(IDC_EDIT_ALH,strtmp);
	}

	if (iALLOW!=0)
	{
		strtmp.Format(_T("%d"),iALLOW);
		SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
	}
	else{
		strtmp.Format(_T("0"));
		SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体二"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("H2S"));
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体三"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("CO"));
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体四"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("SO2"));
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体五"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("VOC"));
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("检测气体六"),TEXT("名称"));  
	if (strValue != (L""))
	{
		m_ctlComboGasName.AddString(strValue.c_str());
	} 
	else
	{
		m_ctlComboGasName.AddString(_T("可燃气体"));
	}

	iValue = iniParse.GetPrivateProfileInt(TEXT("其它参数"),TEXT("上传间隔"));
	if (iValue!=0)
	{
		strtmp.Format(_T("%d"),iValue);
		SetDlgItemText(IDC_EDIT_TIMEINT,strtmp);
	}
	else{
		strtmp.Format(_T("30"));
		SetDlgItemText(IDC_EDIT_TIMEINT,strtmp);
	}

	iValue = iniParse.GetPrivateProfileInt(TEXT("其它参数"),TEXT("本机ID"));  
	if (iValue != 0)
	{
		strtmp.Format(_T("0x%X"),iValue);
		SetDlgItemText(IDC_EDIT_ID,strtmp);
	} 
	else
	{
		strtmp.Format(_T("0x%X"),4660);
		SetDlgItemText(IDC_EDIT_ID,strtmp);
	}

	strValue = iniParse.GetPrivateProfileString(TEXT("其它参数"),TEXT("密码设置"));  
	if (strValue != (L""))
	{
		SetDlgItemText(IDC_EDIT_PASSWORD,strValue.c_str());
	} 
	else
	{
		strtmp.Format(_T("12345678"));
		SetDlgItemText(IDC_EDIT_PASSWORD,strtmp);
	}

	iValue = iniParse.GetPrivateProfileInt(TEXT("其它参数"),TEXT("低电量报警"));
	m_bIsPowerAlarm = (BOOL)iValue;

	iValue = iniParse.GetPrivateProfileInt(TEXT("其它参数"),TEXT("Zigbee传输"));
	m_bIsZigbeeEnable = (BOOL)iValue;

	iValue = iniParse.GetPrivateProfileInt(TEXT("其它参数"),TEXT("蓝牙接口"));
	m_bIsBlueTeethSel = (BOOL)iValue;

	iValue = iniParse.GetPrivateProfileInt(TEXT("其它参数"),TEXT("其它报警"));
	m_bIsOtherAlarmEnable = (BOOL)iValue;

	UpdateData(FALSE);

	m_ctlComboGasName.SetCurSel(0);

	//写到文件中 
	iniParse.Flush(); 
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
	CString strtmp;
	CIniParse iniParse; 
	//打开相应的ini文件 
	iniParse.Open(TEXT("\\ResidentFlash\\GasOnline.ini")); 
	TSTRING strValue ; 
	int iValue = -1; 
	int iALH = -1;
	int iALLOW = -1;

	int isel = m_ctlComboGasName.GetCurSel();
	switch (isel)
	{
	case 0:
		{
			//获取特定的SECTION和KEY的数值。可以有两种返回形式，一种是TSTRING，另一种是int。 
			strValue = iniParse.GetPrivateProfileString(TEXT("检测气体一"),TEXT("名称"));  
			iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体一"),TEXT("使能"));
			iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体一"),TEXT("报警上限"));
			iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体一"),TEXT("报警下限"));

			m_ctlComboGasName.SetCurSel(isel);
			m_bIsThisGasSel = (BOOL)iValue;
			UpdateData(FALSE);

			if (iALH!=0)
			{
				strtmp.Format(_T("%d"),iALH);
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}
			else{
				strtmp.Format(_T("40"));
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}

			if (iALLOW!=0)
			{
				strtmp.Format(_T("%d"),iALLOW);
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}
			else{
				strtmp.Format(_T("0"));
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}
			
		}
		break;
	case 1:
		{
			strValue = iniParse.GetPrivateProfileString(TEXT("检测气体二"),TEXT("名称"));  
			iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体二"),TEXT("使能"));
			iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体二"),TEXT("报警上限"));
			iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体二"),TEXT("报警下限"));

			m_ctlComboGasName.SetCurSel(isel);

			m_bIsThisGasSel = (BOOL)iValue;
			UpdateData(FALSE);
			
			if (iALH!=0)
			{
				strtmp.Format(_T("%d"),iALH);
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}
			else{
				strtmp.Format(_T("500"));
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}

			if (iALLOW!=0)
			{
				strtmp.Format(_T("%d"),iALLOW);
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}
			else{
				strtmp.Format(_T("0"));
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}

		}
		break;
	case 2:
		{
			strValue = iniParse.GetPrivateProfileString(TEXT("检测气体三"),TEXT("名称"));  
			iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体三"),TEXT("使能"));
			iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体三"),TEXT("报警上限"));
			iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体三"),TEXT("报警下限"));

			m_ctlComboGasName.SetCurSel(isel);

			m_bIsThisGasSel = (BOOL)iValue;
			UpdateData(FALSE);

			
			if (iALH!=0)
			{
				strtmp.Format(_T("%d"),iALH);
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}
			else{
				strtmp.Format(_T("500"));
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}

			if (iALLOW!=0)
			{
				strtmp.Format(_T("%d"),iALLOW);
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}
			else{
				strtmp.Format(_T("0"));
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}

		}
		break;
	case 3:
		{
			strValue = iniParse.GetPrivateProfileString(TEXT("检测气体四"),TEXT("名称"));  
			iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体四"),TEXT("使能"));
			iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体四"),TEXT("报警上限"));
			iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体四"),TEXT("报警下限"));

			m_ctlComboGasName.SetCurSel(isel);

			m_bIsThisGasSel = (BOOL)iValue;
			UpdateData(FALSE);

			if (iALH!=0)
			{
				strtmp.Format(_T("%d"),iALH);
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}
			else{
				strtmp.Format(_T("150"));
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}

			if (iALLOW!=0)
			{
				strtmp.Format(_T("%d"),iALLOW);
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}
			else{
				strtmp.Format(_T("0"));
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}

		}
		break;
	case 4:
		{
			strValue = iniParse.GetPrivateProfileString(TEXT("检测气体五"),TEXT("名称"));  
			iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体五"),TEXT("使能"));
			iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体五"),TEXT("报警上限"));
			iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体五"),TEXT("报警下限"));

			m_ctlComboGasName.SetCurSel(isel);

			m_bIsThisGasSel = (BOOL)iValue;
			UpdateData(FALSE);

			if (iALH!=0)
			{
				strtmp.Format(_T("%d"),iALH);
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}
			else{
				strtmp.Format(_T("1000"));
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}

			if (iALLOW!=0)
			{
				strtmp.Format(_T("%d"),iALLOW);
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}
			else{
				strtmp.Format(_T("0"));
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}

		}
		break;
	case 5:
		{
			strValue = iniParse.GetPrivateProfileString(TEXT("检测气体六"),TEXT("名称"));  
			iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体六"),TEXT("使能"));
			iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体六"),TEXT("报警上限"));
			iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体六"),TEXT("报警下限"));

			m_ctlComboGasName.SetCurSel(isel);

			m_bIsThisGasSel = (BOOL)iValue;
			UpdateData(FALSE);

			if (iALH!=0)
			{
				strtmp.Format(_T("%d"),iALH);
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}
			else{
				strtmp.Format(_T("100"));
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}

			if (iALLOW!=0)
			{
				strtmp.Format(_T("%d"),iALLOW);
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}
			else{
				strtmp.Format(_T("0"));
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}

		}
		break;
	case 6:
		{
			strValue = iniParse.GetPrivateProfileString(TEXT("检测气体七"),TEXT("名称"));  
			iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体七"),TEXT("使能"));
			iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体七"),TEXT("报警上限"));
			iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体七"),TEXT("报警下限"));

			m_ctlComboGasName.SetCurSel(isel);

			m_bIsThisGasSel = (BOOL)iValue;
			UpdateData(FALSE);

			if (iALH!=0)
			{
				strtmp.Format(_T("%d"),iALH);
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}
			else{
				strtmp.Format(_T("40"));
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}

			if (iALLOW!=0)
			{
				strtmp.Format(_T("%d"),iALLOW);
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}
			else{
				strtmp.Format(_T("0"));
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}

		}
		break;
	case 7:
		{
			strValue = iniParse.GetPrivateProfileString(TEXT("检测气体八"),TEXT("名称"));  
			iValue = iniParse.GetPrivateProfileInt(TEXT("检测气体八"),TEXT("使能"));
			iALH = iniParse.GetPrivateProfileInt(TEXT("检测气体八"),TEXT("报警上限"));
			iALLOW = iniParse.GetPrivateProfileInt(TEXT("检测气体八"),TEXT("报警下限"));

			m_ctlComboGasName.SetCurSel(isel);

			m_bIsThisGasSel = (BOOL)iValue;
			UpdateData(FALSE);

			if (iALH!=0)
			{
				strtmp.Format(_T("%d"),iALH);
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}
			else{
				strtmp.Format(_T("40"));
				SetDlgItemText(IDC_EDIT_ALH,strtmp);
			}

			if (iALLOW!=0)
			{
				strtmp.Format(_T("%d"),iALLOW);
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}
			else{
				strtmp.Format(_T("0"));
				SetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			}

		}
		break;
	default:
		break;
	}
	
}

void CSetParaDlg::SaveGasSel()
{
	CString strtmp;
	CIniParse iniParse; 
	TSTRING strValue ;
	//打开相应的ini文件 
	iniParse.Open(TEXT("\\ResidentFlash\\GasOnline.ini")); 

	UpdateData(TRUE);
		
	int isel = m_ctlComboGasName.GetCurSel();
	switch (isel)
	{
	case 0:
		{
			m_ctlComboGasName.GetLBText(isel,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体一"),TEXT("名称"),strValue);
			strtmp.Format(_T("%d"),m_bIsThisGasSel);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体一"),TEXT("使能"),strValue);
			GetDlgItemText(IDC_EDIT_ALH,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体一"),TEXT("报警上限"),strValue);
			GetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体一"),TEXT("报警下限"),strValue);
		}
		break;
	case 1:
		{
			m_ctlComboGasName.GetLBText(isel,strtmp);
			//GetDlgItemText(IDC_COMBO_GASNAME,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体二"),TEXT("名称"),strValue);
			strtmp.Format(_T("%d"),m_bIsThisGasSel);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体二"),TEXT("使能"),strValue);
			GetDlgItemText(IDC_EDIT_ALH,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体二"),TEXT("报警上限"),strValue);
			GetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体二"),TEXT("报警下限"),strValue);
		}
		break;
	case 2:
		{
			m_ctlComboGasName.GetLBText(isel,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体三"),TEXT("名称"),strValue);
			strtmp.Format(_T("%d"),m_bIsThisGasSel);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体三"),TEXT("使能"),strValue);
			GetDlgItemText(IDC_EDIT_ALH,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体三"),TEXT("报警上限"),strValue);
			GetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体三"),TEXT("报警下限"),strValue);
		}
		break;
	case 3:
		{
			m_ctlComboGasName.GetLBText(isel,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体四"),TEXT("名称"),strValue);
			strtmp.Format(_T("%d"),m_bIsThisGasSel);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体四"),TEXT("使能"),strValue);
			GetDlgItemText(IDC_EDIT_ALH,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体四"),TEXT("报警上限"),strValue);
			GetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体四"),TEXT("报警下限"),strValue);
		}
		break;
	case 4:
		{
			m_ctlComboGasName.GetLBText(isel,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体五"),TEXT("名称"),strValue);
			strtmp.Format(_T("%d"),m_bIsThisGasSel);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体五"),TEXT("使能"),strValue);
			GetDlgItemText(IDC_EDIT_ALH,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体五"),TEXT("报警上限"),strValue);
			GetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体五"),TEXT("报警下限"),strValue);
		}
		break;
	case 5:
		{
			m_ctlComboGasName.GetLBText(isel,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体六"),TEXT("名称"),strValue);
			strtmp.Format(_T("%d"),m_bIsThisGasSel);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体六"),TEXT("使能"),strValue);
			GetDlgItemText(IDC_EDIT_ALH,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体六"),TEXT("报警上限"),strValue);
			GetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体六"),TEXT("报警下限"),strValue);
		}
		break;
	case 6:
		{
			m_ctlComboGasName.GetLBText(isel,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体七"),TEXT("名称"),strValue);
			strtmp.Format(_T("%d"),m_bIsThisGasSel);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体七"),TEXT("使能"),strValue);
			GetDlgItemText(IDC_EDIT_ALH,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体七"),TEXT("报警上限"),strValue);
			GetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体七"),TEXT("报警下限"),strValue);
		}
		break;
	case 7:
		{
			m_ctlComboGasName.GetLBText(isel,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体八"),TEXT("名称"),strValue);
			strtmp.Format(_T("%d"),m_bIsThisGasSel);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体八"),TEXT("使能"),strValue);
			GetDlgItemText(IDC_EDIT_ALH,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体八"),TEXT("报警上限"),strValue);
			GetDlgItemText(IDC_EDIT_ALLOW,strtmp);
			strValue = strtmp.GetBuffer();
			iniParse.SetPrivateProfileString(TEXT("检测气体八"),TEXT("报警下限"),strValue);
		}
		break;
	default:
		break;
	}
	//写到文件中 
	iniParse.Flush(); 
}

void CSetParaDlg::OnEnChangeEditAllow()
{
	if (m_bInit)
	{
		SaveGasSel();
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
	
}

void CSetParaDlg::OnEnChangeEditAlh()
{
	if (m_bInit)
	{
		SaveGasSel();
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
}


void CSetParaDlg::OnBnClickedCheckEnable()
{
	if (m_bInit)
	{
		SaveGasSel();
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
}


void CSetParaDlg::OnEnChangeEditTimeint()
{
	if (m_bInit)
	{
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
}

void CSetParaDlg::OnBnClickedCheckPoweral()
{
	if (m_bInit)
	{
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
}

void CSetParaDlg::OnBnClickedCheckZigbee()
{
	if (m_bInit)
	{
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
}

void CSetParaDlg::OnBnClickedCheckBlue()
{
	if (m_bInit)
	{
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
}

void CSetParaDlg::OnEnChangeEditId()
{
	if (m_bInit)
	{
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
}

void CSetParaDlg::OnEnChangeEditPassword()
{
	if (m_bInit)
	{
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
}

void CSetParaDlg::OnBnClickedCheckOthal()
{
	if (m_bInit)
	{
		GetDlgItem(IDC_BUTTON_SET)->EnableWindow(TRUE);
	}
}


void CSetParaDlg::OnBnClickedButtonSet()
{
	 
	
	if (m_bInit)
	{
		SaveGasSel();
		
	}
	UpdateData(TRUE);

	CString strtmp;
	TSTRING strValue ;
	CIniParse iniParse; 
	//打开相应的ini文件 
	iniParse.Open(TEXT("\\ResidentFlash\\GasOnline.ini"));

	strValue = m_strTimeIntvel.GetBuffer();
	iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("上传间隔"),strValue);

	strValue = m_strID.GetBuffer();
	iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("本机ID"),strValue);

	strValue = m_strPassword.GetBuffer();
	iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("密码设置"),strValue);

	strtmp.Format(_T("%d"),m_bIsPowerAlarm);
	strValue = strtmp.GetBuffer();
	iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("低电量报警"),strValue);

	strtmp.Format(_T("%d"),m_bIsZigbeeEnable);
	strValue = strtmp.GetBuffer();
	iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("Zigbee传输"),strValue);

	strtmp.Format(_T("%d"),m_bIsBlueTeethSel);
	strValue = strtmp.GetBuffer();
	iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("蓝牙接口"),strValue);

	strtmp.Format(_T("%d"),m_bIsOtherAlarmEnable);
	strValue = strtmp.GetBuffer();
	iniParse.SetPrivateProfileString(TEXT("其它参数"),TEXT("其它报警"),strValue);

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

void CSetParaDlg::OnEnKillfocusEditAlh()
{
	// TODO: 在此添加控件通知处理程序代码
}

void CSetParaDlg::OnEnSetfocusEditAllow()
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

void CSetParaDlg::OnEnKillfocusEditAllow()
{
	SipShowIM(SIPF_OFF);
    SIPINFO    si;
    si.dwImDataSize = 0;
    si.cbSize = sizeof(si);

    BOOL bSip = SipGetInfo(&si);
    si.rcSipRect.top = 195;
    SipSetInfo(&si);
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
	SipShowIM(SIPF_OFF);
    SIPINFO    si;
    si.dwImDataSize = 0;
    si.cbSize = sizeof(si);

    BOOL bSip = SipGetInfo(&si);
    si.rcSipRect.top = 195;
    SipSetInfo(&si);
}

void CSetParaDlg::OnEnSetfocusEditPassword()
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
