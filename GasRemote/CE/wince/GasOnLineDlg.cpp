// GasOnLineDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "GasOnLine.h"
#include "GasOnLineDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// CGasOnLineDlg 对话框

CGasOnLineDlg::CGasOnLineDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CGasOnLineDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CGasOnLineDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CGasOnLineDlg, CDialog)
#if defined(_DEVICE_RESOLUTION_AWARE) && !defined(WIN32_PLATFORM_WFSP)
	ON_WM_SIZE()
#endif
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BUTTON1, &CGasOnLineDlg::OnBnClickedButton1)
END_MESSAGE_MAP()


// CGasOnLineDlg 消息处理程序

BOOL CGasOnLineDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// 设置此对话框的图标。当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标

	// TODO: 在此添加额外的初始化代码
	
	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
}

#if defined(_DEVICE_RESOLUTION_AWARE) && !defined(WIN32_PLATFORM_WFSP)
void CGasOnLineDlg::OnSize(UINT /*nType*/, int /*cx*/, int /*cy*/)
{
	if (AfxIsDRAEnabled())
	{
		DRA::RelayoutDialog(
			AfxGetResourceHandle(), 
			this->m_hWnd, 
			DRA::GetDisplayMode() != DRA::Portrait ? 
			MAKEINTRESOURCE(IDD_GASONLINE_DIALOG_WIDE) : 
			MAKEINTRESOURCE(IDD_GASONLINE_DIALOG));
	}
}
#endif


void CGasOnLineDlg::OnBnClickedButton1()
{
	// TODO: 在此添加控件通知处理程序代码
	OnCancel();
}
