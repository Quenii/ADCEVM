// GasOnlineDoc.cpp : CGasOnlineDoc 类的实现
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

// CGasOnlineDoc 构造/析构

CGasOnlineDoc::CGasOnlineDoc()
{
	// TODO: 在此添加一次性构造代码

}

CGasOnlineDoc::~CGasOnlineDoc()
{
}

BOOL CGasOnlineDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: 在此添加重新初始化代码
	// (SDI 文档将重用该文档)

	return TRUE;
}

// CGasOnlineDoc 序列化


void CGasOnlineDoc::Serialize(CArchive& ar)
{
	(ar);
}



// CGasOnlineDoc 诊断

#ifdef _DEBUG
void CGasOnlineDoc::AssertValid() const
{
	CDocument::AssertValid();
}
#endif //_DEBUG


// CGasOnlineDoc 命令

