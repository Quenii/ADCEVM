#pragma once
#include "afxwin.h"
#include "Label.h"


// CQuitTipDlg 对话框

class CQuitTipDlg : public CDialog
{
	DECLARE_DYNAMIC(CQuitTipDlg)

public:
	CQuitTipDlg(CWnd* pParent = NULL);   // 标准构造函数
	virtual ~CQuitTipDlg();

// 对话框数据
	enum { IDD = IDD_DIALOG_TIP };

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	virtual BOOL OnInitDialog();

	DECLARE_MESSAGE_MAP()
public:
	CLabel m_ctlQuitTip;
};
