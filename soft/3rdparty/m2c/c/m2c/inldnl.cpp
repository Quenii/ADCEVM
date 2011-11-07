  #include "matlib.h"
  #pragma hdrstop
  
  #include "inldnl.h"
  
  
  // $$$ clear all;
  // $$$ 
  // $$$ filename=input('Enter File Name: ','s');    %enter the file name of the datas you acquired from the ADC, for example:file2.txt
  // $$$ 
  // $$$ fid=fopen(filename,'r');
  // $$$ if fid==-1,
  // $$$    warning='no such file'
  // $$$    return;
  // $$$ end
  // $$$ 
  // $$$ numpt=input('Enter Number of Data Points:  ');   %for example of file2.txt:8388608
  // $$$ numbit=input ('Enter ADC Resolution:  ');        %for example of file2.txt:14
  // $$$ 
  // $$$ T1=input('T1:');    %the transition level of logic 0
  // $$$ T2=input('T2:');    %the transition level of logic 2^numbit
  // $$$ 
  // $$$ T_ideal_1=input('T_ideal_1:');   %the ideal level of logic 0
  // $$$ T_ideal_2=input('T_ideal_2:');   %the ideal level of logic 2^numbit
  // $$$ 
  // $$$ 
  // $$$ [v1,count]=fscanf(fid,'%f',[1,numpt]);
  // $$$ fclose(fid);
  
  Mm inldnl(Mm samples, Mm numbit, Mm numpt, Mm T1, Mm T2, Mm T_ideal_1, Mm T_ideal_2, i_o_t, Mm& INLar__o, Mm& DNLar__o, \
     Mm& H__o, Mm& indexl__o, Mm& indexh__o) {
    begin_scope
    samples.setname("samples"); numbit.setname("numbit"); numpt.setname("numpt"); T1.setname("T1"); T2.setname("T2") \
      ; T_ideal_1.setname("T_ideal_1"); T_ideal_2.setname("T_ideal_2"); 
    dMm(INLar); dMm(DNLar); dMm(H); dMm(indexl); dMm(indexh); dMm(NCODES); dMm(v1); dMm(v2); dMm(code); dMm(Hc);  \
      dMm(T); dMm(Tnom); dMm(S); dMm(i_); dMm(i_inldnl_v0); dMm(jh); dMm(jh_inldnl_v1); dMm(jl); dMm(jl_inldnl_v2);  \
      dMm(warning_); dMm(k); dMm(k_inldnl_v3); dMm(i_inldnl_v4); dMm(Q); dMm(A); dMm(C); dMm(k_inldnl_v5); dMm(sTk) \
      ; dMm(sT); dMm(sT2); dMm(k_inldnl_v6); dMm(G); dMm(Vos); dMm(k_inldnl_v7); dMm(e); dMm(k_inldnl_v8); 
    
    call_stack_begin;
    // nargin, nargout entry code
    double old_nargin=nargin_val; if (!nargin_set) nargin_val=7.0;
    nargin_set=0;
    double old_nargout=nargout_val; if (!nargout_set) nargout_val=5.0;
    nargout_set=0;
    
    // translated code
    
    // INLDNL - 
    // plot([(indexl):(indexh-2)],DNLar);
    // plot([(indexl):(indexh-1)],INLar);
    
    NCODES = mpower(2.0,numbit);
    
    v1 = samples;
    //v1 = ctranspose(v1);
    v2 = v1/mpower(2.0,(16.0-numbit))+mpower(2.0,(numbit-1.0));
    code = round(v2(c_p,1.0)-0.4999999);
    
    H = zeros(1.0,NCODES);
    Hc = zeros(1.0,NCODES-1.0);
    T = zeros(1.0,NCODES-1.0);
    Tnom = zeros(1.0,NCODES-1.0);
    S = numpt;
    
    
    i_inldnl_v0 = colon(1.0,1.0,size(code)); int i_inldnl_i0;
    for (i_inldnl_i0=0;i_inldnl_i0<i_inldnl_v0.cols();i_inldnl_i0++) {
      forelem(i_,i_inldnl_v0,i_inldnl_i0);
      H(code(i_)+1.0) = H(code(i_)+1.0)+1.0;
    }
    
    
    //======================================
    //search for the positions of '111бн11' and '000бн00'
    //======================================
    jh_inldnl_v1 = colon(mpower(2.0,(numbit-1.0)),1.0,NCODES); int jh_inldnl_i1;
    for (jh_inldnl_i1=0;jh_inldnl_i1<jh_inldnl_v1.cols();jh_inldnl_i1++) {
      forelem(jh,jh_inldnl_v1,jh_inldnl_i1);
      if (istrue(H(jh)==0.0)) {
        indexh = jh-1.0;
        break;
      } else {
        
        indexh = jh;
      }
    }
    
    jl_inldnl_v2 = colon(mpower(2.0,(numbit-1.0)),-1.0,1.0); int jl_inldnl_i2;
    for (jl_inldnl_i2=0;jl_inldnl_i2<jl_inldnl_v2.cols();jl_inldnl_i2++) {
      forelem(jl,jl_inldnl_v2,jl_inldnl_i2);
      if (istrue(H(jl)==0.0)) {
        indexl = jl+1.0;
        break;
      } else {
        
        indexl = jl;
      }
    }
    
    if (istrue(indexh<NCODES)&&istrue(indexl>1.0)) {
      warning_ = TM("can not reach \"111..11\" and \"000..00\"");
      goto return_from_inldnl;
    } else
    if (istrue(indexl>1.0)) {
      warning_ = TM("can not reach \"000..00\"");
      goto return_from_inldnl;
    } else
    if (istrue(indexh<NCODES)) {
      warning_ = TM("can not reach \"111..11\"");
      goto return_from_inldnl;
    }
    
    k_inldnl_v3 = colon(1.0,1.0,(NCODES-1.0)); int k_inldnl_i3;
    for (k_inldnl_i3=0;k_inldnl_i3<k_inldnl_v3.cols();k_inldnl_i3++) {
      forelem(k,k_inldnl_v3,k_inldnl_i3);
      Tnom(k) = (k-0.5)*(T_ideal_2-T_ideal_1)/(NCODES);
      i_inldnl_v4 = colon(1.0,1.0,k); int i_inldnl_i4;
      for (i_inldnl_i4=0;i_inldnl_i4<i_inldnl_v4.cols();i_inldnl_i4++) {
        forelem(i_,i_inldnl_v4,i_inldnl_i4);
        Hc(k) = Hc(k)+H(i_);
      }
    }
    
    Q = (Tnom(NCODES-1.0)-Tnom(1.0))/(NCODES-2.0);
    A = (T2-T1)/(cos(pi*Hc(1.0)/S)+cos(pi*(1.0-(Hc(NCODES-1.0)/S))));
    C = (T2*cos(pi*Hc(1.0)/S)+T1*cos(pi*(1.0-(Hc(NCODES-1.0)/S))))/(cos(pi*Hc(1.0)/S)+cos(pi*(1.0-(Hc(NCODES-1.0) \
      /S))));
    
    
    k_inldnl_v5 = colon(1.0,1.0,(NCODES-1.0)); int k_inldnl_i5;
    for (k_inldnl_i5=0;k_inldnl_i5<k_inldnl_v5.cols();k_inldnl_i5++) {
      forelem(k,k_inldnl_v5,k_inldnl_i5);
      T(k) = C-A*cos(pi*Hc(k)/S);
    }
    
    //==============
    //best fit
    //==============   
    //in this file2.txt example, the best fit is better than end point
    sTk = 0.0;
    sT = 0.0;
    sT2 = 0.0;
    
    k_inldnl_v6 = colon(1.0,1.0,(NCODES-1.0)); int k_inldnl_i6;
    for (k_inldnl_i6=0;k_inldnl_i6<k_inldnl_v6.cols();k_inldnl_i6++) {
      forelem(k,k_inldnl_v6,k_inldnl_i6);
      sTk = sTk+k*T(k);
      sT = sT+T(k);
      sT2 = sT2+T(k)*T(k);
    }
    
    G = Q*(NCODES-1.0)*(sTk-mpower(2.0,(numbit-1.0))*sT)/((NCODES-1.0)*sT2-sT*sT);
    Vos = Tnom(1.0)+Q*(mpower(2.0,(numbit-1.0))-1.0)-G*sT/(NCODES-1.0);
    
    //==============
    //calculate INL
    //==============
    k_inldnl_v7 = colon((indexl),1.0,(indexh-1.0)); int k_inldnl_i7;
    for (k_inldnl_i7=0;k_inldnl_i7<k_inldnl_v7.cols();k_inldnl_i7++) {
      forelem(k,k_inldnl_v7,k_inldnl_i7);
      e(k) = Tnom(k)-G*T(k)-Vos;
      INLar(k) = e(k)/Q;
    }
    
    //==============
    //calculate DNL
    //==============
    k_inldnl_v8 = colon((indexl),1.0,(indexh-2.0)); int k_inldnl_i8;
    for (k_inldnl_i8=0;k_inldnl_i8<k_inldnl_v8.cols();k_inldnl_i8++) {
      forelem(k,k_inldnl_v8,k_inldnl_i8);
      DNLar(k) = G*(T(k+1.0)-T(k))/Q-1.0;
    }
    
    
    //==============
    //plot figures
    //==============
    H = H(colon(1.0,1.0,NCODES));
    //figure();
    //plot((CL((BR(colon(1.0,1.0,NCODES)))),H));
    //axis((BR(0.0),NCODES,0.0,max(H)));
    
    DNLar = DNLar(colon((indexl),1.0,(indexh-2.0)));
    //figure();
    //plot((CL((BR(colon((indexl),1.0,(indexh-2.0))))),DNLar));
    //axis((BR(0.0),NCODES,-max(abs(DNLar)),max(abs(DNLar))));
    //grid(TM("on"));
    //title((CL(TM("DIFFERENTIAL NONLINEARITY vs. DIGITAL OUTPUT CODE"))));
    //xlabel((CL(TM("DIGITAL OUTPUT CODE"))));
    //ylabel((CL(TM("DNL (LSB)"))));
    
    INLar = INLar(colon((indexl),1.0,(indexh-1.0)));
    //figure();
    //plot((CL((BR(colon((indexl),1.0,(indexh-1.0))))),INLar));
    //axis((BR(0.0),NCODES,-max(abs(INLar)),max(abs(INLar))));
    //grid(TM("on"));
    //title((CL(TM("INTEGRAL NONLINEARITY vs. DIGITAL OUTPUT CODE"))));
    //xlabel((CL(TM("DIGITAL OUTPUT CODE"))));
    //ylabel((CL(TM("INL(LSB)"))));
    
    return_from_inldnl: call_stack_end;
    
    // nargin, nargout exit code
    nargin_val=old_nargin; nargout_val=old_nargout;
    
    // function exit code
    samples.setname(NULL); numbit.setname(NULL); numpt.setname(NULL); T1.setname(NULL); T2.setname(NULL); T_ideal_1.setname( \
      NULL); T_ideal_2.setname(NULL); 
    INLar__o=INLar; DNLar__o=DNLar; H__o=H; indexl__o=indexl; indexh__o=indexh; 
    return x_M;
    end_scope
  }
  
  
  Mm inldnl(Mm samples, Mm numbit, Mm numpt, Mm T1, Mm T2, Mm T_ideal_1, Mm T_ideal_2) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=1.0; nargout_set=1;
    dMm(INLar__o); dMm(DNLar__o); dMm(H__o); dMm(indexl__o); dMm(indexh__o); 
    inldnl(samples, numbit, numpt, T1, T2, T_ideal_1, T_ideal_2, i_o, INLar__o, DNLar__o, H__o, indexl__o, indexh__o) \
      ;
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return(INLar__o);
    end_scope
  }
  
  Mm inldnl(Mm samples, Mm numbit, Mm numpt, Mm T1, Mm T2, Mm T_ideal_1, Mm T_ideal_2, i_o_t, Mm& INLar__o, Mm& DNLar__o) \
     {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=2.0; nargout_set=1;
    dMm(H__o); dMm(indexl__o); dMm(indexh__o); 
    inldnl(samples, numbit, numpt, T1, T2, T_ideal_1, T_ideal_2, i_o, INLar__o, DNLar__o, H__o, indexl__o, indexh__o) \
      ;
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm inldnl(Mm samples, Mm numbit, Mm numpt, Mm T1, Mm T2, Mm T_ideal_1, Mm T_ideal_2, i_o_t, Mm& INLar__o, Mm& DNLar__o, \
     Mm& H__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=3.0; nargout_set=1;
    dMm(indexl__o); dMm(indexh__o); 
    inldnl(samples, numbit, numpt, T1, T2, T_ideal_1, T_ideal_2, i_o, INLar__o, DNLar__o, H__o, indexl__o, indexh__o) \
      ;
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
  Mm inldnl(Mm samples, Mm numbit, Mm numpt, Mm T1, Mm T2, Mm T_ideal_1, Mm T_ideal_2, i_o_t, Mm& INLar__o, Mm& DNLar__o, \
     Mm& H__o, Mm& indexl__o) {
    begin_scope
    double old_nargin=nargin_val; nargin_val=7.0; nargin_set=1;
    double old_nargout=nargout_val; nargout_val=4.0; nargout_set=1;
    dMm(indexh__o); 
    inldnl(samples, numbit, numpt, T1, T2, T_ideal_1, T_ideal_2, i_o, INLar__o, DNLar__o, H__o, indexl__o, indexh__o) \
      ;
    nargout_val=old_nargout;
    nargin_val=old_nargin;
    return x_M;
    end_scope
  }
  
