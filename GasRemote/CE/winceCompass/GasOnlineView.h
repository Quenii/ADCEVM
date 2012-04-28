// GasOnlineView.h : CGasOnlineView 类的接口
//

#pragma once
#include "afxwin.h"
#include "LedCtrl.h"
#include "Label.h"
#include "CESeries.h"
#include "stdlib.h"
#include "string.h"

//#include "GPS_Parsor.h"

//产生随机数
#define GetRandom( min, max ) ((rand() % (int)(((max)+1) - (min))) + (min))

typedef struct{
	CString strName ; 
	int		iEn;
	int		iALH;
	int		iALLOW;
}ADNODE;

struct GPSdms
{
	int deg;
	int min;
	int sec;

	GPSdms(float g)
	{
		deg = (int)g;
		min = (int)((g - deg)*60.0);
		sec = (int)((g - deg -min)*3600);
	}
};

class GasType
{
public:
	GasType(float k)
	{
		m_k = k;
		m_delta = 0.0;
	};
	void setValue(unsigned char hi, unsigned char low, unsigned short min = 0x0840)
	{
		int raw = hi*256 + low;
		if (raw < min)
		{	
			raw = min;
		}
		m_orignal = (raw - min) * m_k;
		m_value = m_orignal + m_delta;
		m_value = m_value >= 0 ? m_value : 0;
	}
	float orignal()
	{
		return m_orignal;
	}
	float value()
	{
		return m_value;
	}
	void setDelta(float delta)
	{
		m_delta = delta;
	}
	float delta()
	{
		return m_delta;
	}
	float set;

private:
	float m_value;
	float m_orignal;
	float m_delta;
	float m_k;
};



const int RCVBUFLEN = 32;
//typedef struct{
//	BYTE buffer[RCVBUFLEN];
//	int valid;
//}SerialRcvBuffer;

class SerialRcvBuffer{
public:
	BYTE buffer[RCVBUFLEN*2];
	int valid;
};
typedef struct {int valid;
				int hh;
				int mm;
				int ss;
				int ms;
				double longitude;
				double latitude;
				double height;
				double velocity;
				double direction;
				//LPVOID userptr;
}G_FRAME;

class CGasOnlineView : public CFormView
{
protected: // 仅从序列化创建
	CGasOnlineView();
	DECLARE_DYNCREATE(CGasOnlineView)

public:
	enum{ IDD = IDD_GASONLINE_FORM };

// 属性
public:
	CGasOnlineDoc* GetDocument() const;

private:
	//RealGasType m_fO2, m_fH2s, m_fCo, m_fSo2, m_fComb, m_fVoc;
	//RawGasType so2, h2s, fel;

	GasType* m_SO2;
	GasType* m_H2S;
	GasType* m_Fel;

	//float m_iSo2[5];
	//float m_iH2s[5];
	//float m_iFel[5];

	HKEY m_hKeyPara;

/*	int valid;
	int hh;
	int mm;
	int ss;
	int ms;
	double longitude;
	double latitude;
	double height;
	double velocity;
	double direction;
	int code;
*/
	CBitmap			m_bmpBackground;

	char	usID;
	char			ucmima[8];
	unsigned short	usAlarmEn;
	unsigned char	ucSamInterval;
	CString			m_strMima;

	ADNODE adnode[8];
	//G_FRAME m_frame;
	CString GpsTime, GpsPosWei, GpsDirWei, GpsPosJing, GpsDirJing, GpsDate;

// 操作
private:
	CCESeries *m_pSerialPort1;
	CCESeries *m_pSerialPort2;
	CCESeries *m_pSerialPort3;
	static SerialRcvBuffer m_rcvBufPort1;
	void SetStatusData();
	void SetGasInfo();
	void DisplayCommData();
	void InitCtrol();
	void SendADCtrolData(unsigned short);
	//定义串口接收数据函数类型
	static void CALLBACK OnPort1Read(void * pOwner,BYTE* buf,DWORD bufLen);
	static void CALLBACK OnPort2Read(void * pOwner,BYTE* buf,DWORD bufLen);
	static void CALLBACK OnPort3Read(void * pOwner,BYTE* buf,DWORD bufLen);
	float Average(float *array, float val, int len);
    
	void GetParaData();
	int String2Hex(CString str, CByteArray &hexdata);
	void ReadRegPara();
	void setKey(HKEY key, WCHAR* subKey, GasType* gas);

	//void SendCmdToAD();

// 重写
public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);

protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持
	virtual void OnInitialUpdate(); // 构造后第一次调用

// 实现
public:
	virtual ~CGasOnlineView();
#ifdef _DEBUG
	virtual void AssertValid() const;
#endif

protected:

// 生成的消息映射函数
protected:
	DECLARE_MESSAGE_MAP()
private:
	CLabel m_ctlCSO2;
	CLabel m_ctlCSID;
	CLabel m_ctlCSGPSLANG;
	CLabel m_ctlCSGPSLAT;
	CLabel m_ctlCSTime;
	CLabel m_ctlCSTemper;
	CLabel m_ctlCSDate;
	CLabel m_ctlCSWeek;
	CLabel m_ctlCSNAME;
	CLabel m_ctlCSVALUE;
	CLabel m_ctlCSALH;
	CLabel m_ctlCSALLOW;
	CLabel m_ctlCSO2Value;
	/*CLabel m_ctlCSO2ALH;
	CLabel m_ctlCSO2ALLOW;*/
	CLabel m_ctlCSH2SValue;
	/*CLabel m_ctlCSH2SALH;
	CLabel m_ctlCSH2SALLOW;*/
	CLabel m_ctlCSCOValue;
	/*CLabel m_ctlCSCOALH;
	CLabel m_ctlCSCOALLOW;*/
	CLabel m_ctlCSSO2Value;
	/*CLabel m_ctlCSSO2ALH;
	CLabel m_ctlCSSO2ALLOW;*/
	CLabel m_ctlCSVOCValue;
	/*CLabel m_ctlCSVOCALH;
	CLabel m_ctlCSVOCALLOW;*/
	CLabel m_ctlCSCOMBValue;
	/*CLabel m_ctlCSCOMBALH;
	CLabel m_ctlCSCOMBALLOW;*/
	CLabel m_ctlCSH2S;
	CLabel m_ctlCSCO;
	CLabel m_ctlCSSO2;
	CLabel m_ctlCSVOC;
	CLabel m_ctlCSCOMB;
public:

	afx_msg void OnBnClickedButtonExit();
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnPaint();
	// 串口接收数据处理函数
	afx_msg LONG OnRecvSerialPort1Data(WPARAM wParam,LPARAM lParam);
	afx_msg LONG OnRecvSerialPort2Data(WPARAM wParam,LPARAM lParam);
	afx_msg LONG OnRecvSerialPort3Data(WPARAM wParam,LPARAM lParam);
	afx_msg void OnBnClickedButtonSet();
	afx_msg void OnEnSetfocusEditH2s();
	afx_msg void OnEnKillfocusEditH2s();
	afx_msg void OnEnSetfocusEditSo2();
	afx_msg void OnEnKillfocusEditSo2();
	afx_msg void OnEnSetfocusEditComb();
	afx_msg void OnEnKillfocusEditComb();
	afx_msg void OnBnClickedButtonH2s();
	afx_msg void OnBnClickedButtonSo2();
	afx_msg void OnBnClickedButtonComb();
};

#ifndef _DEBUG  // GasOnlineView.cpp 中的调试版本
inline CGasOnlineDoc* CGasOnlineView::GetDocument() const
   { return reinterpret_cast<CGasOnlineDoc*>(m_pDocument); }
#endif

