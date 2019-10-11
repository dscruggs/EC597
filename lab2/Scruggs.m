%Scruggs: March 1st;
clear; close all; clc
dynare Scruggsdynare
%dynare mid1Q1_LL %gives the same result, so the LogLinearization is correct

%see if the policy functions are correct
bbeta = 0.98;
ggamma = 4;
rrho = 0.5;
eeta = 0.6;
D0 = 1;
G0 = 0.3;
ssigG = 1;
ssigD = 1;
%
ppsiD = (1-bbeta)*rrho + ggamma*D0/(D0-G0)*(1-rrho);
ppsiG = -ggamma*G0/(D0-G0)*(1-eeta);
%policy function
ppsiD/(1-bbeta*rrho)*rrho %coeff. of D(-1), matches with Dynare
ppsiG/(1-bbeta*eeta)*eeta %coeff. of G(-1), matches with Dynare
%IRF to eps_d and eps_g
h=0:9;
IRF_P_g=ppsiG/(1-bbeta*eeta)*eeta.^h'*ssigG;
%comparison of IRFs with Dynare
[IRF_P_g P_epsG] %identical
