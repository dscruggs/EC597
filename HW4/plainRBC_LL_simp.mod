//Scruggs 3/21/19: Plain RBC, log-linearlized

var c k A;

varexo epsA;

parameters bbeta aalpha ddelta ttheta A0 rrhoA ssigA
    nDk r0 n0 k0 c0 inv0 y0 ggamma;

bbeta = 0.99;
ggamma = 1;
aalpha = 0.33;
ddelta = 0.02;
//ttheta = 2*(1-aalpha)/(1-ddelta*(aalpha/(1/bbeta-1+ddelta)));
ttheta = 7.72;
//shock parameters
A0=1;
rrhoA = 0.9;
ssigA = 0.01;
//st.st.
nDk=( (1/bbeta-1+ddelta)/aalpha )^(1/(1-aalpha));
r0=1/bbeta-1+ddelta;
w0=(1-aalpha)*nDk^(-aalpha);
k0=(((1-aalpha)*nDk^(-aalpha))/(ttheta*nDk^(aalpha)*(nDk^(1-aalpha)-ddelta)))^(1/(1+aalpha));
inv0=ddelta*k0;
y0=k0*nDk^(1-aalpha);
c0=y0-inv0;
n0=k0*nDk;

model;
    ( 1+bbeta*r0*(1-aalpha)/(2*aalpha) )*c(+1) -
        (bbeta*r0*(aalpha-1)/(2))*k = bbeta*r0*rrhoA*(aalpha+1)/(2*aalpha)*A + c;
    inv0/(ddelta*y0)*k = (aalpha+1)/(2*aalpha)*A +
        ( (1+aalpha)/(2) + inv0*(1-ddelta)/(ddelta*y0) )*k(-1) -
        ( (1-aalpha)/(2*aalpha) + c0/y0 )*c;
    //shock
    A=rrhoA*A(-1) + ssigA*epsA;
end;

steady;
check;

shocks;
    var epsA = 1;
end;

stoch_simul(irf=35, order=1);