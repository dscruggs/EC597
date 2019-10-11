function [residual, g1, g2, g3] = RBC_IAC_dynamic(y, x, params, steady_state, it_)
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
T14 = y(5)^params(4);
T20 = params(1)*y(6)/y(14);
T47 = y(1)^params(2);
T48 = y(12)*T47;
T49 = y(5)^(1-params(2));
T65 = 1-params(10)/2*(y(8)/y(2)-1)^2;
T71 = T65-y(8)*params(10)*(y(8)/y(2)-1)/y(2);
T74 = params(10)*T20*y(17);
T77 = y(15)/y(8)-1;
T78 = T74*T77;
T79 = (y(15)/y(8))^2;
lhs =y(10);
rhs =params(5)*y(6)*T14;
residual(1)= lhs-rhs;
lhs =T20*y(11);
rhs =1;
residual(2)= lhs-rhs;
lhs =y(13);
rhs =y(6)*params(1)/y(14)*(y(16)+y(17)*(1-params(3)));
residual(3)= lhs-rhs;
lhs =y(9);
rhs =params(2)*y(4)/y(1);
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(4)*(1-params(2))/y(5);
residual(5)= lhs-rhs;
lhs =y(4);
rhs =T48*T49;
residual(6)= lhs-rhs;
lhs =y(6)+y(8);
rhs =y(4);
residual(7)= lhs-rhs;
lhs =y(7)-(1-params(3))*y(1);
rhs =y(8)*T65;
residual(8)= lhs-rhs;
lhs =1;
rhs =y(13)*T71+T78*T79;
residual(9)= lhs-rhs;
lhs =y(12)-params(9);
rhs =params(6)*(y(3)-params(9))+params(9)*params(7)*x(it_, 1);
residual(10)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(10, 18);

  %
  % Jacobian matrix
  %

T151 = (-(params(10)/2*(-y(8))/(y(2)*y(2))*2*(y(8)/y(2)-1)));
T165 = (-(params(10)/2*2*(y(8)/y(2)-1)*1/y(2)));
  g1(1,5)=(-(params(5)*y(6)*getPowerDeriv(y(5),params(4),1)));
  g1(1,6)=(-(params(5)*T14));
  g1(1,10)=1;
  g1(2,6)=y(11)*params(1)*1/y(14);
  g1(2,14)=y(11)*params(1)*(-y(6))/(y(14)*y(14));
  g1(2,11)=T20;
  g1(3,6)=(-((y(16)+y(17)*(1-params(3)))*params(1)/y(14)));
  g1(3,14)=(-((y(16)+y(17)*(1-params(3)))*(-(y(6)*params(1)))/(y(14)*y(14))));
  g1(3,16)=(-(y(6)*params(1)/y(14)));
  g1(3,13)=1;
  g1(3,17)=(-(y(6)*params(1)/y(14)*(1-params(3))));
  g1(4,4)=(-(params(2)/y(1)));
  g1(4,1)=(-((-(params(2)*y(4)))/(y(1)*y(1))));
  g1(4,9)=1;
  g1(5,4)=(-((1-params(2))/y(5)));
  g1(5,5)=(-((-(y(4)*(1-params(2))))/(y(5)*y(5))));
  g1(5,10)=1;
  g1(6,4)=1;
  g1(6,5)=(-(T48*getPowerDeriv(y(5),1-params(2),1)));
  g1(6,1)=(-(T49*y(12)*getPowerDeriv(y(1),params(2),1)));
  g1(6,12)=(-(T47*T49));
  g1(7,4)=(-1);
  g1(7,6)=1;
  g1(7,8)=1;
  g1(8,1)=(-(1-params(3)));
  g1(8,7)=1;
  g1(8,2)=(-(y(8)*T151));
  g1(8,8)=(-(T65+y(8)*T165));
  g1(9,6)=(-(T79*T77*params(10)*y(17)*params(1)*1/y(14)));
  g1(9,14)=(-(T79*T77*params(10)*y(17)*params(1)*(-y(6))/(y(14)*y(14))));
  g1(9,2)=(-(y(13)*(T151-(y(2)*y(8)*params(10)*(-y(8))/(y(2)*y(2))-y(8)*params(10)*(y(8)/y(2)-1))/(y(2)*y(2)))));
  g1(9,8)=(-(y(13)*(T165-(params(10)*(y(8)/y(2)-1)+y(8)*params(10)*1/y(2))/y(2))+T79*T74*(-y(15))/(y(8)*y(8))+T78*(-y(15))/(y(8)*y(8))*2*y(15)/y(8)));
  g1(9,15)=(-(T79*T74*1/y(8)+T78*2*y(15)/y(8)*1/y(8)));
  g1(9,13)=(-T71);
  g1(9,17)=(-(T79*T77*T20*params(10)));
  g1(10,3)=(-params(6));
  g1(10,12)=1;
  g1(10,18)=(-(params(9)*params(7)));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,324);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,5832);
end
end
end
end
