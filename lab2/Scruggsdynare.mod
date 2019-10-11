//Scruggs March 1st;

var C D G P R Pb Rf;

varexo epsG epsD;

parameters bbeta ggamma rrho eeta D0 G0 ssigG ssigD;

bbeta = 0.98;
ggamma = 4;
rrho = 0.5;
eeta = 0.6;
D0 = 1;
G0 = 0.3;
ssigG = 1;
ssigD = 1;

model;
    P = (-ggamma)*(C(+1)-C)+bbeta*(P(+1))+(1-bbeta)*(D(+1));
    R = bbeta*P - bbeta*D - P(-1);
    Pb = (-ggamma)*(C(+1)-C);
    Rf = ggamma*C(+1) - ggamma*C;
    C = (D0/(D0-G0))*D - (G0/(D0-G0))*G;
    D=rrho*(D(-1))+ ssigD*epsD;
    G=eeta*(G(-1))+ ssigG*epsG;
end;

initval;
    D=D0;
    G=G0;
    C=D0-G0;
    Pb=bbeta;
    P=(bbeta/(1-bbeta))*D0;
    R=1/bbeta;
    Rf=1/bbeta;
end;

steady;
check;

shocks;
    var epsD = 1;
    var epsG = 1;
end;

stoch_simul(order=1, irf=10);