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
const DWORD NOTCH0 = 256;	//��ʾ��:��
const DWORD NOTCH1 = 128;	//��ʾ��1��
const DWORD NOTCH2 = 64;	//��ʾ��2��
const DWORD NOTCH3 = 32;	//��ʾ��3��
const DWORD NOTCH4 = 16;	//��ʾ��4��
const DWORD NOTCH5 = 8;		//��ʾ��5��
const DWORD NOTCH6 = 4;		//��ʾ��6��
const DWORD NOTCH7 = 2;		//��ʾ��7��

const DWORD STCOUNTER0  = 252;		//����0ʱ����Ҫ�ʻ����
const DWORD STCOUNTER1  = 96;		//����1ʱ����Ҫ�ʻ����
const DWORD STCOUNTER2  = 218;		//����2ʱ����Ҫ�ʻ����
const DWORD STCOUNTER3  = 242;		//����3ʱ����Ҫ�ʻ����
const DWORD STCOUNTER4  = 102;		//����4ʱ����Ҫ�ʻ����
const DWORD STCOUNTER5  = 182;		//����5ʱ����Ҫ�ʻ����
const DWORD STCOUNTER6  = 190;		//����6ʱ����Ҫ�ʻ����
const DWORD STCOUNTER7  = 224;		//����7ʱ����Ҫ�ʻ����
const DWORD STCOUNTER8  = 254;		//����8ʱ����Ҫ�ʻ����
const DWORD STCOUNTER9  = 246;		//����9ʱ����Ҫ�ʻ����
const DWORD STCOUNTER10  = 2;		//����-ʱ����Ҫ�ʻ����
const DWORD STCOUNTER11 = 256;		//����:ʱ����Ҫ�ʻ����

const DWORD STCOUNTERALL  = 999;	//�����������


class CMemDC : public CDC
{
private:
	CBitmap m_bitmap;		//����λͼ
	CBitmap* m_oldBitmap;	//�洢��λͼ
	CDC* m_pDC;				//�洢��ͼ����
	CRect m_rect;			//�洢�ؼ���������
	BOOL m_bMemDC;			//�жϻ�ͼ�����Ƿ�׼����
public:
	//���캯��
	CMemDC(CDC *pDC,CRect rect=CRect(0,0,0,0)) : CDC(), m_oldBitmap(NULL), m_pDC(pDC)
	{
		//�жϻ�ͼ�Ƿ�Ϊ��
		ASSERT(m_pDC != NULL);
		//�жϻ�ͼ�����Ƿ�׼����
		m_bMemDC = !pDC->IsPrinting();
		if(m_bMemDC)
		{
			//�����������ƻ���
			CreateCompatibleDC(pDC);
			if(rect == CRect(0,0,0,0))
				pDC->GetClipBox(&m_rect);
			else
				m_rect = rect;

			//��������λͼ
			m_bitmap.CreateCompatibleBitmap(pDC,m_rect.Width(),m_rect.Height());
			m_oldBitmap = SelectObject(&m_bitmap);
		}
		else
		{
			m_hDC = pDC->m_hDC;
			m_hAttribDC = pDC->m_hAttribDC;
		}
	}

	//��������
	~CMemDC()
	{
		if (m_bMemDC)
		{
			//������λͼ���Ƶ���Ļ��
			m_pDC->BitBlt(m_rect.left,m_rect.top,m_rect.Width(),m_rect.Height(),
				this, m_rect.left,m_rect.top,SRCCOPY);
			//����λͼ����ѡ�񵽻�ͼ����
			SelectObject(m_oldBitmap);
		}
		else
		{
			m_hDC = m_hAttribDC = NULL;
		}
	}
	//ָ�����������
	CMemDC* operator->() {return this;}

	//ָ�����������
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
	//�����Ƿ���Ƶ��뵭��Ч�����ر���
	void SetDrawFaded(bool bState = true);
	//����ǰ��ɫ
	void SetColorForeGround(COLORREF crColor = 0xffffffff);
	//���ñ���ɫ
	void SetColorBackGround(COLORREF crColor = 0xffffffff);
	//��ʾ����
	void Display( int nNumber );	
	void Display( CString ss );	
protected:
	//�������ֵ�ĳһ����
	void Draw( CMemDC* pDC, DWORD dwChar, int nCol);

	//�洢�Ƿ���Ƶ��뵭��Ч�����ر���
	bool m_bGotMetrics;
	//��ʾ�Ƿ��Ѿ����û����ϵ
	bool m_bDrawFadedNotches;

	//�洢�ؼ��ͻ�����
	RECT m_recClient;

	//���õ���
	int m_nNotchWidth;

	//���õ㳤��
	int m_nNotchLength;

	//�洢��ʾ������
	CString m_strNumber;

	//�ؼ�������ɫ
	COLORREF m_crColorBackground;

	//�ؼ�ǰ����ɫ
	COLORREF m_crColorForeground;

	//������ˢ
	CBrush m_brBackground;

};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LEDCTRL_H__870D0FEE_E2E1_469E_8008_264C58FD750E__INCLUDED_)
