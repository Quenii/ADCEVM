// LedCtrl.cpp : implementation file
//

#include "stdafx.h"
//#include "LedCtrlUse.h"
#include "LedCtrl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLedCtrl

CLedCtrl::CLedCtrl()
{
	m_bDrawFadedNotches = false;
	m_crColorForeground = 0x00FF00;
	m_crColorBackground = 0;
	m_brBackground.CreateSolidBrush(m_crColorBackground);
	m_strNumber = "0";
	m_bGotMetrics = false;
}

CLedCtrl::~CLedCtrl()
{
}


BEGIN_MESSAGE_MAP(CLedCtrl, CStatic)
	//{{AFX_MSG_MAP(CLedCtrl)
	ON_WM_PAINT()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLedCtrl message handlers

/////////////////////////////////////////////////////////////////////////////
// CLedCtrl message handlers

//����һ������
void CLedCtrl::Draw(CMemDC* pDC, DWORD dwChar, int nCol)
{
	//������Ⱥͳ���
	if (!m_bGotMetrics)
	{
		int nHeight = m_recClient.bottom;
		(nHeight * 0.07) < 1 ? m_nNotchWidth = 1 : m_nNotchWidth = (int)(nHeight * 0.07);
		(nHeight * 0.35) < 1 ? m_nNotchLength = 1 : m_nNotchLength = (int)(nHeight * 0.35);
		m_nNotchWidth = m_nNotchWidth;
		m_bGotMetrics = true;
	}

	//�����п��
	if ( nCol > 0 )		
		nCol = (nCol*m_nNotchLength) + (m_nNotchWidth*4) * nCol;

	//���õ��뵭����ɫ
	COLORREF crNotchColor = m_crColorForeground;
	if (dwChar == STCOUNTERALL)	{	
		int r = GetRValue(m_crColorForeground)/3;
		int g = GetGValue(m_crColorForeground)/3;
		int b = GetBValue(m_crColorForeground)/3;
		crNotchColor = RGB(r,g,b);
	}

	//��������
	CPen pen(PS_SOLID , m_nNotchWidth, crNotchColor);
	pDC->SelectObject(&pen);

	//����е�1�����򻭵�1��
	if ( (dwChar & NOTCH1) || dwChar == STCOUNTERALL)	
	{	
		pDC->MoveTo( nCol + m_nNotchWidth*2, m_nNotchWidth );
		pDC->LineTo( nCol + m_nNotchLength, m_nNotchWidth );
	}

	//����е�2�����򻭵�2��
	if ( dwChar & NOTCH2 || dwChar == STCOUNTERALL)	
	{	
		pDC->MoveTo(nCol + m_nNotchLength + m_nNotchWidth, m_nNotchWidth*2);
		pDC->LineTo(nCol + m_nNotchLength + m_nNotchWidth, m_nNotchLength + (m_nNotchWidth*2) );
	}
	//����е�3�����򻭵�3��
	if ( dwChar & NOTCH3 || dwChar == STCOUNTERALL)	
	{
		pDC->MoveTo(nCol + m_nNotchLength + m_nNotchWidth, m_nNotchLength + (m_nNotchWidth*4) );
		pDC->LineTo(nCol + m_nNotchLength + m_nNotchWidth, m_nNotchLength*2 + (m_nNotchWidth*3) );
	}
	//����е�4�����򻭵�4��
	if ( dwChar & NOTCH4 || dwChar == STCOUNTERALL)	
	{	
		pDC->MoveTo( nCol + m_nNotchWidth*2, m_nNotchLength*2 + (m_nNotchWidth*4) );
		pDC->LineTo( nCol + m_nNotchLength, m_nNotchLength*2 + (m_nNotchWidth*4) );
	}
	//����е�5�����򻭵�5��
	if ( dwChar & NOTCH5 || dwChar == STCOUNTERALL)	
	{	
		pDC->MoveTo(nCol + m_nNotchWidth, m_nNotchLength + (m_nNotchWidth*4) );
		pDC->LineTo(nCol + m_nNotchWidth, m_nNotchLength*2 + (m_nNotchWidth*3) );
	}
	//����е�6�����򻭵�6��
	if ( dwChar & NOTCH6 || dwChar == STCOUNTERALL)	
	{	
		pDC->MoveTo(nCol + m_nNotchWidth, m_nNotchWidth*2);
		pDC->LineTo(nCol + m_nNotchWidth, m_nNotchLength + (m_nNotchWidth*2) );
	}
	//����е�7�����򻭵�7��
	if ( dwChar & NOTCH7 || dwChar == STCOUNTERALL)	
	{	
		pDC->MoveTo(nCol + m_nNotchWidth*2, m_nNotchLength + (m_nNotchWidth*3) );
		pDC->LineTo(nCol + m_nNotchWidth + m_nNotchLength - m_nNotchWidth, m_nNotchLength + (m_nNotchWidth*3) );
	}
	//�����:������:��
	if ( dwChar & NOTCH0 || dwChar == STCOUNTERALL)	
	{	
		pDC->MoveTo(nCol + m_nNotchLength/2 + m_nNotchWidth, m_nNotchLength/2 + m_nNotchWidth*3);
		pDC->LineTo(nCol + m_nNotchLength/2 + m_nNotchWidth, m_nNotchLength + m_nNotchWidth);
		pDC->MoveTo(nCol + m_nNotchLength/2 + m_nNotchWidth, m_nNotchLength + m_nNotchWidth*6);
		pDC->LineTo(nCol + m_nNotchLength/2 + m_nNotchWidth, (m_nNotchLength*3)/2 + m_nNotchWidth*5);
	}
}


