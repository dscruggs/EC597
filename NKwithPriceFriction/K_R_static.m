function [residual, g1, g2, g3] = K_R_static(y, x, params)
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

residual = zeros( 10, 1);

%
% Model equations
%

T12 = y(1)^(-params(2));
T32 = y(1)^params(2);
T54 = params(13)/2*y(4)^2;
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
rhs =y(3)/y(9);
residual(4)= lhs-rhs;
lhs =params(6)-1;
rhs =y(7)*params(6)-(1+y(4))*y(4)*params(13)+(1+y(4))*y(4)*params(1)*params(13);
residual(5)= lhs-rhs;
lhs =y(8);
rhs =y(1)+y(8)*T54;
residual(6)= lhs-rhs;
lhs =y(8);
rhs =y(2)*y(9);
residual(7)= lhs-rhs;
lhs =log(y(9));
rhs =log(y(9))*params(9)+params(10)*x(1);
residual(8)= lhs-rhs;
lhs =y(10);
rhs =(1-params(11))*params(8)+y(10)*params(11)-y(4)+y(4)*params(11)+params(12)*x(2);
residual(9)= lhs-rhs;
residual(10) = y(10);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(10, 10);

  %
  % Jacobian matrix
  %

  g1(1,1)=y(3)*getPowerDeriv(y(1),(-params(2)),1);
  g1(1,2)=(-(params(4)*getPowerDeriv(y(2),params(3),1)));
  g1(1,3)=T12;
  g1(2,4)=(-((-(params(1)*(1+y(5))))/((1+y(4))*(1+y(4)))));
  g1(2,5)=(-(params(1)/(1+y(4))));
  g1(3,1)=(-((1+y(5))*params(5)/y(5)*getPowerDeriv(y(1),params(2),1)));
  g1(3,5)=(-(T32*(y(5)*params(5)-(1+y(5))*params(5))/(y(5)*y(5))));
  g1(3,6)=1;
  g1(4,3)=(-(1/y(9)));
  g1(4,7)=1;
  g1(4,9)=(-((-y(3))/(y(9)*y(9))));
  g1(5,4)=(-((-(y(4)*params(13)+(1+y(4))*params(13)))+y(4)*params(1)*params(13)+(1+y(4))*params(1)*params(13)));
  g1(5,7)=(-params(6));
  g1(6,1)=(-1);
  g1(6,4)=(-(y(8)*params(13)/2*2*y(4)));
  g1(6,8)=1-T54;
  g1(7,2)=(-y(9));
  g1(7,8)=1;
  g1(7,9)=(-y(2));
  g1(8,9)=1/y(9)-params(9)*1/y(9);
  g1(9,4)=(-((-1)+params(11)));
  g1(9,10)=1-params(11);
  g1(10,10)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],10,100);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],10,1000);
end
end
end
end
