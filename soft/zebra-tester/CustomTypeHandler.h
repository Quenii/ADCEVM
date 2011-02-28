#pragma once

#include <list>

typedef void (*RegisterFuncionPointer)(void);

class CustomTypeHandler
{
public:
	static void registerAll();
private:
	static std::list<RegisterFuncionPointer> _list; 

public:
	CustomTypeHandler(RegisterFuncionPointer fp);
	virtual ~CustomTypeHandler(void);
};
