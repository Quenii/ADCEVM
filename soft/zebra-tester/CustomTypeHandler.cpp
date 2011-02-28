#include "CustomTypeHandler.h"

std::list<RegisterFuncionPointer> CustomTypeHandler::_list; 

CustomTypeHandler::CustomTypeHandler(RegisterFuncionPointer fp)
{
	CustomTypeHandler::_list.push_back(fp);
}

CustomTypeHandler::~CustomTypeHandler(void)
{

}

void CustomTypeHandler::registerAll()
{
	for (std::list<RegisterFuncionPointer>::iterator it = CustomTypeHandler::_list.begin(); it != CustomTypeHandler::_list.end(); ++it)
	{
		RegisterFuncionPointer fp = *it;
		(*fp)();			
	}
}
