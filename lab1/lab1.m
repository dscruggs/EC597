%%Scruggs EC597
%Decentralized Economy with labor tax
clear;
clc;
%Model Parameters
beta = 0.98;
delta = 0.1;
theta = 0.36;
A = 0.5;

tax = (0:5:100)./100;

production(3,0.65,theta)

%%

s = size(tax);

results = zeros(4,s(2));


G = (1/(beta*theta)-(1-delta)/theta)^(1/(1-theta));
J = (1/(beta*theta)-(1-delta)/theta-delta);



for i=1:s(2)

    tw = tax(i);
    Kstar = ((1-tw)*(1-theta)*G^(-theta))/(A*J+(1-tw)*(1-theta)*G^(1-theta));
    Hstar = G*Kstar;
    Cstar = J*Kstar;

    Ystar = production(Kstar,Hstar,theta);

    Ustar = utility(Cstar,Hstar,A);
    
    fprintf("Tax(%i): %.2f\nK: %.2f\nH: %.2f\nC: %.2f\nY: %.2f\n",i,tw,Kstar,Hstar,Cstar,Ystar);
    
    results(:,i) = [Cstar,Kstar,Hstar,Ustar]';
    
end



%% Economic Primatives
%Here we use what are called Anonymous Functions in matlab
%Cobb-douglas production
f = @(K,H,alpha) (K.^alpha).*(H.^(1-alpha));
u = @(C,H,alpha) log(C) + A .* log(1-H);
%Partial derivatives
fk = @(K,H,alpha) alpha .* (K.^alpha-1).*(H.^(1-alpha));
fh = @(K,H,alpha) (1-alpha) .* (K.^alpha).*(H.^(-alpha));
uc = @(c) 1./C;
uh = @(H,alpha) (-A) ./ (1-H);

%%

function u = utility(c,h,a)
    u = log(c)+a*log(1-h);
end







