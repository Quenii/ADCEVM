//------------------------------------------------------------------------------
//
//                    Generated by VCL C++ .NET FrontEnd.
//                   (C)Copyright Boian Mitov 2005 - 2009
//                              www.mitov.com
//
//------------------------------------------------------------------------------
#ifndef CSLStreamTypes_H_
#define CSLStreamTypes_H_

//------------------------------------------------------------------------------
#ifndef VCLSupportH
  #include <VCLSupport.h>
#endif

#ifndef CSignalLabBasicPkgCB6_H_
  #include <CSignalLabBasicPkgCB6.h>
#endif


//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
class CTLPCustomControl : public CLPControl
{
//DOM-IGNORE-BEGIN
  typedef CLPControl inherited;
//DOM-IGNORE-END

  VCLHANDLE LibraryHandle;

protected:
  virtual TLPFunctionEntry  GetFunction( const char *function_name );

};
//------------------------------------------------------------------------------
class CTLPLockedPersistentNotify : public CTLPLockedPersistent
{
//DOM-IGNORE-BEGIN
  typedef CTLPLockedPersistent inherited;
//DOM-IGNORE-END

protected:
  virtual TLPFunctionEntry  GetFunction( const char *function_name )
  {
    TLPFunctionEntry Result = VCL_GetFunction( ::Get_SignalLabBasicPkgCB6(), function_name );
    if( Result )
      return Result;

    return inherited::GetFunction( function_name );
  }

public:
  CTLPLockedPersistentNotify( CLPBaseComponent *a_control, const CLPString a_PropertyName );
  CTLPLockedPersistentNotify( CLPClassProperty *a_property, const CLPString a_PropertyName );
  CTLPLockedPersistentNotify( CLPClassProperty *a_property, CTLPLockedPersistentNotify ( CLPBaseClass::*a_getter )() );
  CTLPLockedPersistentNotify( CLPClassProperty *a_property, CTLPLockedPersistentNotify ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPLockedPersistentNotify ) );
  CTLPLockedPersistentNotify( CLPClassProperty *a_property, void ( CLPBaseClass::*a_setter )( CTLPLockedPersistentNotify ) );
  CTLPLockedPersistentNotify( CLPBaseComponent *a_control, CTLPLockedPersistentNotify ( CLPBaseClass::*a_getter )() );
  CTLPLockedPersistentNotify( CLPBaseComponent *a_control, CTLPLockedPersistentNotify ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPLockedPersistentNotify ) );
  CTLPLockedPersistentNotify( VCLHANDLE handle, ELPHandleMode owns_handle = hmNone );
  CTLPLockedPersistentNotify( const CTLPLockedPersistentNotify &other );

public:
  CTLPLockedPersistentNotify & operator = ( const CTLPLockedPersistentNotify & other );

protected:
  virtual VCLHANDLE Get_VCL_Handle() const;

protected:
  CLPBaseClass        *m_Owner_Property;
  CTLPLockedPersistentNotify ( CLPBaseClass::*m_Property_Getter )();
  void ( CLPBaseClass::*m_Property_Setter )( CTLPLockedPersistentNotify Value );
};
//------------------------------------------------------------------------------
class CTLPOptionalProperty : public CTLPLockedPersistentNotify
{
//DOM-IGNORE-BEGIN
  typedef CTLPLockedPersistentNotify inherited;
//DOM-IGNORE-END

protected:
  virtual TLPFunctionEntry  GetFunction( const char *function_name )
  {
    TLPFunctionEntry Result = VCL_GetFunction( ::Get_SignalLabBasicPkgCB6(), function_name );
    if( Result )
      return Result;

    return inherited::GetFunction( function_name );
  }

public:    // Properties
  CLPProperty<bool> Visible;

public:
  CTLPOptionalProperty( CLPBaseComponent *a_control, const CLPString a_PropertyName );
  CTLPOptionalProperty( CLPClassProperty *a_property, const CLPString a_PropertyName );
  CTLPOptionalProperty( CLPClassProperty *a_property, CTLPOptionalProperty ( CLPBaseClass::*a_getter )() );
  CTLPOptionalProperty( CLPClassProperty *a_property, CTLPOptionalProperty ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPOptionalProperty ) );
  CTLPOptionalProperty( CLPClassProperty *a_property, void ( CLPBaseClass::*a_setter )( CTLPOptionalProperty ) );
  CTLPOptionalProperty( CLPBaseComponent *a_control, CTLPOptionalProperty ( CLPBaseClass::*a_getter )() );
  CTLPOptionalProperty( CLPBaseComponent *a_control, CTLPOptionalProperty ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPOptionalProperty ) );
  CTLPOptionalProperty( VCLHANDLE handle, ELPHandleMode owns_handle = hmNone );
  CTLPOptionalProperty( const CTLPOptionalProperty &other );

