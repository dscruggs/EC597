function [residual, g1, g2, g3] = NK_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(14, 1);
T12 = y(6)^(-params(2));
T24 = params(1)*(y(20)/y(6))^(-params(2));
T27 = T24*(1+y(10));
T36 = y(6)^params(2);
T62 = params(1)*params(7)*(1+y(21))^params(6);
T69 = params(1)*params(7)*(1+y(21))^(params(6)-1);
T80 = (1+y(9))^params(6);
T83 = (1+y(13))^(-params(6));
lhs =y(8)*T12;
rhs =params(4)*y(7)^params(3);
residual(1)= lhs-rhs;
lhs =1;
rhs =T27/(1+y(21));
residual(2)= lhs-rhs;
lhs =y(11);
rhs =(1+y(10))*params(5)/y(10)*T36;
residual(3)= lhs-rhs;
lhs =y(12);
rhs =y(8)/y(18);
residual(4)= lhs-rhs;
lhs =1+y(13);
rhs =params(6)/(params(6)-1)*(1+y(9))*y(14)/y(15);
residual(5)= lhs-rhs;
lhs =y(14);
rhs =T12*y(12)*y(16)+T62*y(22);
residual(6)= lhs-rhs;
lhs =y(15);
rhs =T12*y(16)+T69*y(23);
residual(7)= lhs-rhs;
lhs =y(6);
rhs =y(16);
residual(8)= lhs-rhs;
lhs =y(16);
rhs =y(7)*y(18)/y(17);
residual(9)= lhs-rhs;
lhs =y(17);
rhs =(1-params(7))*T80*T83+params(7)*T80*y(3);
residual(10)= lhs-rhs;
lhs =(1+y(9))^(1-params(6));
rhs =params(7)+(1-params(7))*(1+y(13))^(1-params(6));
residual(11)= lhs-rhs;
lhs =log(y(18));
rhs =params(9)*log(y(4))+params(10)*x(it_, 1);
residual(12)= lhs-rhs;
lhs =y(19);
rhs =(1-params(11))*params(8)+params(11)*y(5)-y(9)+params(11)*y(1)+params(12)*x(it_, 2);
residual(13)= lhs-rhs;
lhs =y(19);
rhs =log(y(11))-log(y(2));
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 25);

  %
  % Jacobian matrix
  %

T128 = getPowerDeriv(y(6),(-params(2)),1);
T133 = getPowerDeriv(y(20)/y(6),(-params(2)),1);
T164 = getPowerDeriv(1+y(9),params(6),1);
  g1(1,6)=y(8)*T128;
  g1(1,7)=(-(params(4)*getPowerDeriv(y(7),params(3),1)));
  g1(1,8)=T12;
  g1(2,6)=(-((1+y(10))*params(1)*(-y(20))/(y(6)*y(6))*T133/(1+y(21))));
  g1(2,20)=(-((1+y(10))*params(1)*T133*1/y(6)/(1+y(21))));
  g1(2,21)=(-((-T27)/((1+y(21))*(1+y(21)))));
  g1(2,10)=(-(T24/(1+y(21))));
  g1(3,6)=(-((1+y(10))*params(5)/y(10)*getPowerDeriv(y(6),params(2),1)));
  g1(3,10)=(-(T36*(y(10)*params(5)-(1+y(10))*params(5))/(y(10)*y(10))));
  g1(3,11)=1;
  g1(4,8)=(-(1/y(18)));
  g1(4,12)=1;
  g1(4,18)=(-((-y(8))/(y(18)*y(18))));
  g1(5,9)=(-(params(6)/(params(6)-1)*y(14)/y(15)));
  g1(5,13)=1;
  g1(5,14)=(-(params(6)/(params(6)-1)*(1+y(9))/y(15)));
  g1(5,15)=(-((-(params(6)/(params(6)-1)*(1+y(9))*y(14)))/(y(15)*y(15))));
  g1(6,6)=(-(y(16)*y(12)*T128));
  g1(6,21)=(-(y(22)*params(1)*params(7)*getPowerDeriv(1+y(21),params(6),1)));
  g1(6,12)=(-(T12*y(16)));
  g1(6,14)=1;
  g1(6,22)=(-T62);
  g1(6,16)=(-(T12*y(12)));
  g1(7,6)=(-(y(16)*T128));
  g1(7,21)=(-(y(23)*params(1)*params(7)*getPowerDeriv(1+y(21),params(6)-1,1)));
  g1(7,15)=1;
  g1(7,23)=(-T69);
  g1(7,16)=(-T12);
  g1(8,6)=1;
  g1(8,16)=(-1);
  g1(9,7)=(-(y(18)/y(17)));
  g1(9,16)=1;
  g1(9,17)=(-((-(y(7)*y(18)))/(y(17)*y(17))));
  g1(9,18)=(-(y(7)/y(17)));
  g1(10,9)=(-(T83*(1-params(7))*T164+y(3)*params(7)*T164));
  g1(10,13)=(-((1-params(7))*T80*getPowerDeriv(1+y(13),(-params(6)),1)));
  g1(10,3)=(-(params(7)*T80));
  g1(10,17)=1;
  g1(11,9)=getPowerDeriv(1+y(9),1-params(6),1);
  g1(11,13)=(-((1-params(7))*getPowerDeriv(1+y(13),1-params(6),1)));
  g1(12,4)=(-(params(9)*1/y(4)));
  g1(12,18)=1/y(18);
  g1(12,24)=(-params(10));
  g1(13,1)=(-params(11));
  g1(13,9)=1;
  g1(13,5)=(-params(11));
  g1(13,19)=1;
  g1(13,25)=(-params(12));
  g1(14,2)=1/y(2);
  g1(14,11)=(-(1/y(11)));
  g1(14,19)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,625);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,15625);
end
end
end
end
