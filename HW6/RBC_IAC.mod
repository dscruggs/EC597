//Scruggs: April 12th; RBC model with investment adjustment costs.

var y n c k inv r w Rf A q;

varexo epsA;

parameters bbeta aalpha ddelta ggamma ttheta rrhoA ssigA nDk A0 pphi;

bbeta = 0.99;
aalpha = 0.33;
ddelta = 0.018;
ggamma = 1;
ttheta = 7.98;
pphi = 0.0;
//shock parameters
rrhoA = 0.974;
ssigA = 0.01;
//
nDk=((1/bbeta-1+ddelta)/aalpha)^(1/(1-aalpha));
A0 = 1;

model;
    w = ttheta*c*n^ggamma;
    bbeta*(c/c(+1))*Rf = 1;
    q=bbeta*c/c(+1)*(r(+1)+q(+1)*(1-ddelta));
    r=aalpha*y/k(-1);
    w=(1-aalpha)*y/n;
    y=A*k(-1)^aalpha*(n)^(1-aalpha);
    c+inv=y;
    k-(1-ddelta)*k(-1)=(1-(pphi/2)*(inv/inv(-1)-1)^2)*inv;
    1 = q*(1-(pphi/2)*(inv/inv(-1)-1)^2-pphi*(inv/inv(-1)-1)*inv/inv(-1))+bbeta*(c/c(+1))*q(+1)*pphi*(inv(+1)/inv-1)*(inv(+1)/inv)^2;
    //shock
    A - A0 = rrhoA*(A(-1) - A0) + A0*ssigA*epsA;
end;


initval;
    Rf=1/bbeta;
    r=1/bbeta-1+ddelta;
    w=(1-aalpha)*nDk^(-aalpha);
    k=(((1-aalpha)/ttheta)*((nDk^(-(aalpha+ggamma)))/(nDk^(1-aalpha)-ddelta) ))^(1/(1+ggamma));
    inv=ddelta*k;
    y=k*nDk^(1-aalpha);
    c=y-inv;
    n=k*nDk;
    A=A0;
    q=1;
end;

steady;
check;

shocks;
    var epsA = 1;
end;
//, noprint, nograph
stoch_simul(irf=40, order=1, hp_filter=1600, noprint, nograph);