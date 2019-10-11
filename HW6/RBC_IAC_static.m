function [residual, g1, g2, g3] = RBC_IAC_static(y, x, params)
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

T14 = y(2)^params(4);
T42 = y(4)^params(2);
T43 = y(9)*T42;
T44 = y(2)^(1-params(2));
lhs =y(7);
rhs =params(5)*y(3)*T14;
residual(1)= lhs-rhs;
lhs =params(1)*y(8);
rhs =1;
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(3)*params(1)/y(3)*(y(6)+y(10)*(1-params(3)));
residual(3)= lhs-rhs;
lhs =y(6);
rhs =params(2)*y(1)/y(4);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =y(1)*(1-params(2))/y(2);
residual(5)= lhs-rhs;
lhs =y(1);
rhs =T43*T44;
residual(6)= lhs-rhs;
lhs =y(3)+y(5);
rhs =y(1);
residual(7)= lhs-rhs;
lhs =y(4)-(1-params(3))*y(4);
rhs =y(5);
residual(8)= lhs-rhs;
lhs =1;
rhs =y(10);
residual(9)= lhs-rhs;
lhs =y(9)-params(9);
rhs =(y(9)-params(9))*params(6)+params(9)*params(7)*x(1);
residual(10)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(10, 10);

  %
  % Jacobian matrix
  %

  g1(1,2)=(-(params(5)*y(3)*getPowerDeriv(y(2),params(4),1)));
  g1(1,3)=(-(params(5)*T14));
  g1(1,7)=1;
  g1(2,8)=params(1);
  g1(3,6)=(-(y(3)*params(1)/y(3)));
  g1(3,10)=1-y(3)*params(1)/y(3)*(1-params(3));
  g1(4,1)=(-(params(2)/y(4)));
  g1(4,4)=(-((-(params(2)*y(1)))/(y(4)*y(4))));
  g1(4,6)=1;
  g1(5,1)=(-((1-params(2))/y(2)));
  g1(5,2)=(-((-(y(1)*(1-params(2))))/(y(2)*y(2))));
  g1(5,7)=1;
  g1(6,1)=1;
  g1(6,2)=(-(T43*getPowerDeriv(y(2),1-params(2),1)));
  g1(6,4)=(-(T44*y(9)*getPowerDeriv(y(4),params(2),1)));
  g1(6,9)=(-(T42*T44));
  g1(7,1)=(-1);
  g1(7,3)=1;
  g1(7,5)=1;
  g1(8,4)=1-(1-params(3));
  g1(8,5)=(-1);
  g1(9,10)=(-1);
  g1(10,9)=1-params(6);
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
