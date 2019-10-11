//Scruggs 4/9/19: RBC model with growth

var c n k y inv r w Rf z A;

varexo epsA;

parameters bbeta aalpha ddelta ttheta Z0 rrho ssigA gg ggamma A0 nDk cDk iDk;

bbeta = 0.99;
aalpha = 0.33;
ddelta = 0.018;
ttheta = 7.98;
ggamma = 1;
gg=0.005;
rrho=0.0;
//shock parameters
Z0=1;
ssigA = 1;
A0=1;
nDk=(((exp(gg)/bbeta)+ddelta-1)/(aalpha*exp(gg)^(1-aalpha)))^(1/(1-aalpha));
cDk=((((exp(gg)/bbeta)+ddelta-1)/(aalpha))-(exp(gg)+ddelta-1));
iDk=(exp(gg)+ddelta-1);

//


model;
    ttheta*c*(n^ggamma) = w;
    bbeta*(c/c(+1))*(1/z)*Rf = 1;
    bbeta*(c/c(+1))*(1/z)*(r(+1)+1-ddelta) = 1;
    y=k(-1)^aalpha*(z*n)^(1-aalpha);
    aalpha*(k(-1))^(aalpha-1)*z^(1-aalpha)*n^(1-aalpha)=r;
    (1-aalpha)*(k(-1))^(aalpha)*z^(1-aalpha)*n^(-aalpha)=w;
    c+inv=y;
    inv=k*z-(1-ddelta)*k(-1);
    //shock
    log(z) = gg + A - A(-1);
    //z=exp(gg+A(-1)*(rrho-1)*ssigA*epsA);
    A=rrho*A(-1) + ssigA*epsA;
end;

initval;
    z=exp(gg);
    Rf=(z/bbeta)-1;
    r=(z/bbeta)-1+ddelta;
    w=(1-aalpha)*nDk^(-aalpha)*z^(1-aalpha);
    n=((w*nDk)/(ttheta*cDk))^(1/(1-aalpha));
    y=nDk^(-aalpha)*z^(1-aalpha)*n;
    k=(1/nDk)*n;
    inv=iDk*k;
    c=cDk*k;
    A=A0;
end;

steady;
check;

shocks;
    var epsA = 1;
end;

stoch_simul(irf=35, order=1);