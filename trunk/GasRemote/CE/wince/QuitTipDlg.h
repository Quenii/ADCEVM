#pragma once
#include "afxwin.h"
#include "Label.h"


// CQuitTipDlg �Ի���

class CQuitTipDlg : public CDialog
{
	DECLARE_DYNAMIC(CQuitTipDlg)

public:
	CQuitTipDlg(CWnd* pParent = NULL);   // ��׼���캯��
	virtual ~CQuitTipDlg();

// �Ի�������
	enum { IDD = IDD_DIALOG_TIP };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��
	virtual BOOL OnInitDialog();

	DECLARE_MESSAGE_MAP()
public:
	CLabel m_ctlQuitTip;
};
