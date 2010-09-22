//------------------------------------------------------------------------------
//
//                    Generated by VCL C++ .NET FrontEnd.
//                   (C)Copyright Boian Mitov 2005 - 2009
//                              www.mitov.com
//
//------------------------------------------------------------------------------
#ifndef CLPDrawLayersCode_H_
#define CLPDrawLayersCode_H_

//------------------------------------------------------------------------------
inline CTLPDrawLayer::CTLPDrawLayer() :
  Visible( GetInstance(), _T( "Visible" ) )
{
  LibraryHandle = VCL_LoadLibrary( "SignalLabBasicPkgCB6.bpl" );
}
//------------------------------------------------------------------------------
inline TLPFunctionEntry CTLPDrawLayer::GetFunction( const char *function_name )
{
  TLPFunctionEntry Result = VCL_GetFunction( LibraryHandle, function_name );
  if( Result )
    return Result;

  return inherited::GetFunction( function_name );
}
//------------------------------------------------------------------------------
inline bool CTLPDrawLayer::GetHasEnable()
{
  static void *__0_FuncPtr_ = NULL;
  if( __0_FuncPtr_ == NULL )
    __0_FuncPtr_ = (void *)( GetFunction( "@Lpdrawlayers@TLPDrawLayer@GetHasEnable$qqrv" ));

  VCLHANDLE __0_ThisPtr_ = Get_VCL_FunctionHandle();

  bool __0_RtnValue_ = (bool)0;

  if( __0_FuncPtr_ && __0_ThisPtr_ )
    {
    _asm
      {
      push eax
      mov  eax,dword ptr [ __0_ThisPtr_ ]
      call dword ptr [ __0_FuncPtr_ ]
      mov  __0_RtnValue_,al
      pop  eax
      }
    }

  return (bool)__0_RtnValue_;
}
//------------------------------------------------------------------------------
inline bool CTLPDrawLayer::GetCanDisable()
{
  static void *__0_FuncPtr_ = NULL;
  if( __0_FuncPtr_ == NULL )
    __0_FuncPtr_ = (void *)( GetFunction( "@Lpdrawlayers@TLPDrawLayer@GetCanDisable$qqrv" ));

  VCLHANDLE __0_ThisPtr_ = Get_VCL_FunctionHandle();

  bool __0_RtnValue_ = (bool)0;

  if( __0_FuncPtr_ && __0_ThisPtr_ )
    {
    _asm
      {
      push eax
      mov  eax,dword ptr [ __0_ThisPtr_ ]
      call dword ptr [ __0_FuncPtr_ ]
      mov  __0_RtnValue_,al
      pop  eax
      }
    }

  return (bool)__0_RtnValue_;
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
inline TLPFunctionEntry CTLPControlDrawLayer::GetFunction( const char *function_name )
{
  TLPFunctionEntry Result = VCL_GetFunction( LibraryHandle, function_name );
  if( Result )
    return Result;

  return inherited::GetFunction( function_name );
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
inline CTLPDrawLayers::CTLPDrawLayers( CLPBaseComponent *a_control, const CLPString a_PropertyName ) :
  inherited( a_control, a_PropertyName ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL )
{
}
//------------------------------------------------------------------------------
inline CTLPDrawLayers::CTLPDrawLayers( CLPClassProperty *a_property, const CLPString a_PropertyName ) :
  inherited( a_property, a_PropertyName ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL )
{
}
//------------------------------------------------------------------------------
inline CTLPDrawLayers::CTLPDrawLayers( CLPClassProperty *a_property, CTLPDrawLayers ( CLPBaseClass::*a_getter )() ) :
  inherited( a_property, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(NULL),
  m_Owner_Property(a_property)
{
}
//------------------------------------------------------------------------------
inline CTLPDrawLayers::CTLPDrawLayers( CLPClassProperty *a_property, CTLPDrawLayers ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPDrawLayers ) ) :
  inherited( a_property, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(a_setter),
  m_Owner_Property(a_property)
{
}
//------------------------------------------------------------------------------
inline CTLPDrawLayers::CTLPDrawLayers( CLPClassProperty *a_property, void ( CLPBaseClass::*a_setter )( CTLPDrawLayers ) ) :
  inherited( a_property, _T( "-" ) ),
  m_Property_Getter(NULL),
  m_Property_Setter(a_setter),
  m_Owner_Property(a_property)
{
}
//------------------------------------------------------------------------------
inline CTLPDrawLayers::CTLPDrawLayers( CLPBaseComponent *a_control, CTLPDrawLayers ( CLPBaseClass::*a_getter )() ) :
  inherited( a_control, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(NULL),
  m_Owner_Property(a_control)
{
}
//------------------------------------------------------------------------------
inline CTLPDrawLayers::CTLPDrawLayers( CLPBaseComponent *a_control, CTLPDrawLayers ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPDrawLayers ) ) :
  inherited( a_control, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(a_setter),
  m_Owner_Property(a_control)
{
}
//------------------------------------------------------------------------------
inline CTLPDrawLayers::CTLPDrawLayers( VCLHANDLE handle, ELPHandleMode owns_handle ) :
  inherited( handle, owns_handle ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL )
{
}
//------------------------------------------------------------------------------
inline CTLPDrawLayers::CTLPDrawLayers( const CTLPDrawLayers &other ) :
  inherited( other ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL )
{
}
//------------------------------------------------------------------------------
inline CTLPDrawLayers & CTLPDrawLayers::operator = ( const CTLPDrawLayers & other )
{
  if( m_Property_Setter )
	  (m_Owner_Property->*m_Property_Setter)( other );

  else
	  inherited::operator = ( other );

  return *this;
}
//------------------------------------------------------------------------------
inline VCLHANDLE CTLPDrawLayers::Get_VCL_Handle() const
{
  if( m_Property_Getter )
	  {
		if( ! m_Object )
		  m_Object = new CVCLObject( (m_Owner_Property->*m_Property_Getter)().Get_VCL_Handle() );

	  }

  return inherited::Get_VCL_Handle();
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem::CTLPLayerCollectionItem( CLPBaseComponent *a_control, const CLPString a_PropertyName ) :
  inherited( a_control, a_PropertyName ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL ),
  LayerIndex( (CTLPLayerCollectionItem *)GetInstance(), &CTLPLayerCollectionItem::GetLayerIndex, &CTLPLayerCollectionItem::SetLayerIndex)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem::CTLPLayerCollectionItem( CLPClassProperty *a_property, const CLPString a_PropertyName ) :
  inherited( a_property, a_PropertyName ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL ),
  LayerIndex( (CTLPLayerCollectionItem *)GetInstance(), &CTLPLayerCollectionItem::GetLayerIndex, &CTLPLayerCollectionItem::SetLayerIndex)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem::CTLPLayerCollectionItem( CLPClassProperty *a_property, CTLPLayerCollectionItem ( CLPBaseClass::*a_getter )() ) :
  inherited( a_property, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(NULL),
  m_Owner_Property(a_property),
  LayerIndex( (CTLPLayerCollectionItem *)GetInstance(), &CTLPLayerCollectionItem::GetLayerIndex, &CTLPLayerCollectionItem::SetLayerIndex)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem::CTLPLayerCollectionItem( CLPClassProperty *a_property, CTLPLayerCollectionItem ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPLayerCollectionItem ) ) :
  inherited( a_property, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(a_setter),
  m_Owner_Property(a_property),
  LayerIndex( (CTLPLayerCollectionItem *)GetInstance(), &CTLPLayerCollectionItem::GetLayerIndex, &CTLPLayerCollectionItem::SetLayerIndex)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem::CTLPLayerCollectionItem( CLPClassProperty *a_property, void ( CLPBaseClass::*a_setter )( CTLPLayerCollectionItem ) ) :
  inherited( a_property, _T( "-" ) ),
  m_Property_Getter(NULL),
  m_Property_Setter(a_setter),
  m_Owner_Property(a_property),
  LayerIndex( (CTLPLayerCollectionItem *)GetInstance(), &CTLPLayerCollectionItem::GetLayerIndex, &CTLPLayerCollectionItem::SetLayerIndex)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem::CTLPLayerCollectionItem( CLPBaseComponent *a_control, CTLPLayerCollectionItem ( CLPBaseClass::*a_getter )() ) :
  inherited( a_control, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(NULL),
  m_Owner_Property(a_control),
  LayerIndex( (CTLPLayerCollectionItem *)GetInstance(), &CTLPLayerCollectionItem::GetLayerIndex, &CTLPLayerCollectionItem::SetLayerIndex)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem::CTLPLayerCollectionItem( CLPBaseComponent *a_control, CTLPLayerCollectionItem ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPLayerCollectionItem ) ) :
  inherited( a_control, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(a_setter),
  m_Owner_Property(a_control),
  LayerIndex( (CTLPLayerCollectionItem *)GetInstance(), &CTLPLayerCollectionItem::GetLayerIndex, &CTLPLayerCollectionItem::SetLayerIndex)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem::CTLPLayerCollectionItem( VCLHANDLE handle, ELPHandleMode owns_handle ) :
  inherited( handle, owns_handle ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL ),
  LayerIndex( (CTLPLayerCollectionItem *)GetInstance(), &CTLPLayerCollectionItem::GetLayerIndex, &CTLPLayerCollectionItem::SetLayerIndex)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem::CTLPLayerCollectionItem( const CTLPLayerCollectionItem &other ) :
  inherited( other ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL ),
  LayerIndex( (CTLPLayerCollectionItem *)GetInstance(), &CTLPLayerCollectionItem::GetLayerIndex, &CTLPLayerCollectionItem::SetLayerIndex)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollectionItem & CTLPLayerCollectionItem::operator = ( const CTLPLayerCollectionItem & other )
{
  if( m_Property_Setter )
	  (m_Owner_Property->*m_Property_Setter)( other );

  else
	  inherited::operator = ( other );

  return *this;
}
//------------------------------------------------------------------------------
inline VCLHANDLE CTLPLayerCollectionItem::Get_VCL_Handle() const
{
  if( m_Property_Getter )
	  {
		if( ! m_Object )
		  m_Object = new CVCLObject( (m_Owner_Property->*m_Property_Getter)().Get_VCL_Handle() );

	  }

  return inherited::Get_VCL_Handle();
}
//------------------------------------------------------------------------------
inline void CTLPLayerCollectionItem::SetLayerIndex( int AValue )
{
  static void *__0_FuncPtr_ = NULL;
  if( __0_FuncPtr_ == NULL )
    __0_FuncPtr_ = (void *)( GetFunction( "@Lpdrawlayers@TLPLayerCollectionItem@SetLayerIndex$qqri" ));

  VCLHANDLE __0_ThisPtr_ = Get_VCL_FunctionHandle();

  if( __0_FuncPtr_ && __0_ThisPtr_ )
    {
    int __1_Param1 = AValue;

    _asm
      {
      push eax
      push edx
      mov  edx,__1_Param1
      mov  eax,dword ptr [ __0_ThisPtr_ ]
      call dword ptr [ __0_FuncPtr_ ]
      pop  edx
      pop  eax
      }
    }

}
//------------------------------------------------------------------------------
inline int CTLPLayerCollectionItem::GetLayerIndex()
{
  static void *__0_FuncPtr_ = NULL;
  if( __0_FuncPtr_ == NULL )
    __0_FuncPtr_ = (void *)( GetFunction( "@Lpdrawlayers@TLPLayerCollectionItem@GetLayerIndex$qqrv" ));

  VCLHANDLE __0_ThisPtr_ = Get_VCL_FunctionHandle();

  int __0_RtnValue_ = (int)0;

  if( __0_FuncPtr_ && __0_ThisPtr_ )
    {
    _asm
      {
      push eax
      mov  eax,dword ptr [ __0_ThisPtr_ ]
      call dword ptr [ __0_FuncPtr_ ]
      mov  __0_RtnValue_,eax
      pop  eax
      }
    }

  return (int)__0_RtnValue_;
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
inline CTLPLayerCollection::CTLPLayerCollection( CLPBaseComponent *a_control, const CLPString a_PropertyName ) :
  inherited( a_control, a_PropertyName ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL )
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollection::CTLPLayerCollection( CLPClassProperty *a_property, const CLPString a_PropertyName ) :
  inherited( a_property, a_PropertyName ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL )
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollection::CTLPLayerCollection( CLPClassProperty *a_property, CTLPLayerCollection ( CLPBaseClass::*a_getter )() ) :
  inherited( a_property, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(NULL),
  m_Owner_Property(a_property)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollection::CTLPLayerCollection( CLPClassProperty *a_property, CTLPLayerCollection ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPLayerCollection ) ) :
  inherited( a_property, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(a_setter),
  m_Owner_Property(a_property)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollection::CTLPLayerCollection( CLPClassProperty *a_property, void ( CLPBaseClass::*a_setter )( CTLPLayerCollection ) ) :
  inherited( a_property, _T( "-" ) ),
  m_Property_Getter(NULL),
  m_Property_Setter(a_setter),
  m_Owner_Property(a_property)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollection::CTLPLayerCollection( CLPBaseComponent *a_control, CTLPLayerCollection ( CLPBaseClass::*a_getter )() ) :
  inherited( a_control, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(NULL),
  m_Owner_Property(a_control)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollection::CTLPLayerCollection( CLPBaseComponent *a_control, CTLPLayerCollection ( CLPBaseClass::*a_getter )(), void ( CLPBaseClass::*a_setter )( CTLPLayerCollection ) ) :
  inherited( a_control, _T( "-" ) ),
  m_Property_Getter(a_getter),
  m_Property_Setter(a_setter),
  m_Owner_Property(a_control)
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollection::CTLPLayerCollection( VCLHANDLE handle, ELPHandleMode owns_handle ) :
  inherited( handle, owns_handle ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL )
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollection::CTLPLayerCollection( const CTLPLayerCollection &other ) :
  inherited( other ),
  m_Property_Getter( NULL ),
  m_Property_Setter( NULL ),
  m_Owner_Property( NULL )
{
}
//------------------------------------------------------------------------------
inline CTLPLayerCollection & CTLPLayerCollection::operator = ( const CTLPLayerCollection & other )
{
  if( m_Property_Setter )
	  (m_Owner_Property->*m_Property_Setter)( other );

  else
	  inherited::operator = ( other );

  return *this;
}
//------------------------------------------------------------------------------
inline VCLHANDLE CTLPLayerCollection::Get_VCL_Handle() const
{
  if( m_Property_Getter )
	  {
		if( ! m_Object )
		  m_Object = new CVCLObject( (m_Owner_Property->*m_Property_Getter)().Get_VCL_Handle() );

	  }

  return inherited::Get_VCL_Handle();
}
//------------------------------------------------------------------------------
#endif   // CLPDrawLayersCode_H_
//------------------------------------------------------------------------------
