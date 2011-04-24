//
// MATLAB Compiler: 4.8 (R2008a)
// Date: Sun Apr 24 13:53:55 2011
// Arguments: "-B" "macro_default" "-W" "cpplib:libalgo" "-T" "link:lib"
// "myfft" "calc_dynam_params" 
//

#include "mclmcrrt.h"

#ifdef __cplusplus
extern "C" {
#endif
extern const unsigned char __MCC_libalgo_session_key[] = {
    '4', 'F', '4', 'D', 'D', '3', '2', '9', 'A', '3', '5', '0', '3', '9', '4',
    'D', 'A', '3', '9', '6', '9', 'F', 'A', 'D', '3', '0', 'E', '3', '9', 'D',
    'E', 'F', 'F', '1', 'E', '3', '5', '7', 'F', '0', 'E', '3', '2', '2', '6',
    'D', 'A', '6', 'F', 'F', 'B', 'F', '1', 'B', '4', '9', 'E', '3', '8', '8',
    'F', '9', '7', 'B', '6', '7', 'F', '4', 'C', '1', 'D', '7', '5', '5', 'F',
    'E', 'B', '8', '6', '6', '3', 'C', '0', '8', '8', 'A', '9', 'E', '6', 'F',
    '8', '1', '1', '9', '2', 'A', '7', '8', '6', 'D', '7', '7', '3', '3', '2',
    '4', '6', '5', '7', '6', '1', '7', '0', 'D', '0', '0', 'C', 'F', '4', 'A',
    'D', 'F', 'A', 'C', 'C', '1', 'C', 'D', 'D', 'D', 'D', 'D', 'B', '3', '0',
    '8', '5', '7', '8', '9', 'B', 'F', '2', 'A', 'F', 'E', '3', 'D', '7', '3',
    '9', 'C', '6', 'A', '0', 'A', '2', 'A', 'C', '3', 'E', '1', '1', '6', '4',
    'E', '0', 'D', '0', '6', '1', 'F', '8', '7', 'A', '5', 'E', '1', '2', 'D',
    '9', 'C', '4', '3', '2', '9', 'D', '6', 'E', 'A', '4', '5', '4', '9', '2',
    'E', '9', '7', '5', '2', '8', '2', '7', 'B', '6', '2', '5', '8', 'A', 'B',
    '9', 'C', '2', 'B', 'D', 'B', '9', 'D', '7', '4', '6', 'A', '2', '4', '5',
    '2', '5', '1', '0', '9', '5', '1', '4', 'C', '8', '3', '8', '2', 'F', 'E',
    '1', '8', '9', '9', '5', '7', '8', '5', 'E', 'E', '3', '8', '0', '9', '0',
    '9', '\0'};

extern const unsigned char __MCC_libalgo_public_key[] = {
    '3', '0', '8', '1', '9', 'D', '3', '0', '0', 'D', '0', '6', '0', '9', '2',
    'A', '8', '6', '4', '8', '8', '6', 'F', '7', '0', 'D', '0', '1', '0', '1',
    '0', '1', '0', '5', '0', '0', '0', '3', '8', '1', '8', 'B', '0', '0', '3',
    '0', '8', '1', '8', '7', '0', '2', '8', '1', '8', '1', '0', '0', 'C', '4',
    '9', 'C', 'A', 'C', '3', '4', 'E', 'D', '1', '3', 'A', '5', '2', '0', '6',
    '5', '8', 'F', '6', 'F', '8', 'E', '0', '1', '3', '8', 'C', '4', '3', '1',
    '5', 'B', '4', '3', '1', '5', '2', '7', '7', 'E', 'D', '3', 'F', '7', 'D',
    'A', 'E', '5', '3', '0', '9', '9', 'D', 'B', '0', '8', 'E', 'E', '5', '8',
    '9', 'F', '8', '0', '4', 'D', '4', 'B', '9', '8', '1', '3', '2', '6', 'A',
    '5', '2', 'C', 'C', 'E', '4', '3', '8', '2', 'E', '9', 'F', '2', 'B', '4',
    'D', '0', '8', '5', 'E', 'B', '9', '5', '0', 'C', '7', 'A', 'B', '1', '2',
    'E', 'D', 'E', '2', 'D', '4', '1', '2', '9', '7', '8', '2', '0', 'E', '6',
    '3', '7', '7', 'A', '5', 'F', 'E', 'B', '5', '6', '8', '9', 'D', '4', 'E',
    '6', '0', '3', '2', 'F', '6', '0', 'C', '4', '3', '0', '7', '4', 'A', '0',
    '4', 'C', '2', '6', 'A', 'B', '7', '2', 'F', '5', '4', 'B', '5', '1', 'B',
    'B', '4', '6', '0', '5', '7', '8', '7', '8', '5', 'B', '1', '9', '9', '0',
    '1', '4', '3', '1', '4', 'A', '6', '5', 'F', '0', '9', '0', 'B', '6', '1',
    'F', 'C', '2', '0', '1', '6', '9', '4', '5', '3', 'B', '5', '8', 'F', 'C',
    '8', 'B', 'A', '4', '3', 'E', '6', '7', '7', '6', 'E', 'B', '7', 'E', 'C',
    'D', '3', '1', '7', '8', 'B', '5', '6', 'A', 'B', '0', 'F', 'A', '0', '6',
    'D', 'D', '6', '4', '9', '6', '7', 'C', 'B', '1', '4', '9', 'E', '5', '0',
    '2', '0', '1', '1', '1', '\0'};

static const char * MCC_libalgo_matlabpath_data[] = 
  { "libalgo/", "toolbox/compiler/deploy/", "$TOOLBOXMATLABDIR/general/",
    "$TOOLBOXMATLABDIR/ops/", "$TOOLBOXMATLABDIR/lang/",
    "$TOOLBOXMATLABDIR/elmat/", "$TOOLBOXMATLABDIR/elfun/",
    "$TOOLBOXMATLABDIR/specfun/", "$TOOLBOXMATLABDIR/matfun/",
    "$TOOLBOXMATLABDIR/datafun/", "$TOOLBOXMATLABDIR/polyfun/",
    "$TOOLBOXMATLABDIR/funfun/", "$TOOLBOXMATLABDIR/sparfun/",
    "$TOOLBOXMATLABDIR/scribe/", "$TOOLBOXMATLABDIR/graph2d/",
    "$TOOLBOXMATLABDIR/graph3d/", "$TOOLBOXMATLABDIR/specgraph/",
    "$TOOLBOXMATLABDIR/graphics/", "$TOOLBOXMATLABDIR/uitools/",
    "$TOOLBOXMATLABDIR/strfun/", "$TOOLBOXMATLABDIR/imagesci/",
    "$TOOLBOXMATLABDIR/iofun/", "$TOOLBOXMATLABDIR/audiovideo/",
    "$TOOLBOXMATLABDIR/timefun/", "$TOOLBOXMATLABDIR/datatypes/",
    "$TOOLBOXMATLABDIR/verctrl/", "$TOOLBOXMATLABDIR/codetools/",
    "$TOOLBOXMATLABDIR/helptools/", "$TOOLBOXMATLABDIR/winfun/",
    "$TOOLBOXMATLABDIR/demos/", "$TOOLBOXMATLABDIR/timeseries/",
    "$TOOLBOXMATLABDIR/hds/", "$TOOLBOXMATLABDIR/guide/",
    "$TOOLBOXMATLABDIR/plottools/", "toolbox/local/",
    "toolbox/shared/dastudio/", "$TOOLBOXMATLABDIR/datamanager/",
    "toolbox/compiler/", "toolbox/signal/signal/", "toolbox/shared/spcuilib/" };

static const char * MCC_libalgo_classpath_data[] = 
  { "" };

static const char * MCC_libalgo_libpath_data[] = 
  { "" };

static const char * MCC_libalgo_app_opts_data[] = 
  { "" };

static const char * MCC_libalgo_run_opts_data[] = 
  { "" };

static const char * MCC_libalgo_warning_state_data[] = 
  { "off:MATLAB:dispatcher:nameConflict" };


mclComponentData __MCC_libalgo_component_data = { 

  /* Public key data */
  __MCC_libalgo_public_key,

  /* Component name */
  "libalgo",

  /* Component Root */
  "",

  /* Application key data */
  __MCC_libalgo_session_key,

  /* Component's MATLAB Path */
  MCC_libalgo_matlabpath_data,

  /* Number of directories in the MATLAB Path */
  40,

  /* Component's Java class path */
  MCC_libalgo_classpath_data,
  /* Number of directories in the Java class path */
  0,

  /* Component's load library path (for extra shared libraries) */
  MCC_libalgo_libpath_data,
  /* Number of directories in the load library path */
  0,

  /* MCR instance-specific runtime options */
  MCC_libalgo_app_opts_data,
  /* Number of MCR instance-specific runtime options */
  0,

  /* MCR global runtime options */
  MCC_libalgo_run_opts_data,
  /* Number of MCR global runtime options */
  0,
  
  /* Component preferences directory */
  "libalgo_FA60EECB3978219914EFCAA4C0772B6A",

  /* MCR warning status data */
  MCC_libalgo_warning_state_data,
  /* Number of MCR warning status modifiers */
  1,

  /* Path to component - evaluated at runtime */
  NULL

};

#ifdef __cplusplus
}
#endif


