#include "CustomTypeHandler.h"

std::vector<RegisterFuncionPointer> CustomTypeHandler::_list;

CustomTypeHandler::CustomTypeHandler(RegisterFuncionPointer fp)
{
	CustomTypeHandler::_list.push_back(fp);
}

CustomTypeHandler::~CustomTypeHandler(void)
{

}

void CustomTypeHandler::registerAll()
{
	for (int i = 0; i  < CustomTypeHandler::_list.size(); ++i)
	{
		RegisterFuncionPointer fp = CustomTypeHandler::_list[i];
		(*fp)();			
	}
}
