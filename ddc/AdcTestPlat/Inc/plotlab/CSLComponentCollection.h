//------------------------------------------------------------------------------
//
//                    Generated by VCL C++ .NET FrontEnd.
//                   (C)Copyright Boian Mitov 2005 - 2009
//                              www.mitov.com
//
//------------------------------------------------------------------------------
#ifndef CSLComponentCollection_H_
#define CSLComponentCollection_H_

//------------------------------------------------------------------------------
#ifndef VCLSupportH
  #include <VCLSupport.h>
#endif

#ifndef CSignalLabBasicPkgCB6_H_
  #include <CSignalLabBasicPkgCB6.h>
#endif
#ifndef CSLStreamTypes_H_
  #include <CSLStreamTypes.h>
#endif


//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
class CTSLComponentItem : public CLPComponent
{
//DOM-IGNORE-BEGIN
  typedef CLPComponent inherited;
//DOM-IGNORE-END

  VCLHANDLE LibraryHandle;

protected:
  virtual TLPFunctionEntry  GetFunction( const char *function_name );

public:    // Properties
  CLPAccessProperty<CTSLComponentItem,int> Index;

protected:
  int GetIndex();
  void SetIndex( int Value );

public:
  virtual bool GetHasEnable();
  virtual bool GetCanDisable();

public:
  CTSLComponentItem();
};
//------------------------------------------------------------------------------
class CTSLCustomControlItem : public CTLPCustomControl
{
//DOM-IGNORE-BEGIN
  typedef CTLPCustomControl inherited;
//DOM-IGNORE-END

  VCLHANDLE LibraryHandle;

protected:
  virtual TLPFunctionEntry  GetFunction( const char *function_name );

public:    // Properties
  CLPAccessProperty<CTSLCustomControlItem,int> Index;

protected:
  int GetIndex();
  void SetIndex( int Value );

public:
  virtual bool GetHasEnable();
  virtual bool GetCanDisable();

public:
  CTSLCustomControlItem();
};
//------------------------------------------------------------------------------
#include <CSLComponentCollectionCode.h>
//------------------------------------------------------------------------------
#endif   // CSLComponentCollection_H_
//------------------------------------------------------------------------------
