// GasOnlineDoc.cpp : CGasOnlineDoc ���ʵ��
//

#include "stdafx.h"
#include "GasOnline.h"

#include "GasOnlineDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CGasOnlineDoc

IMPLEMENT_DYNCREATE(CGasOnlineDoc, CDocument)

BEGIN_MESSAGE_MAP(CGasOnlineDoc, CDocument)
END_MESSAGE_MAP()

// CGasOnlineDoc ����/����

CGasOnlineDoc::CGasOnlineDoc()
{
	// TODO: �ڴ����һ���Թ������

}

CGasOnlineDoc::~CGasOnlineDoc()
{
}

BOOL CGasOnlineDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: �ڴ�������³�ʼ������
	// (SDI �ĵ������ø��ĵ�)

	return TRUE;
}

// CGasOnlineDoc ���л�


void CGasOnlineDoc::Serialize(CArchive& ar)
{
	(ar);
}



// CGasOnlineDoc ���

#ifdef _DEBUG
void CGasOnlineDoc::AssertValid() const
{
	CDocument::AssertValid();
}
#endif //_DEBUG


// CGasOnlineDoc ����

