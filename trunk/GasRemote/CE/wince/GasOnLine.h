// GasOnline.h : GasOnline Ӧ�ó������ͷ�ļ�
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"

// CGasOnlineApp:
// �йش����ʵ�֣������ GasOnline.cpp
//

class CGasOnlineApp : public CWinApp
{
public:
	CGasOnlineApp();

// ��д
public:
	virtual BOOL InitInstance();

// ʵ��
public:
	afx_msg void OnAppAbout();

	DECLARE_MESSAGE_MAP()
};

extern CGasOnlineApp theApp;
