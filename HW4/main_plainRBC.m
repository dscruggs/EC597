%Scruggs 3/21/19:;

clear; close all; clc
%running the dynare files
dynare plainRBC
dynare plainRBC_LL %the policy functions are identical, so the loglinearization is correct.
dynare plainRBC_LL_simp %the policy functions are identical, so the simplification is correct.

%{
Here are the policy functions from Dynare output:
1) plainRBC:
POLICY AND TRANSITION FUNCTIONS
                                   c               n               k               y             inv               r               w              Rf               A
Constant                   -0.168157       -1.100039        2.473892        0.079358       -1.438131       -3.503197        0.778920        0.010050               0
k(-1)                       0.542472       -0.256320        0.955804        0.158266       -1.209800       -0.841734        0.414586       -0.023975               0
A(-1)                       0.252852        0.780701        0.111799        1.423070        5.589933        1.423070        0.642369        0.035362        0.900000
epsA                        0.002809        0.008674        0.001242        0.015812        0.062110        0.015812        0.007137        0.000393        0.010000

2) plainRBC_LL:
POLICY AND TRANSITION FUNCTIONS
                                   c               n               k               y             inv               r               w              Rf               A
k(-1)                       0.542472       -0.256320        0.955804        0.158266       -1.209800       -0.841734        0.414586       -0.023975               0
A(-1)                       0.252852        0.780701        0.111799        1.423070        5.589933        1.423070        0.642369        0.035362        0.900000
epsA                        0.002809        0.008674        0.001242        0.015812        0.062110        0.015812        0.007137        0.000393        0.010000

3) plainRBC_LL_simp:
POLICY AND TRANSITION FUNCTIONS
                                   c               k               A
k(-1)                       0.542472        0.955804               0
A(-1)                       0.252852        0.111799        0.900000
epsA                        0.002809        0.001242        0.010000
%}

%consider the following system: A X_{t+1} = B X_{t}
%first row
a11 = 1 + bbeta*r0*(1-aalpha)/(2*aalpha);
a12 = -bbeta*r0*(aalpha-1)/(2);
a13 = 0;
b11 = 1;
b12 = 0;
b13 = bbeta*r0*rrhoA*(aalpha+1)/(2*aalpha);
%second row
a21 = 0;
a22 = inv0/(ddelta*y0);
a23 = 0;
b21 = -( (1-aalpha)/(2*aalpha) + c0/y0 );
b22 = (aalpha+1)/(2) + inv0/(ddelta*y0)*(1-ddelta);
b23 = (1+aalpha)/(2*aalpha);
%third row
a31 = 0;
a32 = 0;
a33 = 1;
b31 = 0;
b32 = 0;
b33 = rrhoA;
%A and B matrices:
A = [a11 a12 a13; a21 a22 a23; a31 a32 a33];
B = [b11 b12 b13; b21 b22 b23; b31 b32 b33];
M = inv(A)*B
[V,D]=eig(M) %need to change the columns of V such that D is sorted:
D = diag([D(2,2),D(1,1),D(3,3)]);
V = [V(:,2),V(:,1),V(:,3)];
%Notice that V*D*inv(V) must still be equal to M. Check:
M - V*D*inv(V) %checked

%Now we can find c (consumption) using the formula in the slides:
G = inv(V); %this is the \Gamma^(-1) in the slides.
%solution to c in the form of [c1 c2] such that c_t = [c1 c2]*[k(-1) A]'
cSol_k_A = -G(1,1)^(-1)*G(1,2:3)
%solution to c in the form of [c1 c2 c3] such that c_t = [c1 c2 c3]*[k(-1) A(-1) epsA]'
cSol_k_Am1_epsA = [cSol_k_A(1), cSol_k_A(2)*rrhoA, cSol_k_A(2)*ssigA] %exactly matches Dynare's solution

%Now we can derive the solution to k (capital) using the formula in the slides.
%Solution to [k_t A_{t+1}]' as a linear function of [k_{t-1} A_{t}]':
x2Sol_k_A = -M(2:3,1)*G(1,1)^(-1)*G(1,2:3)+M(2:3,2:3)
%To make it similar to Dynare's solution, a linear function of [k_{t-1} A_{t-1} epsA]'
kSol_k_Am1_epsA = [x2Sol_k_A(1,1), x2Sol_k_A(1,2)*rrhoA, x2Sol_k_A(1,2)*ssigA] %exactly matches Dynare's solution

