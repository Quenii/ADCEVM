#pragma once

class CGPS_Parsor
{
public:
	CGPS_Parsor(void);
	~CGPS_Parsor(void);
public:
		//����GPS����,�ɹ�����0
	int parse(const char* dat);

	//��ȡ����
	double longitude();
	
	//��ȡγ��
	double latitude();

	//��ȡ�߶�
	double height();

	//��ȡ�ٶ�
	double velocity();
private:
    
	//�����õ��ľ�����Ϣ
	double longitude_;

	//�����õ���γ����Ϣ
	double latitude_;

	//�����õ��ĸ߶���Ϣ
	double height_;

	//�����õ����ٶ���Ϣ
	double velocity_;
};

inline
double GPS_Parsor::longitude()
{
	return longitude_;
}
