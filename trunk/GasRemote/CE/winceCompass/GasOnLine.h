// GasOnline.h : GasOnline 应用程序的主头文件
//
#pragma once

#ifndef __AFXWIN_H__
	#error "在包含此文件之前包含“stdafx.h”以生成 PCH 文件"
#endif

#include "resource.h"

// CGasOnlineApp:
// 有关此类的实现，请参阅 GasOnline.cpp
//

class CGasOnlineApp : public CWinApp
{
public:
	CGasOnlineApp();

// 重写
public:
	virtual BOOL InitInstance();

// 实现
public:
	afx_msg void OnAppAbout();

	DECLARE_MESSAGE_MAP()
};

extern CGasOnlineApp theApp;
