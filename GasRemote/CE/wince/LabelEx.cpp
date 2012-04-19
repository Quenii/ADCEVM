// LabelEx.cpp : implementation file
//

#include "stdafx.h"

#include "LabelEx.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLabelEx

CLabelEx::CLabelEx()
{
	m_bClicked=FALSE;
	m_bOver=FALSE;
	m_bUnderLine=FALSE;
	m_bAutoUnderLine=FALSE;
	m_bBorder=FALSE;
	m_bHighLight=TRUE;
	m_bBackUnderLine=FALSE;

	m_crText=RGB(0,0,0);
	m_crBorder=RGB(255,255,255);
	m_crBG=RGB(255,255,255);
	m_crUnderLine=RGB(0,0,0);
	m_text = _T("提示");

	m_hHandCur=AfxGetApp()->LoadCursor(IDC_HAND);
}

CLabelEx::~CLabelEx()
{
	if(m_BGBm.GetSafeHandle()!=NULL)
		m_BGBm.DeleteObject();
	if(m_MouseOverBGBm.GetSafeHandle()!=NULL)
		m_MouseOverBGBm.DeleteObject();
	if(m_ClickedBGBm.GetSafeHandle()!=NULL)
		m_ClickedBGBm.DeleteObject();
	if(m_LabelBm.GetSafeHandle()!=NULL)
		m_LabelBm.DeleteObject();
	if(m_MouseOverLabelBm.GetSafeHandle()!=NULL)
		m_MouseOverLabelBm.DeleteObject();
	if(m_ClickedLabelBm.GetSafeHandle()!=NULL)
		m_ClickedLabelBm.DeleteObject();
}


BEGIN_MESSAGE_MAP(CLabelEx, CStatic)
	//{{AFX_MSG_MAP(CLabelEx)
	ON_WM_PAINT()
	ON_WM_MOUSEMOVE()
	ON_WM_LBUTTONDOWN()
	//}}AFX_MSG_MAP
//	ON_WM_ERASEBKGND()
//ON_WM_ERASEBKGND()
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLabelEx message handlers

void CLabelEx::OnPaint() 
{
	CPaintDC dc(this); // device context for painting
	dc.SetTextColor(m_crText);
	dc.SetBkColor(m_crBG);
	CPen *pOldPen;
	CPen BorderPen;
    CBrush BGBrush,*pOldBrush;

	BGBrush.CreateSolidBrush(m_crBG); 

	pOldPen=dc.SelectObject(&BorderPen);
	pOldBrush=dc.SelectObject(&BGBrush);


//    dc.SelectObject(this->GetFont());	//nxx

	/////准备工作
	CRect rect;
	CDC MemDC;
	 
// 	BITMAP bm;
 	int nTextLeft=0,nTextTop=0; //文字输出的位置
	this->GetClientRect(&rect);
	dc.FillRect(&rect,&BGBrush);


//-----------------nxx
LOGFONT lf;
memset(&lf, 0, sizeof(LOGFONT));
if (m_bBorder)
lf.lfWeight = FW_BOLD;
//lf.lfHeight = 20;
//lf.lfQuality = CLEARTYPE_QUALITY;
lf.lfCharSet = GB2312_CHARSET;
HFONT hFontNew, hFontOld;
hFontNew = CreateFontIndirect(&lf);
hFontOld = (HFONT) SelectObject(dc, hFontNew);
//---------------------

	///输出文字
	TEXTMETRIC tm;
	dc.GetTextMetrics(&tm);
	dc.SetBkMode(TRANSPARENT);
	nTextTop=rect.top+(rect.Height()-tm.tmHeight)/2;
	char ss[512];
	int len = WideCharToMultiByte(CP_ACP,WC_COMPOSITECHECK,m_text, -1, ss, (m_text.GetLength()+1)*2, NULL, NULL) -1;
	
	nTextLeft=rect.left+(rect.Width()-tm.tmAveCharWidth*len)/2;
	if(!m_text.IsEmpty())
	{	
		dc.SetTextColor(m_crText);
		//dc.DrawText(m_text, rect, 0 ); 
		dc.ExtTextOut(nTextLeft,nTextTop,ETO_OPAQUE,rect,m_text,NULL);	//nxx
	}
	SelectObject(dc,hFontOld);											//nxx
	dc.SelectObject(pOldPen);
	dc.SelectObject(pOldBrush);
}

void CLabelEx::PreSubclassWindow() 
{
	// TODO: Add your specialized code here and/or call the base class
	DWORD dwStyle = GetStyle();
    ::SetWindowLong(GetSafeHwnd(), GWL_STYLE, dwStyle | SS_NOTIFY);
	SetFont(GetParent()->GetFont());
	CStatic::PreSubclassWindow();
}

