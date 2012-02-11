#include <vector>
#include <cmath>
#include <algorithm>

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

	int a =  1 << (16-numbit);
	int b = 1 << (numbit-1);
	int* v2 = v1;
	for (int i = 0; i < numpt; ++i)
		v2[i] = v1[i] / a + b; 

	int* code = v1;
	//for (int i = 0; i < numpt; ++i)
	//  code[i] = round(v2[i] - 0.4999999f);

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
	for (int i = 0; i < H.size(); ++i)
	{
		H[i] = 0;
	}

	int *pH = &H[0];
	for (int i = 0; i < numpt; ++i)
		H[code[i]] = H[code[i]] + 1; 

	//  int indexh = 0;
	for (int jh = (1 << (numbit-1)) - 1; jh <= NCODES - 1; ++jh)
		if (H[jh] == 0) {
			indexh = jh-1; 
			break;
		}
		else 
			indexh = jh; 

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

	for (int k = 0; k < NCODES- 1; ++k) {
		Tnom[k] = (k+1 - 0.5) * (T_ideal_2 - T_ideal_1) / (NCODES);
		for (int i = 0; i <= k; ++i)
			Hc[k] = Hc[k] + H[i];
	}

	double S = numpt;
	double pi = 3.1415926535898f;
	double Q = (Tnom[NCODES-2]-Tnom[0])/(NCODES-3);
	double Al = cos(pi*double(Hc[0])/S); double Ar = cos(pi*(1-(double(Hc[NCODES-2])/S)));
	double A = (T2-T1) / ( Al + Ar );
	double Cul = T2*cos(pi*double(Hc[0])/S); double Cur = T1*cos(pi*(1-(double(Hc[NCODES-2])/S)));
	double Cll = cos(pi*double(Hc[0])/S); double Clr = cos(pi*(1-(double(Hc[NCODES-2])/S)));
	double C = ( Cul + Cur ) / ( Cll + Clr );

	for (int k = 0; k < NCODES-1; ++k) {
		T[k] = C-A*cos(pi*double(Hc[k])/S);
	}

	double sTk = 0;
	double sT = 0;
	double sT2 = 0;

	for (int k = 0; k < NCODES-1; ++k) {
		sTk = sTk + (k+1)*T[k];
		sT = sT + T[k];
		sT2 = sT2 + T[k] * T[k];            
	}

	double G = Q * (NCODES-1) * (sTk - (1 << (numbit-1)) * sT) / ((NCODES-1)*sT2-sT*sT);
	double Vosb = Q*(double(1 << (numbit-1))-1); double Vosc = G*sT/double(NCODES-1);
	double Vos = Tnom[0] + Vosb - Vosc;

	for (int i = 0; i < INLar.size(); ++i)
	{
		INLar[i] = 0;
	}

	for (int k = indexl; k < (indexh-1); ++k) {
		double  e_k = Tnom[k] - G * T[k] - Vos;
		INLar[k] = e_k / Q;
	}

	for (int i = 0; i < DNLar.size(); ++i)
	{
		DNLar[i] = 0;
	}

	for (int k = indexl; k < indexh-2; ++k) {
		DNLar[k] = G*(T[k+1]-T[k])/Q-1;
	}

	return 1;
}

int noise_c(int *samples, int numpt, int numbit, vector<int>& H, int& index_max, int& indexl, int& indexh)
{
	// v1=v1';
	// v2=v1/2^(16-numbit)+2^(numbit-1);
	// code=round(v2(:,1)-0.4999999);
	int* v1 = samples;
	int a =  1 << (16-numbit);
	int b = 1 << (numbit-1);
	int* v2 = v1;
	for (int i = 0; i < numpt; ++i)
		v2[i] = v1[i] / a + b; 

	int* code = v2;
	//for (int i = 0; i < numpt; ++i)
	//  code[i] = round(v2[i] - 0.4999999f);

	// H=zeros(1,2^numbit);
	for (int i = 0; i < H.size(); ++i)
	{
		H[i] = 0;
	}

	// for i=1:size(code),
	//     H(code(i)+1)=H(code(i)+1)+1;
	// end
	for (int i = 0; i < numpt; ++i)
		H[code[i]] = H[code[i]] + 1; 

	// H_max=max(H);
	int H_max = *max_element(H.begin(), H.end());
	// for j=1:2^numbit-1,
	//     if H(j)==H_max,
	//         index_max=j;
	//     end
	// end
	for (int j=0; j<((1<<numbit)-1); ++j)
	{
		if (H[j] == H_max)
			index_max = j;
	}
	//index_max = max_element(H.begin(), H.begin() + ((1<<numbit)-1));

	// for j=1:index_max,
	//     if H(j)~=0,
	//         indexl=j;
	//        break;
	//     end
	// end
	for (int j=0; j<index_max; ++j)
	{
		if (H[j] != 0)
		{
			indexl = j;
			break;
		}
	}

	// for j=index_max:1:2^numbit-1,
	//     if H(j)~=0,
	//         indexh=j;
	//     end
	// end
	for (int j=index_max; j<((1<<numbit)-1); ++j )
	{
		if (H[j] != 0)
		{
			indexh = j;
		}
	}

	// figure;
	// %hist(code);
	// bar([indexl-1:indexh+1],H(indexl-1:indexh+1));
	// axis([index_max-4.5 index_max+4.5 0 H_max]);

	// %LSB=(T2-T1)/2^numbit;
	// mean_mid=mean(round(v1/2^(16-numbit)-0.4999999))
	// mean_stdLSB=std(code)

	return 1;
}
