//Scruggs 3/21/19: Plain RBC model

var c n k y inv r w Rf A;

varexo epsA;

parameters bbeta aalpha ddelta ttheta A0 rrhoA ssigA
    nDk ggamma;

bbeta = 0.99;
ggamma = 50;
aalpha = 0.33;
ddelta = 0.02;
//ttheta = 2*(1-aalpha)/(1-ddelta*(aalpha/(1/bbeta-1+ddelta)));
ttheta = 7.72;
//shock parameters
A0=1;
rrhoA = 0.9;
ssigA = 0.01;
//
nDk=( (1/bbeta-1+ddelta)/aalpha )^(1/(1-aalpha));

model;
    1/c = ttheta*(n^(ggamma)/w);
    bbeta*(c/c(+1))*Rf = 1;
    bbeta*(c/c(+1))*(r(+1)+1-ddelta) = 1;
    y=A*k(-1)^aalpha*n^(1-aalpha);
    aalpha*y/k(-1)=r;
    (1-aalpha)*y/n=w;
    c+inv=y;
    inv=k-(1-ddelta)*k(-1);
    //shock
    A-A0=rrhoA*(A(-1)-A0) + A0*ssigA*epsA;
end;

initval;
    Rf=1/bbeta;
    r=1/bbeta-1+ddelta;
    w=(1-aalpha)*nDk^(-aalpha);
    k=(((1-aalpha)*nDk^(-aalpha))/(ttheta*nDk^(aalpha)*(nDk^(1-aalpha)-ddelta)))^(1/(1+aalpha));
    inv=ddelta*k;
    y=k*nDk^(1-aalpha);
    c=y-inv;
    n=k*nDk;
    A=A0;
end;

steady;
check;

shocks;
    var epsA = 1;
end;

stoch_simul(irf=35, order=1, loglinear);