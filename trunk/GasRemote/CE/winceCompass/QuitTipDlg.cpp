// QuitTipDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "GasOnline.h"
#include "QuitTipDlg.h"


// CQuitTipDlg �Ի���

IMPLEMENT_DYNAMIC(CQuitTipDlg, CDialog)

CQuitTipDlg::CQuitTipDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CQuitTipDlg::IDD, pParent)
{

}

CQuitTipDlg::~CQuitTipDlg()
{
}

void CQuitTipDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_STATIC_TIP, m_ctlQuitTip);
}

BOOL CQuitTipDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	m_ctlQuitTip.SetTextColor(RGB(0,0,255));	
	m_ctlQuitTip.SetFontSize(16);
	m_ctlQuitTip.SetFontBold(TRUE);
	m_ctlQuitTip.SetBkColor(RGB(0,0,0));
	m_ctlQuitTip.SetWindowText(_T("��ȷ��Ҫ�˳��𣡣���"));

	return TRUE;
}

BEGIN_MESSAGE_MAP(CQuitTipDlg, CDialog)
END_MESSAGE_MAP()


// CQuitTipDlg ��Ϣ�������
