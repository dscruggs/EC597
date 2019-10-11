//Scruggs: May 3rd; EC597 Final
// NK model with Calvo pricing friction

var c n w infl int m mc inflo x1 x2 y v A DLm;

varexo epsa epsm;

parameters bbeta ssigma ggamma ppsi ttheta eepsilon pphi ppi
    rrhoa ssiga rrhom ssigm; //shock parameters

bbeta = 0.99;
ssigma = 1;
ggamma = 1;
ppsi = 1;
ttheta = 1;
eepsilon = 10;
pphi = 0.75;
ppi = 0.0;
//shock parameters
rrhoa = 0.95; ssiga = 0.01; rrhom = 0; ssigm = 0.01;


model;
w*c^(-ssigma)=ppsi*n^ggamma;
1=bbeta * (c(+1)/c)^(-ssigma) * (1+int)/(1+infl(+1));
m=ttheta*(1+int)/int*c^ssigma;
mc=w/A;
1+inflo=eepsilon/(eepsilon-1)*(1+infl)*x1/x2;
x1=c^(-ssigma)*mc*y+pphi*bbeta*(1+infl(+1))^eepsilon*x1(+1);
x2=c^(-ssigma)*y+pphi*bbeta*(1+infl(+1))^(eepsilon-1)*x2(+1);
c=y;
y=A*n/v;
v=(1-pphi)*(1+infl)^eepsilon*(1+inflo)^(-eepsilon)+pphi*(1+infl)^eepsilon*v(-1);
(1+infl)^(1-eepsilon)=(1-pphi)*(1+inflo)^(1-eepsilon)+pphi;
log(A)=rrhoa*log(A(-1))+ssiga*epsa;
DLm = (1-rrhom)*ppi + rrhom*DLm(-1)-infl+rrhom*infl(-1)+ssigm*epsm;
DLm = log(m)-log(m(-1));
end;


initval;
DLm = 0;
infl = ppi;
A = 1;
int = (1+ppi)/bbeta-1;
inflo = (((1+infl)^(1-eepsilon)-pphi)/(1-pphi))^(1/(1-eepsilon))-1;
v = (1-pphi)/(1-(1+infl)^eepsilon*pphi)*((1+infl)/(1+inflo))^eepsilon;
mc = (eepsilon-1)/eepsilon*(1+inflo)/(1+infl)*(1-pphi*bbeta*(1+infl)^eepsilon)/(1-pphi*bbeta*(1+infl)^(eepsilon-1));
w = mc;
n = (1/ppsi*v^(ssigma)*mc)^(1/(ssigma+ggamma));
y = n/v;
c = y;
m = ttheta*(1+int)/int*c^ssigma;
x1 = c^(1-ssigma)*mc/(1-pphi*bbeta*(1+infl)^eepsilon);
x2 = c^(1-ssigma)/(1-pphi*bbeta*(1+infl)^(eepsilon-1));
end;

steady;
check;

shocks;
var epsa = 1;
var epsm = 1;
end;

stoch_simul(irf=30, nograph, noprint, order=1) y n m infl inflo mc w v DLm A;