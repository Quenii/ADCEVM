#pragma once
#include "afxwin.h"


// CSetParaDlg dialog

class CSetParaDlg : public CDialog
{
	DECLARE_DYNAMIC(CSetParaDlg)

public:
	CSetParaDlg(CWnd* pParent = NULL);   // standard constructor
	virtual ~CSetParaDlg();

// Dialog Data
	enum { IDD = IDD_DIALOG_SETUP };

	BOOL m_bInit;
	CString m_strCurPath;

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	virtual BOOL OnInitDialog();

private:
	void InitCtrol();
	void SaveGasSel();

public:
	CComboBox m_ctlComboGasName;
	BOOL m_bIsThisGasSel;
	BOOL m_bIsPowerAlarm;
	BOOL m_bIsZigbeeEnable;
	BOOL m_bIsBlueTeethSel;
	BOOL m_bIsOtherAlarmEnable;
	CString m_strTimeIntvel;
	CString m_strID;
	CString m_strPassword;
public:
	DECLARE_MESSAGE_MAP()
	afx_msg void OnBnClickedButtonSet();
	afx_msg void OnBnClickedButtonDefault();
	afx_msg void OnBnClickedButtonExit();
	afx_msg void OnBnClickedCheckEnable();
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnCbnSelchangeComboGasname();
	afx_msg void OnEnChangeEditAlh();
	afx_msg void OnEnChangeEditAllow();
	afx_msg void OnEnChangeEditTimeint();
	afx_msg void OnBnClickedCheckPoweral();
	afx_msg void OnBnClickedCheckZigbee();
	afx_msg void OnBnClickedCheckBlue();
	afx_msg void OnEnChangeEditId();
	afx_msg void OnEnChangeEditPassword();
	afx_msg void OnBnClickedCheckOthal();
	afx_msg void OnEnSetfocusEditTimeint();
	afx_msg void OnEnKillfocusEditTimeint();
	afx_msg void OnEnSetfocusEditAlh();
	afx_msg void OnEnKillfocusEditAlh();
	afx_msg void OnEnSetfocusEditAllow();
	afx_msg void OnEnKillfocusEditAllow();
	afx_msg void OnEnKillfocusEditTimeset();
	afx_msg void OnEnSetfocusEditTimeset();
	afx_msg void OnEnKillfocusEditId();
	afx_msg void OnEnSetfocusEditId();
	afx_msg void OnEnKillfocusEditPassword();
	afx_msg void OnEnSetfocusEditPassword();
};
