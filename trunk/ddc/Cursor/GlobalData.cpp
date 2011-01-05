// GlobalData.cpp: implementation of the GlobalData class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "GlobalData.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

GlobalData::GlobalData()
{

}

GlobalData::~GlobalData()
{

}

GlobalData * GlobalData::lockInstance()
{
	static GlobalData _instance;
	_instance.cs.Lock();
	return &_instance;
}

void GlobalData::unlock()
{
	cs.Unlock();
}
