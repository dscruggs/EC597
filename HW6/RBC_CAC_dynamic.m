function [residual, g1, g2, g3] = RBC_CAC_dynamic(y, x, params, steady_state, it_)
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
T14 = y(4)^params(4);
T26 = y(5)*params(1)/y(13);
T32 = params(10)/2;
T43 = 1-params(3)-T32*(y(14)/y(6)-params(3))^2+y(14)*params(10)*(y(14)/y(6)-params(3))/y(6);
T45 = y(15)+y(16)*T43;
T60 = y(1)^params(2);
T61 = y(11)*T60;
T62 = y(4)^(1-params(2));
T77 = 1-params(10)*(y(7)/y(1)-params(3));
lhs =y(9);
rhs =params(5)*y(5)*T14;
residual(1)= lhs-rhs;
lhs =params(1)*y(5)/y(13)*y(10);
rhs =1;
residual(2)= lhs-rhs;
lhs =y(12);
rhs =T26*T45;
residual(3)= lhs-rhs;
lhs =y(8);
rhs =params(2)*y(3)/y(1);
residual(4)= lhs-rhs;
lhs =y(9);
rhs =y(3)*(1-params(2))/y(4);
residual(5)= lhs-rhs;
lhs =y(3);
rhs =T61*T62;
residual(6)= lhs-rhs;
lhs =y(5)+y(7);
rhs =y(3);
residual(7)= lhs-rhs;
lhs =y(6);
rhs =y(7)+(1-params(3))*y(1)+T32*(y(7)/y(1)-params(3))^2;
residual(8)= lhs-rhs;
lhs =y(12);
rhs =1/T77;
residual(9)= lhs-rhs;
lhs =y(11)-params(9);
rhs =params(6)*(y(2)-params(9))+params(9)*params(7)*x(it_, 1);
residual(10)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(10, 17);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-(params(5)*y(5)*getPowerDeriv(y(4),params(4),1)));
  g1(1,5)=(-(params(5)*T14));
  g1(1,9)=1;
  g1(2,5)=y(10)*params(1)*1/y(13);
  g1(2,13)=y(10)*params(1)*(-y(5))/(y(13)*y(13));
  g1(2,10)=params(1)*y(5)/y(13);
  g1(3,5)=(-(T45*params(1)/y(13)));
  g1(3,13)=(-(T45*(-(y(5)*params(1)))/(y(13)*y(13))));
  g1(3,6)=(-(T26*y(16)*((-(T32*(-y(14))/(y(6)*y(6))*2*(y(14)/y(6)-params(3))))+(y(6)*y(14)*params(10)*(-y(14))/(y(6)*y(6))-y(14)*params(10)*(y(14)/y(6)-params(3)))/(y(6)*y(6)))));
  g1(3,14)=(-(T26*y(16)*((-(T32*2*(y(14)/y(6)-params(3))*1/y(6)))+(params(10)*(y(14)/y(6)-params(3))+y(14)*params(10)*1/y(6))/y(6))));
  g1(3,15)=(-T26);
  g1(3,12)=1;
  g1(3,16)=(-(T26*T43));
  g1(4,3)=(-(params(2)/y(1)));
  g1(4,1)=(-((-(params(2)*y(3)))/(y(1)*y(1))));
  g1(4,8)=1;
  g1(5,3)=(-((1-params(2))/y(4)));
  g1(5,4)=(-((-(y(3)*(1-params(2))))/(y(4)*y(4))));
  g1(5,9)=1;
  g1(6,3)=1;
  g1(6,4)=(-(T61*getPowerDeriv(y(4),1-params(2),1)));
  g1(6,1)=(-(T62*y(11)*getPowerDeriv(y(1),params(2),1)));
  g1(6,11)=(-(T60*T62));
  g1(7,3)=(-1);
  g1(7,5)=1;
  g1(7,7)=1;
  g1(8,1)=(-(1-params(3)+T32*(-y(7))/(y(1)*y(1))*2*(y(7)/y(1)-params(3))));
  g1(8,6)=1;
  g1(8,7)=(-(1+T32*2*(y(7)/y(1)-params(3))*1/y(1)));
  g1(9,1)=(-(params(10)*(-y(7))/(y(1)*y(1))/(T77*T77)));
  g1(9,7)=(-(params(10)*1/y(1)/(T77*T77)));
  g1(9,12)=1;
  g1(10,2)=(-params(6));
  g1(10,11)=1;
  g1(10,17)=(-(params(9)*params(7)));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,289);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,4913);
end
end
end
end
