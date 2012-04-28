
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
extern "C" _declspec(dllexport)bool _stdcall  Get_Uart_Status(void);//��API�Ѳ���!



/*****************************************************************************************
������:Beep
��  ��:dwDelay -- ����ٺ���
����ֵ:��
*****************************************************************************************/
extern "C" _declspec(dllexport)bool _stdcall  Beep(DWORD dwDelay);



/*****************************************************************************************
������:WriteData
˵  ��:������д��nand flash�ض�λ��
��  ��:pBuf -- Buffer,����Ϊ512���ֽ�
	   Nand_Addr -- ��ַ��ȡֵ��Χ��0 ~ 7
����ֵ:��
*****************************************************************************************/
extern "C" _declspec(dllexport)bool _stdcall  WriteData(UINT8 *pBuf,UINT8 Nand_Addr);



/*****************************************************************************************
������:ReadData
˵  ��:��nand flash�ض�λ�ö�ȡ512������
��  ��:pBuf -- Buffer,����Ϊ512���ֽ�
       Nand_Addr -- ��ַ��ȡֵ��Χ��0 ~ 7
����ֵ:��
*****************************************************************************************/
extern "C" _declspec(dllexport)bool _stdcall  ReadData(UINT8 *pBuf,UINT8 Nand_Addr);



/*****************************************************************************************
����ȫ��
*****************************************************************************************/
extern "C" _declspec(dllexport)void _stdcall  EraseAll(void);



/*****************************************************************************************
������:ReadFRAM
��  ��:SalAddr -- �ӻ���ַ
		 Addr    -- FRAM��ַ
		 pBuf    -- buffer(��Addr��ַ��������һ���ֽ����ݴ�ŵ�Buf��)
����ֵ:TURE/FALSE
*****************************************************************************************/
extern "C" _declspec(dllexport)BOOL _stdcall  ReadFRAM(UINT8 SalAddr,UINT16 Addr,UINT8 *pBuf);



/*****************************************************************************************
������:WriteFRAM
��  ��:SalAddr -- �ӻ���ַ
       Addr    -- FRAM��ַ
       pBuf    -- buffer(��Buf���һ���ֽ�����д��Addr��ַ��ָ��������)
����ֵ:TURE/FALSE
*****************************************************************************************/
extern "C" _declspec(dllexport)BOOL _stdcall  WriteFRAM(UINT8 SalAddr,UINT16 Addr,UINT8 *pBuf);



/*****************************************************************************************
������:EnableWdt
����ֵ:��
��  ��:�������Ź�
*****************************************************************************************/
extern "C" _declspec(dllexport)void EnableWdt(void);



/*****************************************************************************************
������:DisableWdt
����ֵ:��
��  ��:���ÿ��Ź�
*****************************************************************************************/
extern "C" _declspec(dllexport)void DisableWdt(void);



/*****************************************************************************************
������:SetWdtTimeOut
��  ��:���ÿ��Ź���ʱʱ��
��  ��:Sec -- ��,���ֵΪ40��
����ֵ:��
*****************************************************************************************/
extern "C" _declspec(dllexport)void SetWdtTimeOut(UINT8 Sec);



/*****************************************************************************************
������:FeedWdt
��  ��:ι��
����ֵ:��
˵  ��:��������˿��Ź�����SetWdtTimeOut���õ�Sec���ڲ�ι��(FeedWdt)������������ϵͳ��
       ��������£���������˿��Ź�������ÿSec��������ι��(FeedWdt)һ�Σ��������������ϵͳ��
*****************************************************************************************/
extern "C" _declspec(dllexport)void FeedWdt(void);

/****************************************************************************************
���ڿ��Ź���ʹ��˵��:
��1����wince����ʱ�����Ź�Ĭ���ǽ��õ�
��2���������Ź�������������
1.SetWdtTimeOut(sec) -- ��sec����10,20��
2.EnableWdt() -- �������Ź�
3.ÿsec���ڱ���FeedWdt(),���򳬻�����ϵͳ��
��4��������Ź���������DisableWdt()���Խ��ÿ��Ź�����
****************************************************************************************/



/*****************************************************************************************
������:SetPWMDiv
��  ��:����PWM��Ƶ��
��  ��:Div -- ȡֵ:2,4,8,16 ע��:ֻ��ѡ������֮һ��ϵͳĬ��Ϊ2
����ֵ:��
*****************************************************************************************/
extern "C" _declspec(dllexport)void SetPWMDiv(UINT8 Div);



/*****************************************************************************************
������:StartPWM
��  ��:����PWM
��  ��:Cntb
       Cmpb
����ֵ:��
PWMƵ�� = PWM_CLK/Div/Cntb (Hz)
ռ�ձ� = (Cmpb/Cntb) * 100%
ע  ��:ϵͳ��PWM��PWM_CLK = 200000Hz,DivΪSetPWMDiv(UINT8 Div)�е�Divֵ
*****************************************************************************************/
extern "C" _declspec(dllexport)void StartPWM(UINT32 Cntb,UINT32 Cmpb);



/*****************************************************************************************
������:StopPWM
��  ��:ֹͣPWM
��  ��:��
����ֵ:TRUE/FALSE
*****************************************************************************************/
extern "C" _declspec(dllexport)BOOL StopPWM(void);




/*****************************************************************************************
������:GetPWMFrequency
��  ��:��ȡPWM��ǰƵ��
��  ��:��
����ֵ:��ǰƵ��ֵ
*****************************************************************************************/
extern "C" _declspec(dllexport)DWORD GetPWMFrequency(void);



/*****************************************************************************************
������:ReadADC
��  ��:��ȡָ��ͨ����ADCת��ֵ
��  ��:ch -- ͨ����,ȡֵΪ:0,1,2,3
����ֵ:ADCת��ֵ
*****************************************************************************************/
extern "C" _declspec(dllexport)UINT16 ReadADC(UINT8 ch);



/*****************************************************************************************
������:GetADCFrequency
��  ��:��õ�ǰADC����Ƶ��
��  ��:��
����ֵ:��ǰADC����Ƶ��ֵ
*****************************************************************************************/
extern "C" _declspec(dllexport)DWORD GetADCFrequency(void);



/*****************************************************************************************
������:ReadID
��  ��:
��  ��:pBuf -- ����Ϊ16���ֽ�
����ֵ:��
*****************************************************************************************/
extern "C" _declspec(dllexport)void ReadID(UINT8 *pBuf);



/*****************************************************************************************
������:ReadIMEI
��  ��:
��  ��:pBuf -- ����Ϊ16���ֽ�
����ֵ:��
*****************************************************************************************/
extern "C" _declspec(dllexport)void ReadIMEI(UINT8 *pBuf);