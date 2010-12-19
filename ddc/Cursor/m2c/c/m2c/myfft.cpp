  #include "matlib.h"
  #pragma hdrstop
  
  #include "myfft.h"
  
  
  Mm myfft(Mm x, Mm n) {
    begin_scope
    x.setname("x"); n.setname("n"); 
    dMm(ret); 
    
    call_stack_begin;
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=2.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=1.0;
    nargout_set=0;
    
    // translated code
    
    ret = abs(fft(x,n));
    
    call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    x.setname(NULL); n.setname(NULL); 
    return ret;
    end_scope
  }
  
  
