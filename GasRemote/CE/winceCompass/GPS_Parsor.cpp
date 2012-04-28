#include "StdAfx.h"
#include "GPS_Parsor.h"
#include "stdlib.h"
#include "string.h"


CGPS_Parsor::CGPS_Parsor(void)
{
	longitude_=0;
	latitude_=0;
	height_=0;
	velocity_=0;
}

CGPS_Parsor::~CGPS_Parsor(void)
{

}

int GPS_Parsor::parse(const char* dat)
{
  //****************************************8
  //方法二.考虑用CString的函数
  //*****************************************
	//分别作为速度纬度经度高度的临时存放
	/*char v[5];
	char n[9];
	char e[9];
	char m[5];*/

	// 存数据,把数据给字符串
	CString str(dat);

	//调用Find()函数找到第一个逗号时的索引
	int index=str.Find(',');
	if(index!=-1)
	{
		return -1;
	}
//	if(index!=-1)
//	{	
		//数据处理标志位 ，这有$GPGGA 和$GPRMC两种情况
		CString  label=str.Left(index);
		//提取经纬度 高度信息
		if(label==_T("$GPGGA"))
		{
			//纬度标志位，第三个逗号 ，w往前处理纬度，往后处理经度
			int index3=str.Find(_T(",N,"),index);

			CString n=str.Mid(index3-9,9);
			longitude_ = atof(n);
          
			//第三个标志
			//int index3=str.Find(",N,",index2);
			CString e=str.Mid(index3+3,10);
			latitude_=atof(e);

			//第四个标志,这要考究一下，有些数据并没有五位
			int index4=str.Find(_T(",M,"),index3);
			if(str.Mid(index4-3,1)==_T(","))
			{
				CString m=str.Mid(index4-3,3);
				height_=atof(m);
			}
			else if(str.Mid(index4-4,1)==_T(","))
			{
				CString m=str.Mid(index4-4,4);
				height_=atof(m);
			}
			else if(str.Mid(index4-5,1)==_T(","))
			{
				CString m=str.Mid(index4-5,5);
				height_=atof(m);
			}

		}
		//提取速度信息
		else if(label==_T("$GPRMC"))
		{

			int index2=str.Find(_T(",E,"),index);
            //速度*.**4位
			if(str.Mid(index2+7,1)==_T(","))
			{
				CString v=str.Mid(index2+3,4);
				velocity_=atof(v);
			}
			//速度**.**5位
			else if(str.Mid(index2+8,1)==_T(","))
			{
				CString v=str.Mid(index2+3,5);
				velocity_=atof(v);
			}	
		}
	return 0;
}

double GPS_Parsor::latitude()
{
	return latitude_;
}

double GPS_Parsor::height()
{
	return height_;
}

double GPS_Parsor::velocity()
{
	return velocity_;
}