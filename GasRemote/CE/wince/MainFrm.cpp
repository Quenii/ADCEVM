// MainFrm.cpp : CMainFrame ���ʵ��
//

#include "stdafx.h"
#include "GasOnline.h"

#include "MainFrm.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


const DWORD dwAdornmentFlags = 0; // �˳���ť

// CMainFrame

IMPLEMENT_DYNCREATE(CMainFrame, CFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CFrameWnd)
	ON_WM_CREATE()
END_MESSAGE_MAP()


// CMainFrame ����/����

CMainFrame::CMainFrame()
{
	// TODO: �ڴ���ӳ�Ա��ʼ������
}

CMainFrame::~CMainFrame()
{
}

int CMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CFrameWnd::OnCreate(lpCreateStruct) == -1)
		return -1;

	LONG   dwStyle = ::GetWindowLong(GetSafeHwnd(),GWL_STYLE);
	dwStyle &=~(WS_CAPTION|WS_THICKFRAME|WS_POPUP|WS_OVERLAPPED|WS_MINIMIZEBOX|WS_MAXIMIZEBOX|WS_BORDER); 
	::SetWindowLong(GetSafeHwnd(),GWL_STYLE,dwStyle);


	//if (!m_wndCommandBar.Create(this) ||
	//    !m_wndCommandBar.InsertMenuBar(IDR_MAINFRAME) ||
	//    !m_wndCommandBar.AddAdornments(dwAdornmentFlags))
	//{
	//	TRACE0("δ�ܴ��� CommandBar\n");
	//	return -1;      // δ�ܴ���
	//}

	//m_wndCommandBar.SetBarStyle(m_wndCommandBar.GetBarStyle() | CBRS_SIZE_FIXED);


	return 0;
}

BOOL CMainFrame::PreCreateWindow(CREATESTRUCT& cs)
{
	if (!CFrameWnd::PreCreateWindow(cs))
		return FALSE;
	// TODO: �ڴ˴�ͨ���޸�
	//  CREATESTRUCT cs ���޸Ĵ��������ʽ

	return TRUE;
}



// CMainFrame ���

#ifdef _DEBUG
void CMainFrame::AssertValid() const
{
	CFrameWnd::AssertValid();
}
#endif //_DEBUG

// CMainFrame ��Ϣ�������



