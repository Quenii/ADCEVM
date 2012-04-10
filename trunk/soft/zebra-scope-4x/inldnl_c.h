#include <vector>
using namespace std;

int inldnl_c(int* samples, int numbit, int numpt, double T1, double T2, 
			 double T_ideal_1, double T_ideal_2, vector<double>& INLar, 
			 vector<double>& DNLar, vector<int>& H, int& indexl, int& indexh);

int noise_c(int *samples, int numpt, int numbit, 
			vector<int>& H, int& index_max, int& indexl, int& indexh);
