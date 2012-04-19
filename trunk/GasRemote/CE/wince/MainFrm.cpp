// MainFrm.cpp : CMainFrame 类的实现
//

#include "stdafx.h"
#include "GasOnline.h"

#include "MainFrm.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


const DWORD dwAdornmentFlags = 0; // 退出按钮

// CMainFrame

IMPLEMENT_DYNCREATE(CMainFrame, CFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CFrameWnd)
	ON_WM_CREATE()
END_MESSAGE_MAP()


// CMainFrame 构造/析构

CMainFrame::CMainFrame()
{
	// TODO: 在此添加成员初始化代码
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
	//	TRACE0("未能创建 CommandBar\n");
	//	return -1;      // 未能创建
	//}

	//m_wndCommandBar.SetBarStyle(m_wndCommandBar.GetBarStyle() | CBRS_SIZE_FIXED);


	return 0;
}

BOOL CMainFrame::PreCreateWindow(CREATESTRUCT& cs)
{
	if (!CFrameWnd::PreCreateWindow(cs))
		return FALSE;
	// TODO: 在此处通过修改
	//  CREATESTRUCT cs 来修改窗口类或样式

	return TRUE;
}



// CMainFrame 诊断

#ifdef _DEBUG
void CMainFrame::AssertValid() const
{
	CFrameWnd::AssertValid();
}
#endif //_DEBUG

// CMainFrame 消息处理程序