//�����Ƿ���ʾ���뵭��Ч��
void CLedCtrl::SetDrawFaded(bool bState)
{
	m_bDrawFadedNotches = bState;
}

//���ñ���ɫ
void CLedCtrl::SetColorBackGround(COLORREF crColor)
{
	if (crColor != 0xffffffff)
		m_crColorBackground = crColor;
	else 
		m_crColorBackground = ::GetSysColor(COLOR_BTNFACE);

	//�������ɱ���ˢ
    m_brBackground.DeleteObject();
    m_brBackground.CreateSolidBrush(m_crColorBackground);

	//�ػ�
	Invalidate();
}

//����ǰ��ɫ
void CLedCtrl::SetColorForeGround(COLORREF crColor)
{
	if (crColor != 0xffffffff)
	{
		m_crColorForeground = crColor;
	}
	else 
	{
		m_crColorForeground = ::GetSysColor(COLOR_BTNTEXT);
	}

	//�ػ�
	Invalidate(FALSE);
}

//��ʾ����
void CLedCtrl::Display(int nNumber)
{
	m_strNumber.Format(_T("%d"), nNumber);
	//����OnPaint�����ػ�
	Invalidate(FALSE);
}
//��ʾ�ַ���
void CLedCtrl::Display(CString ss)
{
	m_strNumber = ss;
	//����OnPaint�����ػ�
	Invalidate(FALSE);
}

//�ؼ������¼�������
void CLedCtrl::OnPaint() 
{
	// TODO: Add your message handler code here
	
	// Do not call CStatic::OnPaint() for painting messages
	GetClientRect(&m_recClient);

	CPaintDC dc(this);
	CMemDC memDC(&dc, m_recClient);
	CMemDC* pDC = &memDC;

	CRect clip;
	pDC->GetClipBox(&clip);
	pDC->FillSolidRect(&m_recClient, m_crColorBackground );

	for (int nCount = 0; nCount< m_strNumber.GetLength(); nCount++)
	{
		if (m_bDrawFadedNotches)
			Draw( pDC, STCOUNTERALL, nCount );	// Draw the faded bits

		//CString str = m_strNumber[nCount];
		if ( m_strNumber[nCount] == _T('0') )	Draw( pDC, STCOUNTER0, nCount );
		else if ( m_strNumber[nCount] == _T('1') )	Draw( pDC, STCOUNTER1, nCount );
		else if ( m_strNumber[nCount] == _T('2') )	Draw( pDC, STCOUNTER2, nCount );
		else if ( m_strNumber[nCount] == _T('3') )	Draw( pDC, STCOUNTER3, nCount );
		else if ( m_strNumber[nCount] == _T('4') )	Draw( pDC, STCOUNTER4, nCount );
		else if ( m_strNumber[nCount] == _T('5') )	Draw( pDC, STCOUNTER5, nCount );
		else if ( m_strNumber[nCount] == _T('6') )	Draw( pDC, STCOUNTER6, nCount );
		else if ( m_strNumber[nCount] == _T('7') )	Draw( pDC, STCOUNTER7, nCount );
		else if ( m_strNumber[nCount] == _T('8') )	Draw( pDC, STCOUNTER8, nCount );
		else if ( m_strNumber[nCount] == _T('9') )	Draw( pDC, STCOUNTER9, nCount );
		else if ( m_strNumber[nCount] == _T('-') )	Draw( pDC, STCOUNTER10, nCount );
		else if ( m_strNumber[nCount] == _T(':') )	Draw( pDC, STCOUNTER11, nCount );
	}
}
