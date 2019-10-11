function [residual, g1, g2, g3] = NK_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 14, 1);

%
% Model equations
%

T12 = y(1)^(-params(2));
T32 = y(1)^params(2);
T55 = (1+y(4))^params(6);
T62 = params(1)*params(7)*(1+y(4))^(params(6)-1);
T74 = (1+y(8))^(-params(6));
lhs =y(3)*T12;
rhs =params(4)*y(2)^params(3);
residual(1)= lhs-rhs;
lhs =1;
rhs =params(1)*(1+y(5))/(1+y(4));
residual(2)= lhs-rhs;
lhs =y(6);
rhs =(1+y(5))*params(5)/y(5)*T32;
residual(3)= lhs-rhs;
lhs =y(7);
rhs =y(3)/y(13);
residual(4)= lhs-rhs;
lhs =1+y(8);
rhs =(1+y(4))*params(6)/(params(6)-1)*y(9)/y(10);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =T12*y(7)*y(11)+y(9)*params(1)*params(7)*T55;
residual(6)= lhs-rhs;
lhs =y(10);
rhs =T12*y(11)+y(10)*T62;
residual(7)= lhs-rhs;
lhs =y(1);
rhs =y(11);
residual(8)= lhs-rhs;
lhs =y(11);
rhs =y(2)*y(13)/y(12);
residual(9)= lhs-rhs;
lhs =y(12);
rhs =T55*(1-params(7))*T74+y(12)*params(7)*T55;
residual(10)= lhs-rhs;
lhs =(1+y(4))^(1-params(6));
rhs =params(7)+(1-params(7))*(1+y(8))^(1-params(6));
residual(11)= lhs-rhs;
lhs =log(y(13));
rhs =log(y(13))*params(9)+params(10)*x(1);
residual(12)= lhs-rhs;
lhs =y(14);
rhs =(1-params(11))*params(8)+y(14)*params(11)-y(4)+y(4)*params(11)+params(12)*x(2);
residual(13)= lhs-rhs;
residual(14) = y(14);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(14, 14);

  %
  % Jacobian matrix
  %

T111 = getPowerDeriv(y(1),(-params(2)),1);
T135 = getPowerDeriv(1+y(4),params(6),1);
  g1(1,1)=y(3)*T111;
  g1(1,2)=(-(params(4)*getPowerDeriv(y(2),params(3),1)));
  g1(1,3)=T12;
  g1(2,4)=(-((-(params(1)*(1+y(5))))/((1+y(4))*(1+y(4)))));
  g1(2,5)=(-(params(1)/(1+y(4))));
  g1(3,1)=(-((1+y(5))*params(5)/y(5)*getPowerDeriv(y(1),params(2),1)));
  g1(3,5)=(-(T32*(y(5)*params(5)-(1+y(5))*params(5))/(y(5)*y(5))));
  g1(3,6)=1;
  g1(4,3)=(-(1/y(13)));
  g1(4,7)=1;
  g1(4,13)=(-((-y(3))/(y(13)*y(13))));
  g1(5,4)=(-(params(6)/(params(6)-1)*y(9)/y(10)));
  g1(5,8)=1;
  g1(5,9)=(-((1+y(4))*params(6)/(params(6)-1)/y(10)));
  g1(5,10)=(-((-((1+y(4))*params(6)/(params(6)-1)*y(9)))/(y(10)*y(10))));
  g1(6,1)=(-(y(11)*y(7)*T111));
  g1(6,4)=(-(y(9)*params(1)*params(7)*T135));
  g1(6,7)=(-(T12*y(11)));
  g1(6,9)=1-params(1)*params(7)*T55;
  g1(6,11)=(-(T12*y(7)));
  g1(7,1)=(-(y(11)*T111));
  g1(7,4)=(-(y(10)*params(1)*params(7)*getPowerDeriv(1+y(4),params(6)-1,1)));
  g1(7,10)=1-T62;
  g1(7,11)=(-T12);
  g1(8,1)=1;
  g1(8,11)=(-1);
  g1(9,2)=(-(y(13)/y(12)));
  g1(9,11)=1;
  g1(9,12)=(-((-(y(2)*y(13)))/(y(12)*y(12))));
  g1(9,13)=(-(y(2)/y(12)));
  g1(10,4)=(-(T74*(1-params(7))*T135+y(12)*params(7)*T135));
  g1(10,8)=(-(T55*(1-params(7))*getPowerDeriv(1+y(8),(-params(6)),1)));
  g1(10,12)=1-params(7)*T55;
  g1(11,4)=getPowerDeriv(1+y(4),1-params(6),1);
  g1(11,8)=(-((1-params(7))*getPowerDeriv(1+y(8),1-params(6),1)));
  g1(12,13)=1/y(13)-params(9)*1/y(13);
  g1(13,4)=(-((-1)+params(11)));
  g1(13,14)=1-params(11);
  g1(14,14)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,196);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,2744);
end
end
end
end
