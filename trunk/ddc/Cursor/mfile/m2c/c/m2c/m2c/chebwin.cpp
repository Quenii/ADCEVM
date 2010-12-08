  #include "matlib.h"
  #pragma hdrstop
  
  #include "chebwin.h"
  #include "check_order.h"
  
  
  
  Mm chebwin(Mm n_est, Mm r) {
    begin_scope
    n_est.setname("n_est"); r.setname("r"); 
    dMm(w); dMm(n); dMm(trivialwin); 
    
    call_stack_begin;
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=2.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=1.0;
    nargout_set=0;
    
    // translated code
    
    //CHEBWIN Chebyshev window.
    //   CHEBWIN(N,R) returns the N-point Chebyshev window with R decibels of
    //   relative sidelobe attenuation.
    //
    //   See also BARTLETT, BARTHANNWIN, BLACKMAN, BLACKMANHARRIS, BOHMANWIN, 
    //            GAUSSWIN, HAMMING, HANN, KAISER, NUTTALLWIN, RECTWIN, TRIANG, 
    //            TUKEYWIN, WINDOW.
    
    //   Author: James Montanaro
    //   Reference: E. Brigham, "The Fast Fourier Transform and its Applications" 
    
    //   Copyright 1988-2002 The MathWorks, Inc.
    //   $Revision: 1.17 $  $Date: 2002/03/28 17:27:21 $
    
    error(nargchk(2.0,2.0,nargin()));
    
    /*[n,w,trivialwin] = */check_order(n_est,i_o,n,w,trivialwin);
    if (istrue(trivialwin)) {
      goto return_from_chebwin;
    }
    
    if (istrue(r<0.0)) {
      error(TM("Attenuation must be specified as a positive number."));
    }
    
    w = error(TM("'chebwinx' was not found.\n\nIf it is a variable, make sure it is initialized before first use,\nfor example:  chebwinx=[];\n\nIf it is a m-file, please copy it to the current directory or add\nits directory to the matlabpath.\n") \
      )(n,r);
    
    
    // [EOF] chebwin.m
    
    return_from_chebwin: call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    n_est.setname(NULL); r.setname(NULL); 
    return w;
    end_scope
  }
  
  
  Mm chebwin() {
    begin_scope
    double old_nargin=nargin_val; nargin_val=0.0; nargin_set=1;
    dMm(n_est); dMm(r); 
    dMm(ret1a);
    ret1a=chebwin(n_est, r);
    nargin_val=old_nargin;
    return ret1a;
    end_scope
  }
  
  Mm chebwin(Mm n_est) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=1.0; nargin_set=1;
    dMm(r); 
    dMm(ret1a);
    ret1a=chebwin(n_est, r);
    nargin_val=old_nargin;
    return ret1a;
    end_scope
  }
  
