  #include "matlib.h"
  #pragma hdrstop
  
  #include "win.h"
  
  
  Mm win(Mm n, Mm r) {
    begin_scope
    n.setname("n"); r.setname("r"); 
    dMm(v); 
    
    #line 1 "e:/workshop/projects/adv-evm2/matcom/win.m"
    call_stack_begin;
    #line 1 "e:/workshop/projects/adv-evm2/matcom/win.m"
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=2.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=1.0;
    nargout_set=0;
    
    // translated code
    
    #line 2 "e:/workshop/projects/adv-evm2/matcom/win.m"
_   v = ones(1.0,n);
    
    call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    n.setname(NULL); r.setname(NULL); 
    return v;
    end_scope
  }
  
  
