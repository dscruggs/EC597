function [residual, g1, g2, g3] = K_R_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(10, 1);
T12 = y(5)^(-params(2));
T23 = (y(15)/y(5))^(-params(2));
T36 = y(5)^params(2);
T58 = y(12)/y(17);
T64 = params(13)/2*y(8)^2;
lhs =y(7)*T12;
rhs =params(4)*y(6)^params(3);
residual(1)= lhs-rhs;
lhs =1;
rhs =params(1)*T23*(1+y(9))/(1+y(16));
residual(2)= lhs-rhs;
lhs =y(10);
rhs =(1+y(9))*params(5)/y(9)*T36;
residual(3)= lhs-rhs;
lhs =y(11);
rhs =y(7)/y(13);
residual(4)= lhs-rhs;
lhs =params(6)-1;
rhs =y(11)*params(6)-params(13)*y(8)*(1+y(8))+T23*(1+y(16))*y(16)*params(1)*params(13)*T58;
residual(5)= lhs-rhs;
lhs =y(12);
rhs =y(5)+y(12)*T64;
residual(6)= lhs-rhs;
lhs =y(12);
rhs =y(6)*y(13);
residual(7)= lhs-rhs;
lhs =log(y(13));
rhs =params(9)*log(y(3))+params(10)*x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(14);
rhs =(1-params(11))*params(8)+params(11)*y(4)-y(8)+params(11)*y(1)+params(12)*x(it_, 2);
residual(9)= lhs-rhs;
lhs =y(14);
rhs =log(y(10))-log(y(2));
residual(10)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(10, 19);

  %
  % Jacobian matrix
  %

T107 = getPowerDeriv(y(15)/y(5),(-params(2)),1);
  g1(1,5)=y(7)*getPowerDeriv(y(5),(-params(2)),1);
  g1(1,6)=(-(params(4)*getPowerDeriv(y(6),params(3),1)));
  g1(1,7)=T12;
  g1(2,5)=(-((1+y(9))*params(1)*(-y(15))/(y(5)*y(5))*T107/(1+y(16))));
  g1(2,15)=(-((1+y(9))*params(1)*T107*1/y(5)/(1+y(16))));
  g1(2,16)=(-((-(params(1)*T23*(1+y(9))))/((1+y(16))*(1+y(16)))));
  g1(2,9)=(-(params(1)*T23/(1+y(16))));
  g1(3,5)=(-((1+y(9))*params(5)/y(9)*getPowerDeriv(y(5),params(2),1)));
  g1(3,9)=(-(T36*(y(9)*params(5)-(1+y(9))*params(5))/(y(9)*y(9))));
  g1(3,10)=1;
  g1(4,7)=(-(1/y(13)));
  g1(4,11)=1;
  g1(4,13)=(-((-y(7))/(y(13)*y(13))));
  g1(5,5)=(-(T58*(1+y(16))*y(16)*params(1)*params(13)*(-y(15))/(y(5)*y(5))*T107));
  g1(5,15)=(-(T58*(1+y(16))*y(16)*params(1)*params(13)*T107*1/y(5)));
  g1(5,8)=params(13)*y(8)+params(13)*(1+y(8));
  g1(5,16)=(-(T58*T23*(y(16)*params(1)*params(13)+(1+y(16))*params(1)*params(13))));
  g1(5,11)=(-params(6));
  g1(5,12)=(-(T23*(1+y(16))*y(16)*params(1)*params(13)*1/y(17)));
  g1(5,17)=(-(T23*(1+y(16))*y(16)*params(1)*params(13)*(-y(12))/(y(17)*y(17))));
  g1(6,5)=(-1);
  g1(6,8)=(-(y(12)*params(13)/2*2*y(8)));
  g1(6,12)=1-T64;
  g1(7,6)=(-y(13));
  g1(7,12)=1;
  g1(7,13)=(-y(6));
  g1(8,3)=(-(params(9)*1/y(3)));
  g1(8,13)=1/y(13);
  g1(8,18)=(-params(10));
  g1(9,1)=(-params(11));
  g1(9,8)=1;
  g1(9,4)=(-params(11));
  g1(9,14)=1;
  g1(9,19)=(-params(12));
  g1(10,2)=1/y(2);
  g1(10,10)=(-(1/y(10)));
  g1(10,14)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,361);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,6859);
end
end
end
end
