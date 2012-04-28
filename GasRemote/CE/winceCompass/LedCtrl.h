#if !defined(AFX_LEDCTRL_H__870D0FEE_E2E1_469E_8008_264C58FD750E__INCLUDED_)
#define AFX_LEDCTRL_H__870D0FEE_E2E1_469E_8008_264C58FD750E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// LedCtrl.h : header file
//
//   128
//    _
//  4|2|64
//    -
//  8|_|32
//    16
const DWORD NOTCH0 = 256;	//表示第:画
const DWORD NOTCH1 = 128;	//表示第1画
const DWORD NOTCH2 = 64;	//表示第2画
const DWORD NOTCH3 = 32;	//表示第3画
const DWORD NOTCH4 = 16;	//表示第4画
const DWORD NOTCH5 = 8;		//表示第5画
const DWORD NOTCH6 = 4;		//表示第6画
const DWORD NOTCH7 = 2;		//表示第7画

const DWORD STCOUNTER0  = 252;		//代表画0时，需要笔画组合
const DWORD STCOUNTER1  = 96;		//代表画1时，需要笔画组合
const DWORD STCOUNTER2  = 218;		//代表画2时，需要笔画组合
const DWORD STCOUNTER3  = 242;		//代表画3时，需要笔画组合
const DWORD STCOUNTER4  = 102;		//代表画4时，需要笔画组合
const DWORD STCOUNTER5  = 182;		//代表画5时，需要笔画组合
const DWORD STCOUNTER6  = 190;		//代表画6时，需要笔画组合
const DWORD STCOUNTER7  = 224;		//代表画7时，需要笔画组合
const DWORD STCOUNTER8  = 254;		//代表画8时，需要笔画组合
const DWORD STCOUNTER9  = 246;		//代表画9时，需要笔画组合
const DWORD STCOUNTER10  = 2;		//代表画-时，需要笔画组合
const DWORD STCOUNTER11 = 256;		//代表画:时，需要笔画组合

const DWORD STCOUNTERALL  = 999;	//代表绘制所有


class CMemDC : public CDC
{
private:
	CBitmap m_bitmap;		//离屏位图
	CBitmap* m_oldBitmap;	//存储旧位图
	CDC* m_pDC;				//存储绘图环境
	CRect m_rect;			//存储控件矩形区域
	BOOL m_bMemDC;			//判断绘图环境是否准备好
public:
	//构造函数
	CMemDC(CDC *pDC,CRect rect=CRect(0,0,0,0)) : CDC(), m_oldBitmap(NULL), m_pDC(pDC)
	{
		//判断绘图是否为空
		ASSERT(m_pDC != NULL);
		//判断绘图环境是否准备好
		m_bMemDC = !pDC->IsPrinting();
		if(m_bMemDC)
		{
			//创建离屏绘制环境
			CreateCompatibleDC(pDC);
			if(rect == CRect(0,0,0,0))
				pDC->GetClipBox(&m_rect);
			else
				m_rect = rect;

			//创建离屏位图
			m_bitmap.CreateCompatibleBitmap(pDC,m_rect.Width(),m_rect.Height());
			m_oldBitmap = SelectObject(&m_bitmap);
		}
		else
		{
			m_hDC = pDC->m_hDC;
			m_hAttribDC = pDC->m_hAttribDC;
		}
	}

	//析构函数
	~CMemDC()
	{
		if (m_bMemDC)
		{
			//将离屏位图绘制到屏幕上
			m_pDC->BitBlt(m_rect.left,m_rect.top,m_rect.Width(),m_rect.Height(),
				this, m_rect.left,m_rect.top,SRCCOPY);
			//将旧位图重新选择到绘图环境
			SelectObject(m_oldBitmap);
		}
		else
		{
			m_hDC = m_hAttribDC = NULL;
		}
	}
	//指针操作符操作
	CMemDC* operator->() {return this;}

	//指针操作符操作
	operator CMemDC*() {return this;}
};



/////////////////////////////////////////////////////////////////////////////
// CLedCtrl window

class CLedCtrl : public CStatic
{
// Construction
public:
	CLedCtrl();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLedCtrl)
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CLedCtrl();

	// Generated message map functions
protected:
	//{{AFX_MSG(CLedCtrl)
	afx_msg void OnPaint();
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()

public:
	//设置是否绘制淡入淡出效果开关变量
	void SetDrawFaded(bool bState = true);
	//设置前景色
	void SetColorForeGround(COLORREF crColor = 0xffffffff);
	//设置背景色
	void SetColorBackGround(COLORREF crColor = 0xffffffff);
	//显示数字
	void Display( int nNumber );	
	void Display( CString ss );	
protected:
	//绘制数字的某一部分
	void Draw( CMemDC* pDC, DWORD dwChar, int nCol);

	//存储是否绘制淡入淡出效果开关变量
	bool m_bGotMetrics;
	//表示是否已经设置换算关系
	bool m_bDrawFadedNotches;

	//存储控件客户区域
	RECT m_recClient;

	//设置点宽度
	int m_nNotchWidth;

	//设置点长度
	int m_nNotchLength;

	//存储显示的数字
	CString m_strNumber;

	//控件背景颜色
	COLORREF m_crColorBackground;

	//控件前景颜色
	COLORREF m_crColorForeground;

	//背景画刷
	CBrush m_brBackground;

};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LEDCTRL_H__870D0FEE_E2E1_469E_8008_264C58FD750E__INCLUDED_)
