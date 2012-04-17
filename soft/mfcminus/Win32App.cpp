#include "stdafx.h"
#include "gkhy/mfcminus/Win32App.hpp"
#include <assert.h>
#include <shlwapi.h>
#include <WinBase.h>

#pragma comment(lib, "shlwapi.lib")
#pragma warning(disable : 4996)

using namespace std;
using namespace gkhy::MfcMinus;

Win32App* Win32App::m_instance = 0;

Win32App::Win32App(const std::vector<std::string>& args)
{
	assert(0 == Win32App::m_instance);
	m_instance = this;

	m_instance->m_args = args;
	m_argc = (int)m_args.size();

	if ( m_argc > 0 )
	{
		m_argv = new char*[m_argc];
		for (int i = 0; i < m_argc; ++i)
		{
			int destLen = (int)m_args[i].size() + 1;
			m_argv[i] = new char[destLen];
			strcpy_s(m_argv[i], destLen, m_args[i].c_str());
		}
	}
	else
	{
		m_argc = 0;
		m_argv = 0;
	}
}

Win32App::~Win32App()
{
	if (m_argc != 0)
	{
		for (int i = 0; i < m_argc; ++i)
		{
			delete []m_argv[i];
		}
		
		delete []m_argv;
	}
}

void Win32App::exitProcess(int retCode)
{
	std::string path = filePath();
	
	char fname[MAX_PATH];
	char ext[MAX_PATH];
	_splitpath(path.c_str(), 0, 0, fname, ext);
	
	std::string name = std::string(fname) + std::string(ext);
	std::string cmd = std::string("taskkill /F /IM ") + name; 

	// ::system(cmd.c_str());
	WinExec(cmd.c_str(), SW_HIDE); 
}

const std::vector< std::string >& Win32App::args()
{
	return m_instance->m_args; 
}

void Win32App::args(int& argc, char**& argv)
{
	argc = m_instance->m_argc;
	argv = m_instance->m_argv;
}


Win32App* Win32App::instance()
{
	return m_instance;
}

 unsigned int Win32App::exec()
 {
 	return m_instance->exec(m_instance->m_args);
 }

unsigned int Win32App::exec(const std::vector<std::string> &args)
{
	return 0;
}

void Win32App::sleep(int mSec)
{
	Sleep(mSec);
}

std::string Win32App::appName()
{
	return m_instance->m_appName;

}

void Win32App::setAppName(const std::string & appName)
{
	m_instance->m_appName = appName;
}

std::string Win32App::filePath()
{
	USES_CONVERSION;
	TCHAR szPath[MAX_PATH]; 

	if( !GetModuleFileName( NULL, szPath, MAX_PATH ) )
	{
		assert(false);
		return string("");
	}

	return string(T2A(szPath));
}

std::string Win32App::dirPath()
{
	USES_CONVERSION;
	TCHAR szPath[MAX_PATH]; 

	if( !GetModuleFileName( NULL, szPath, MAX_PATH ) )
	{
		assert(false);
		return string("");
	}

	PathRemoveFileSpec(szPath);
	
	return string(T2A(szPath));
}

bool Win32App::setPriorityClass(unsigned int priorityClass)
{
	return SetPriorityClass(GetCurrentProcess(), priorityClass) ? true : false;
}
