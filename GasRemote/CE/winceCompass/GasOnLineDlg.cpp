// GasOnLineDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "GasOnLine.h"
#include "GasOnLineDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// CGasOnLineDlg �Ի���

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


// CGasOnLineDlg ��Ϣ�������

BOOL CGasOnLineDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// ���ô˶Ի����ͼ�ꡣ��Ӧ�ó��������ڲ��ǶԻ���ʱ����ܽ��Զ�
	//  ִ�д˲���
	SetIcon(m_hIcon, TRUE);			// ���ô�ͼ��
	SetIcon(m_hIcon, FALSE);		// ����Сͼ��

	// TODO: �ڴ���Ӷ���ĳ�ʼ������
	
	return TRUE;  // ���ǽ��������õ��ؼ������򷵻� TRUE
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
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	OnCancel();
}