void CLabelEx::OnMouseMove(UINT nFlags, CPoint point) 
{
	//// TODO: Add your message handler code here and/or call default
	//if (m_bOver)        // Cursor is currently over control
 //   {
 //       CRect rect;
 //       GetClientRect(rect);

 //       if (!rect.PtInRect(point))
 //       {
 //           m_bOver = FALSE;
	//		if(m_bAutoUnderLine)  ///自动下划线
	//		{
	//			this->SetUnderLine(FALSE,RGB(0,0,0));
	//		}
	//		if(m_bHighLight)   //自动高亮
	//		{
	//			///恢复原来的字体颜色
	//			this->SetTextColor(m_crBackText);
	//		}
	//		RedrawWindow();
 //           ReleaseCapture();
 //           return;
 //       }
 //   }
 //   else                      // Cursor has just moved over control
 //   {
 //       m_bOver = TRUE;
	//	if(m_bAutoUnderLine)
	//	{
	//		this->SetUnderLine(TRUE,RGB(0,0,255));
	//	}
	//	if(m_bHighLight)
	//	{
	//		m_crBackText=m_crText;
	//		this->SetTextColor(RGB(0,0,255));
	//	}
 //       RedrawWindow();
 //       SetCapture();
	//	::SetCursor(m_hHandCur);
 //   }

	//CStatic::OnMouseMove(nFlags, point);
}

void CLabelEx::SetTextColor(COLORREF crText)
{
	m_crText=crText;
}

void CLabelEx::SetUnderLine(BOOL bUnderLine, COLORREF crUnderLine)
{
	m_bUnderLine=bUnderLine;
	m_crUnderLine=crUnderLine;

}

void CLabelEx::SetBorder(BOOL bBorder, COLORREF crBorder)
{
	m_bBorder=bBorder;
	m_crBorder=crBorder;
}

void CLabelEx::SetBkColor(COLORREF crBkColor)
{
	m_crBG=crBkColor;

}

void CLabelEx::EnableAutoUnderLine(BOOL bAutoUnderLine)
{
	m_bAutoUnderLine=bAutoUnderLine;
	if(m_bAutoUnderLine)   ///设置了自动下划线
	{
		m_bBackUnderLine=m_bUnderLine;//保存原来下划线的状态
		m_bUnderLine=FALSE;
	}
	else   ///取消了自动下划线
	{
		m_bUnderLine=m_bBackUnderLine;//回复原来下划线的状态
	}
}

void CLabelEx::RedrawWindow()
{
	CStatic::RedrawWindow();
	RECT rect;
	this->GetWindowRect(&rect);
	GetParent()->ScreenToClient(&rect);
	GetParent()->InvalidateRect(&rect);
}

void CLabelEx::SetBGBitmap(UINT ID)
{
	if(m_BGBm.GetSafeHandle()!=NULL)
		m_BGBm.DeleteObject();
	m_BGBm.LoadBitmap(ID);

}

void CLabelEx::SetMouseOverBGBitmap(UINT ID)
{
	if(m_MouseOverBGBm.GetSafeHandle()!=NULL)
		m_MouseOverBGBm.DeleteObject();
	m_MouseOverBGBm.LoadBitmap(ID);
}

void CLabelEx::SetClickedBGBitmap(UINT ID)
{
	if(m_ClickedBGBm.GetSafeHandle()!=NULL)
		m_ClickedBGBm.DeleteObject();
	m_ClickedBGBm.LoadBitmap(ID);

}

void CLabelEx::SetLabelBitmap(UINT ID)
{
	if(m_LabelBm.GetSafeHandle()!=NULL)
		m_LabelBm.DeleteObject();
	m_LabelBm.LoadBitmap(ID);

}


void CLabelEx::OnLButtonDown(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	m_bClicked=!m_bClicked;
	RedrawWindow();
	CStatic::OnLButtonDown(nFlags, point);
}

void CLabelEx::SetMouseOverLabelBitmap(UINT ID)
{
	if(m_MouseOverLabelBm.GetSafeHandle()!=NULL)
		m_MouseOverLabelBm.DeleteObject();
	m_MouseOverLabelBm.LoadBitmap(ID);

}

void CLabelEx::SetClickedLabelBitmap(UINT ID)
{
	if(m_ClickedLabelBm.GetSafeHandle()!=NULL)
		m_ClickedLabelBm.DeleteObject();
	m_ClickedLabelBm.LoadBitmap(ID);

}

///自动感应字体颜色
void CLabelEx::EnableHighLight(BOOL bHighLight)
{
	m_bHighLight=bHighLight;
}

void CLabelEx::SetWindowText(LPCTSTR lpszString)
{
	m_text =lpszString;
	if (m_text.IsEmpty())
		m_text=_T("提示");
	Invalidate();
}

//BOOL CLabelEx::OnEraseBkgnd(CDC* pDC)
//{
//	// TODO: 在此添加消息处理程序代码和/或调用默认值
//
//	
//
//return TRUE; 
//
//
//}

//BOOL CLabelEx::OnEraseBkgnd(CDC* pDC)
//{
//	// TODO: 在此添加消息处理程序代码和/或调用默认值
//	 
//	 return FALSE;
//
//	//return CStatic::OnEraseBkgnd(pDC);
//}