public:
  CTLPOptionalProperty & operator = ( const CTLPOptionalProperty & other );

protected:
  virtual VCLHANDLE Get_VCL_Handle() const;

protected:
  CLPBaseClass        *m_Owner_Property;
  CTLPOptionalProperty ( CLPBaseClass::*m_Property_Getter )();
  void ( CLPBaseClass::*m_Property_Setter )( CTLPOptionalProperty Value );
};
//------------------------------------------------------------------------------
class CTVLOptionalPenProperty : public CTLPOptionalProperty
{
//DOM-IGNORE-BEGIN
  typedef CTLPOptionalProperty inherited;
//DOM-IGNORE-END

protected:
  virtual TLPFunctionEntry  GetFunction( const char *function_name )
  {
    TLPFunctionEntry Result = VCL_GetFunction( ::Get_SignalLabBasicPkgCB6(), function_name );
    if( Result )
      return Result;

    return inherited::GetFunction( function_name );
  }

public:    // Class Properties
  class CTPen &Pen;

public:
  CTVLOptionalPenProperty( CLPBaseComponent *a_control, const CLPString a_PropertyName );
  CTVLOptionalPenProperty( CLPClassProperty *a_property, const CLPString a_PropertyName );
  CTVLOptionalPenProperty( CLPClassProperty *a_property, CTVLOptionalPenProperty ( CLPBaseClass::*a_getter )() );
  CTVLOptionalPenProperty( CLPClassProperty *a_property, CTVLOptionalPenProperty ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTVLOptionalPenProperty ) );
  CTVLOptionalPenProperty( CLPClassProperty *a_property, void ( CLPBaseClass::*a_setter )( CTVLOptionalPenProperty ) );
  CTVLOptionalPenProperty( CLPBaseComponent *a_control, CTVLOptionalPenProperty ( CLPBaseClass::*a_getter )() );
  CTVLOptionalPenProperty( CLPBaseComponent *a_control, CTVLOptionalPenProperty ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTVLOptionalPenProperty ) );
  CTVLOptionalPenProperty( VCLHANDLE handle, ELPHandleMode owns_handle = hmNone );
  CTVLOptionalPenProperty( const CTVLOptionalPenProperty &other );
  virtual ~CTVLOptionalPenProperty();

public:
  CTVLOptionalPenProperty & operator = ( const CTVLOptionalPenProperty & other );

protected:
  virtual VCLHANDLE Get_VCL_Handle() const;

protected:
  CLPBaseClass        *m_Owner_Property;
  CTVLOptionalPenProperty ( CLPBaseClass::*m_Property_Getter )();
  void ( CLPBaseClass::*m_Property_Setter )( CTVLOptionalPenProperty Value );
};
//------------------------------------------------------------------------------
#include <CSLStreamTypesCode.h>
//------------------------------------------------------------------------------
#endif   // CSLStreamTypes_H_
//------------------------------------------------------------------------------
