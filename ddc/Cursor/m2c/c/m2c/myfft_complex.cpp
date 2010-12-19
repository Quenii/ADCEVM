  #include "matlib.h"
  #pragma hdrstop
  
  #include "myfft_complex.h"
  #include "hamming.h"
  #include "gencoswin.h"
  #include "check_order.h"
  
  
  
  Mm myfft_complex(Mm r, Mm i_, Mm n) {
    begin_scope
    r.setname("r"); i_.setname("i_"); n.setname("n"); 
    dMm(ret); dMm(x); dMm(d); 
    
    call_stack_begin;
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=3.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=1.0;
    nargout_set=0;
    
    // translated code
    
    r = times(r,hamming((CL(n))));
    i_ = times(i_,hamming((CL(n))));
    x = r+j*i_;
    d = 20.0*log10(abs(fft(x,n)));
    ret = d-max(d(colon(3.0,1.0,n/2.0)));
    
    call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    r.setname(NULL); i_.setname(NULL); n.setname(NULL); 
    return ret;
    end_scope
  }
  
  
