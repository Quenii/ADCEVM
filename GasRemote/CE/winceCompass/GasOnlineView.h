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
	float fDeg;
	int deg;
	int min;
	int sec;

	void fromFloat(float g)
	{
		fDeg = g;
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
	SerialRcvBuffer()
	{
		valid = 0;
		size = 1024;
	}
	~SerialRcvBuffer()
	{
	}
	int indexOf(char * slice, int len)
	{
		if (len > valid)
		{
			return -1;
		}
		for (int i=0; i<=valid-len; ++i)
		{
			if (memcmp(buffer+i, slice, len) == 0)
			{
				return i;
				TRACE("valid: %d, len: %d, index: %d", valid, len, i);
			}
		}
		return -1;
	}
	void append(BYTE * anotherBuf, int len)
	{
		int overlap = valid + len - size;
		if (overlap > 0)
		{
			memcpy(buffer, buffer+overlap, valid-overlap);
			valid = valid - overlap;
		}

		memcpy(buffer+valid, anotherBuf, len);
		valid += len;
		TRACE("append: valid: %d, len: %d", valid, len);
	}

	void remove(int first, int len)
	{
		if (first >= valid)
		{
			return;
		}
		if (first < 0)
		{
			first = 0;
			len = len + first;
		}
		if (first + len > valid)
		{
			len = valid - first;
		}
		memcpy(buffer+first, buffer+first+len, valid-len);
		valid -= len;
	}

	void clear()
	{
		valid = 0;
	}
	BYTE buffer[1024];
	int valid;
	int size;
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
	GasType* m_SO2;
	GasType* m_H2S;
	GasType* m_Fel;
	GasType* m_CO;
	GasType* m_O2;

	GPSdms gLat, gLng;
	bool bLocationValid;
	HKEY m_hKeyPara;

	CBitmap			m_bmpBackground;

	char	usID;
	char			ucmima[8];
	unsigned short	usAlarmEn;
	unsigned char	ucSamInterval;
	CString			m_strMima;

// 操作
private:
	CCESeries *m_pSerialPort1;
	CCESeries *m_pSerialPort2;
	SerialRcvBuffer m_rcvBufPort1, m_rcvBufPort2;
	void SetStatusData();
	void SetGasInfo();
	void DisplayCommData();
	void InitCtrol();
	void SendADCtrolData(unsigned short);
	void SendSensorData();
	void SendDWSQ();
	//定义串口接收数据函数类型
	static void CALLBACK OnPort1Read(void * pOwner,BYTE* buf,DWORD bufLen);
	static void CALLBACK OnPort2Read(void * pOwner,BYTE* buf,DWORD bufLen);
	float Average(float *array, float val, int len);
    
	void GetParaData();
	void ReadRegPara();
	void setKey(HKEY key, WCHAR* subKey, GasType* gas);

	unsigned int localID;
	unsigned int remoteID;
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
	CLabel m_ctlCSH2SValue;
	CLabel m_ctlCSCOValue;
	CLabel m_ctlCSSO2Value;
	CLabel m_ctlCSVOCValue;
	CLabel m_ctlCSCOMBValue;
	CLabel m_ctlCSO2;
	CLabel m_ctlCSH2S;
	CLabel m_ctlCSCO;
	CLabel m_ctlCSSO2;
	CLabel m_ctlCSVOC;
	CLabel m_ctlCSCOMB;
	/*CLabel m_ctlCSO2ALH;
	CLabel m_ctlCSO2ALLOW;*/
	/*CLabel m_ctlCSH2SALH;
	CLabel m_ctlCSH2SALLOW;*/
	/*CLabel m_ctlCSCOALH;
	CLabel m_ctlCSCOALLOW;*/
	/*CLabel m_ctlCSSO2ALH;
	CLabel m_ctlCSSO2ALLOW;*/
	/*CLabel m_ctlCSVOCALH;
	CLabel m_ctlCSVOCALLOW;*/
	/*CLabel m_ctlCSCOMBALH;
	CLabel m_ctlCSCOMBALLOW;*/
public:
	void ValidateCmd(BYTE * buffer, int &valid, const BYTE* buf, const DWORD bufLen);
	void SetEditFocus();
	void KillEditFocus();
	afx_msg void OnBnClickedButtonExit();
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnPaint();
	// 串口接收数据处理函数
	afx_msg LONG OnRecvSerialPort1Data(WPARAM wParam,LPARAM lParam);
	afx_msg LONG OnRecvSerialPort2Data(WPARAM wParam,LPARAM lParam);
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
	afx_msg void OnBnClickedButtonO2();
	afx_msg void OnBnClickedButtonCO();
};

#ifndef _DEBUG  // GasOnlineView.cpp 中的调试版本
inline CGasOnlineDoc* CGasOnlineView::GetDocument() const
   { return reinterpret_cast<CGasOnlineDoc*>(m_pDocument); }
#endif

