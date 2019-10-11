//Scruggs: May 3rd; EC597 Final
//NK model with Rotemberg pricing friction

var c n w infl int m mc y A DLm ;

varexo epsa epsm;

parameters bbeta ssigma ggamma ppsi ttheta eepsilon pphi ppi
    rrhoa ssiga rrhom ssigm eeta; //shock parameters

bbeta = 0.99;
ssigma = 1;
ggamma = 1;
ppsi = 1;
ttheta = 1;
eepsilon = 10;
pphi = 0.75;
ppi = .0;
eeta = 104.85;
//shock parameters
rrhoa = 0.95; ssiga = 0.01; rrhom = 0; ssigm = 0.01;


model;
w*c^(-ssigma)=ppsi*n^ggamma;
1=bbeta * (c(+1)/c)^(-ssigma) * (1+int)/(1+infl(+1));
m=ttheta*(1+int)/int*c^ssigma;
mc=w/A;
eepsilon - 1 = eepsilon*mc - eeta*infl*(infl+1)+bbeta*eeta*infl(+1)*(infl(+1)+1)*(c(+1)/c)^(-ssigma)*(y/y(+1));
y = c + eeta/2*infl^2*y;
y=A*n;
log(A)=rrhoa*log(A(-1))+ssiga*epsa;
DLm = (1-rrhom)*ppi + rrhom*DLm(-1)-infl+rrhom*infl(-1)+ssigm*epsm;
DLm = log(m)-log(m(-1));
end;


initval;
DLm = 0;
infl = ppi;
A = 1;
int = (1+ppi)/bbeta-1;
mc = (eepsilon-1)/eepsilon+eeta*infl*(infl+1)-bbeta*eeta*infl*(infl+1);
w = mc;
n = w/ppsi*(1-eeta/2*infl^2)^(-ssigma);
y = n;
c = y*(1-eeta/2*infl^2);
m = ttheta*(1+int)/int*c^ssigma;
end;

steady;
check;

shocks;
var epsa = 1;
var epsm = 1;
end;

stoch_simul(irf=30, noprint, nograph, order=1) y n m infl mc w DLm A;