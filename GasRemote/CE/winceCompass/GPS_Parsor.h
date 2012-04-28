#pragma once

class CGPS_Parsor
{
public:
	CGPS_Parsor(void);
	~CGPS_Parsor(void);
public:
		//解析GPS数据,成功返回0
	int parse(const char* dat);

	//获取经度
	double longitude();
	
	//获取纬度
	double latitude();

	//获取高度
	double height();

	//获取速度
	double velocity();
private:
    
	//解析得到的经度信息
	double longitude_;

	//解析得到的纬度信息
	double latitude_;

	//解析得到的高度信息
	double height_;

	//解析得到的速度信息
	double velocity_;
};

inline
double GPS_Parsor::longitude()
{
	return longitude_;
}
