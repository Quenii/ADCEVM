#include <vector>
#include <cmath>

using namespace std;

double sign(double x) 
{ 
  if (x < 0.0)
    return -1.0;
  return 1.0;
}

double round(double x) { 
  return (long long)(x + 0.5 * sign(x));
}

// return
//    0 - Succefully
//   -1 - Error
// 
// 
int inldnl_c(int* samples, int numbit, int numpt, double T1, double T2, 
	   double T_ideal_1, double T_ideal_2, vector<double>& INLar, 
	   vector<double>& DNLar, vector<int>& H, int& indexl, int& indexh)
{
  int NCODES = 1 << numbit;
  int* v1 = samples;

  /* v2 = v1 / 2^(16-numbit)+2^(numbit-1); */
  int a =  1 << (16-numbit);
  int b = 1 << (numbit-1);
  int* v2 = v1;
  for (int i = 0; i < numpt; ++i)
    v2[i] = v1[i] / a + b; 
  
  /* code = round(v2(:,1)-0.4999999); */
  int* code = v1;
  //for (int i = 0; i < numpt; ++i)
  //  code[i] = round(v2[i] - 0.4999999f);
 
/* H = zeros(1,NCODES); */
/* Hc = zeros(1,NCODES-1); */
/* T = zeros(1,NCODES-1); */
/* Tnom = zeros(1,NCODES-1); */
/* S = numpt; */

  vector<int> Hc(NCODES-1);
  vector<double> Tnom(NCODES-1);
  vector<double> T(NCODES-1);

  int * pHc = &Hc[0];
  double * pTnom = &Tnom[0];
  double * pT = &T[0];

  for (int i = 0; i < Hc.size(); ++i)
  {
	  Hc[i] = 0;
	  Tnom[i] = 0;
	  T[i] = 0;
  }

/* for i = 1:size(code), */
/*     H(code(i)+1) = H(code(i)+1)+1; */
/* end */
//  H.swap(vector<int>(NCODES));
  for (int i = 0; i < H.size(); ++i)
  {
	  H[i] = 0;
  }
  int *pH = &H[0];
  for (int i = 0; i < numpt; ++i)
    H[(int)code[i]] = H[(int)code[i]] + 1; 


/* %====================================== */
/* %search for the positions of '111¡­11' and '000¡­00' */
/* %====================================== */
/* for jh = 2^(numbit-1):NCODES; */
/*     if H(jh) == 0; */
/*         indexh = jh-1; */
/*         break; */
/*     else  */
/*         indexh = jh; */
/*     end */
/* end */

//  int indexh = 0;
  for (int jh = (1 << (numbit-1)) - 1; jh <= NCODES - 1; ++jh)
    if (H[jh] == 0) {
		indexh = jh-1; 
		break;
      }
    else 
      indexh = jh; 
    


/* for jl = 2^(numbit-1):-1:1; */
/*     if H(jl)==0; */
/*         indexl = jl+1; */
/*         break; */
/*     else  */
/*         indexl = jl; */
/*     end */
/* end */

//  int indexl = 0;
  for (int jl = (1 << (numbit-1)) - 1; jl >= 0; --jl)
    if (H[jl]==0) {
      indexl = jl+1;
      break; 
    }
    else 
      indexl = jl;
  


  if ((indexh < NCODES - 1) && (indexl > 0))
    // warning = 'can not reach "111..11" and "000..00"';
    return -1;
  else if (indexl > 0)
    // warning = 'can not reach "000..00"';
    return -1;
  else if (indexh < NCODES - 1)
    // warning = 'can not reach "111..11"';
    return -1;


/* for k = 1:(NCODES-1), */
/*     Tnom(k) = (k-0.5)*(T_ideal_2-T_ideal_1)/(NCODES); */
/*     for i = 1:k, */
/*         Hc(k) = Hc(k)+H(i); */
/*     end */
/* end */
  
  for (int k = 0; k < NCODES- 1; ++k) {
    Tnom[k] = (k+1 - 0.5) * (T_ideal_2 - T_ideal_1) / (NCODES);
    for (int i = 0; i <= k; ++i)
      Hc[k] = Hc[k] + H[i];
  }


/* Q = (Tnom(NCODES-1)-Tnom(1))/(NCODES-2); */
/* A = (T2-T1)/(cos(pi*Hc(1)/S)+cos(pi*(1-(Hc(NCODES-1)/S)))); */
/* C = (T2*cos(pi*Hc(1)/S)+T1*cos(pi*(1-(Hc(NCODES-1)/S))))/(cos(pi*Hc(1)/S)+cos(pi*(1-(Hc(NCODES-1)/S)))); */
double S = numpt;
double pi = 3.1415926535898f;
double Q = (Tnom[NCODES-2]-Tnom[0])/(NCODES-2);
double A = (T2-T1) / ( cos(pi*double(Hc[0])/S) + cos(pi*(1-(double(Hc[NCODES-2])/S))) );
double C = (T2*cos(pi*double(Hc[0])/S)+T1*cos(pi*(1-(double(Hc[NCODES-2])/S))))/(cos(pi*double(Hc[0])/S)+cos(pi*(1-(double(Hc[NCODES-2])/S))));


/* for k = 1:(NCODES-1), */
/*     T[k] = C-A*cos(pi*Hc(k)/S); */
/* end */
  for (int k = 0; k < NCODES-1; ++k) {
    T[k] = C-A*cos(pi*double(Hc[k])/S);
  }

/* %============== */
/* %best fit */
/* %==============    */
/* %in this file2.txt example, the best fit is better than end point */
/* sTk = 0; */
/* sT = 0; */
/* sT2 = 0; */

/* for k = 1:(NCODES-1), */
/*     sTk = sTk+k*T[k]; */
/*     sT = sT+T[k]; */
/*     sT2 = sT2+T[k]*T[k]; */
/* end */

double sTk = 0;
double sT = 0;
double sT2 = 0;

 for (int k = 0; k < NCODES-1; ++k) {
    sTk = sTk + k*T[k];
    sT = sT + T[k];
    sT2 = sT2 + T[k] * T[k];
 }


/* G = Q*(NCODES-1)*(sTk-2^(numbit-1)*sT)/((NCODES-1)*sT2-sT*sT); */
/* Vos = Tnom(1)+Q*(2^(numbit-1)-1)-G*sT/(NCODES-1); */

double G = Q*(NCODES-1)*(sTk-double(1 << (numbit-1))*sT)/(double(NCODES-1)*sT2-sT*sT);
double Vos = Tnom[0]+Q*(double(1 << (numbit-1))-1)-G*sT/double(NCODES-1);

/* %============== */
/* %calculate INL */
/* %============== */
/* for k = (indexl):(indexh-1), */
/*     e(k) = Tnom(k)-G*T[k]-Vos; */
/*     INLar(k) = e(k)/Q; */
/* end */
 //INLar.swap(vector<double>(indexh - indexl));
for (int i = 0; i < INLar.size(); ++i)
{
	INLar[i] = 0;
}

 for (int k = indexl; k < (indexh-1); ++k) {
   double  e_k = Tnom[k] - G * T[k]-Vos;
    INLar[k] = e_k / Q;
 }

/* %============== */
/* %calculate DNL */
/* %============== */
/* for k = (indexl):(indexh-2), */
/*     DNLar(k) = G*(T(k+1)-T[k])/Q-1; */
/* end */
//DNLar.swap(vector<double>(indexh - indexl - 1));
 for (int i = 0; i < DNLar.size(); ++i)
 {
	 DNLar[i] = 0;
 }

 for (int k = indexl; k < indexh-2; ++k) {
    DNLar[k] = G*(T[k+1]-T[k])/Q-1;
 }
}

/* %============== */
/* %plot figures */
/* %============== */
/* H = H(1: NCODES); */
/* figure; */
/* plot([1:NCODES],H); */
/* axis([0 NCODES 0 max(H)]); */

/* DNLar = DNLar((indexl) : (indexh-2)); */
/* figure; */
/* plot([(indexl):(indexh-2)],DNLar); */
/* axis([0 NCODES -max(abs(DNLar)) max(abs(DNLar))]); */
/* grid on; */
/* title('DIFFERENTIAL NONLINEARITY vs. DIGITAL OUTPUT CODE'); */
/* xlabel('DIGITAL OUTPUT CODE'); */
/* ylabel('DNL (LSB)'); */

/* INLar = INLar((indexl) : (indexh-1)); */
/* figure; */
/* plot([(indexl):(indexh-1)],INLar); */
/* axis([0 NCODES -max(abs(INLar)) max(abs(INLar))]); */
/* grid on; */
/* title('INTEGRAL NONLINEARITY vs. DIGITAL OUTPUT CODE'); */
/* xlabel('DIGITAL OUTPUT CODE'); */
/* ylabel('INL(LSB)'); */
