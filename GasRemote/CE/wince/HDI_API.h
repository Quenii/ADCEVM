
// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the HDI_API_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// HDI_API_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
extern "C" _declspec(dllexport)bool _stdcall  set_digital_output(int set_level,int PORT_NO);
extern "C" _declspec(dllexport)bool _stdcall  read_digital_input(int * port_level,int port_NO);
extern "C" _declspec(dllexport)bool _stdcall  rotate_screen(int mode);
extern "C" _declspec(dllexport)bool _stdcall  set_brightness(int percen_value);
extern "C" _declspec(dllexport)int _stdcall  Readbrightness(void);
extern "C" _declspec(dllexport)bool _stdcall  UART_mode_select( int mode);
extern "C" _declspec(dllexport)bool _stdcall  mode_485_select( int mode);
extern "C" _declspec(dllexport)bool _stdcall  Get_Uart_Status(void);//此API已不用!



/*****************************************************************************************
函数名:Beep
参  数:dwDelay -- 响多少毫秒
返回值:无
*****************************************************************************************/
extern "C" _declspec(dllexport)bool _stdcall  Beep(DWORD dwDelay);



/*****************************************************************************************
函数名:WriteData
说  明:把数据写到nand flash特定位置
参  数:pBuf -- Buffer,长度为512个字节
	   Nand_Addr -- 地址，取值范围：0 ~ 7
返回值:无
*****************************************************************************************/
extern "C" _declspec(dllexport)bool _stdcall  WriteData(UINT8 *pBuf,UINT8 Nand_Addr);



/*****************************************************************************************
函数名:ReadData
说  明:从nand flash特定位置读取512个数据
参  数:pBuf -- Buffer,长度为512个字节
       Nand_Addr -- 地址，取值范围：0 ~ 7
返回值:无
*****************************************************************************************/
extern "C" _declspec(dllexport)bool _stdcall  ReadData(UINT8 *pBuf,UINT8 Nand_Addr);



/*****************************************************************************************
擦出全部
*****************************************************************************************/
extern "C" _declspec(dllexport)void _stdcall  EraseAll(void);



/*****************************************************************************************
函数名:ReadFRAM
参  数:SalAddr -- 从机地址
		 Addr    -- FRAM地址
		 pBuf    -- buffer(从Addr地址读出来的一个字节数据存放的Buf里)
返回值:TURE/FALSE
*****************************************************************************************/
extern "C" _declspec(dllexport)BOOL _stdcall  ReadFRAM(UINT8 SalAddr,UINT16 Addr,UINT8 *pBuf);



/*****************************************************************************************
函数名:WriteFRAM
参  数:SalAddr -- 从机地址
       Addr    -- FRAM地址
       pBuf    -- buffer(把Buf里的一个字节数据写到Addr地址所指定的区域)
返回值:TURE/FALSE
*****************************************************************************************/
extern "C" _declspec(dllexport)BOOL _stdcall  WriteFRAM(UINT8 SalAddr,UINT16 Addr,UINT8 *pBuf);



/*****************************************************************************************
函数名:EnableWdt
返回值:无
功  能:启动看门狗
*****************************************************************************************/
extern "C" _declspec(dllexport)void EnableWdt(void);



/*****************************************************************************************
函数名:DisableWdt
返回值:无
功  能:禁用看门狗
*****************************************************************************************/
extern "C" _declspec(dllexport)void DisableWdt(void);



/*****************************************************************************************
函数名:SetWdtTimeOut
功  能:设置看门狗超时时间
参  数:Sec -- 秒,最大值为40秒
返回值:无
*****************************************************************************************/
extern "C" _declspec(dllexport)void SetWdtTimeOut(UINT8 Sec);



/*****************************************************************************************
函数名:FeedWdt
功  能:喂狗
返回值:无
说  明:如果启动了看门狗，在SetWdtTimeOut设置的Sec秒内不喂狗(FeedWdt)，则重新启动系统。
       正常情况下，如果启动了看门狗，必须每Sec秒内至少喂狗(FeedWdt)一次，否则会重新启动系统。
*****************************************************************************************/
extern "C" _declspec(dllexport)void FeedWdt(void);

/****************************************************************************************
关于看门狗的使用说明:
【1】在wince启动时，看门狗默认是禁用的
【2】开启看门狗程序流程如下
1.SetWdtTimeOut(sec) -- 如sec等于10,20等
2.EnableWdt() -- 启动看门狗
3.每sec秒内必须FeedWdt(),否则超会重启系统。
【4】如果看门狗已启动，DisableWdt()可以禁用看门狗功能
****************************************************************************************/



/*****************************************************************************************
函数名:SetPWMDiv
功  能:设置PWM分频数
参  数:Div -- 取值:2,4,8,16 注意:只能选择其中之一，系统默认为2
返回值:无
*****************************************************************************************/
extern "C" _declspec(dllexport)void SetPWMDiv(UINT8 Div);



/*****************************************************************************************
函数名:StartPWM
功  能:启动PWM
参  数:Cntb
       Cmpb
返回值:无
PWM频率 = PWM_CLK/Div/Cntb (Hz)
占空比 = (Cmpb/Cntb) * 100%
注  意:系统给PWM的PWM_CLK = 200000Hz,Div为SetPWMDiv(UINT8 Div)中的Div值
*****************************************************************************************/
extern "C" _declspec(dllexport)void StartPWM(UINT32 Cntb,UINT32 Cmpb);



/*****************************************************************************************
函数名:StopPWM
功  能:停止PWM
参  数:无
返回值:TRUE/FALSE
*****************************************************************************************/
extern "C" _declspec(dllexport)BOOL StopPWM(void);




/*****************************************************************************************
函数名:GetPWMFrequency
功  能:获取PWM当前频率
参  数:无
返回值:当前频率值
*****************************************************************************************/
extern "C" _declspec(dllexport)DWORD GetPWMFrequency(void);



/*****************************************************************************************
函数名:ReadADC
功  能:读取指定通道的ADC转换值
参  数:ch -- 通道号,取值为:0,1,2,3
返回值:ADC转换值
*****************************************************************************************/
extern "C" _declspec(dllexport)UINT16 ReadADC(UINT8 ch);



/*****************************************************************************************
函数名:GetADCFrequency
功  能:获得当前ADC工作频率
参  数:无
返回值:当前ADC工作频率值
*****************************************************************************************/
extern "C" _declspec(dllexport)DWORD GetADCFrequency(void);



/*****************************************************************************************
函数名:ReadID
功  能:
参  数:pBuf -- 长度为16个字节
返回值:无
*****************************************************************************************/
extern "C" _declspec(dllexport)void ReadID(UINT8 *pBuf);



/*****************************************************************************************
函数名:ReadIMEI
功  能:
参  数:pBuf -- 长度为16个字节
返回值:无
*****************************************************************************************/
extern "C" _declspec(dllexport)void ReadIMEI(UINT8 *pBuf);