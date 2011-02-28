#pragma once

#include <vector>

typedef void (*RegisterFuncionPointer)(void);

class CustomTypeHandler
{
public:
	static void registerAll();
private:
	static std::vector<RegisterFuncionPointer> _list; 

public:
	CustomTypeHandler(RegisterFuncionPointer fp);
	virtual ~CustomTypeHandler(void);
};
