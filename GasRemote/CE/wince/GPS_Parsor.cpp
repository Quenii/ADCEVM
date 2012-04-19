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
  //������.������CString�ĺ���
  //*****************************************
	//�ֱ���Ϊ�ٶ�γ�Ⱦ��ȸ߶ȵ���ʱ���
	/*char v[5];
	char n[9];
	char e[9];
	char m[5];*/

	// ������,�����ݸ��ַ���
	CString str(dat);

	//����Find()�����ҵ���һ������ʱ������
	int index=str.Find(',');
	if(index!=-1)
	{
		return -1;
	}
//	if(index!=-1)
//	{	
		//���ݴ����־λ ������$GPGGA ��$GPRMC�������
		CString  label=str.Left(index);
		//��ȡ��γ�� �߶���Ϣ
		if(label==_T("$GPGGA"))
		{
			//γ�ȱ�־λ������������ ��w��ǰ����γ�ȣ���������
			int index3=str.Find(_T(",N,"),index);

			CString n=str.Mid(index3-9,9);
			longitude_ = atof(n);
          
			//��������־
			//int index3=str.Find(",N,",index2);
			CString e=str.Mid(index3+3,10);
			latitude_=atof(e);

			//���ĸ���־,��Ҫ����һ�£���Щ���ݲ�û����λ
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
		//��ȡ�ٶ���Ϣ
		else if(label==_T("$GPRMC"))
		{

			int index2=str.Find(_T(",E,"),index);
            //�ٶ�*.**4λ
			if(str.Mid(index2+7,1)==_T(","))
			{
				CString v=str.Mid(index2+3,4);
				velocity_=atof(v);
			}
			//�ٶ�**.**5λ
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