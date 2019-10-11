//Scruggs HW 02

var c R w;

varexo epsl;

parameters bbeta ssigma R0 rrho ssigEpsl w0;

bbeta = 0.98;
ssigma = 2;
R0 = 1/bbeta;
rrho = 0.5;
ssigEpsl = 0.01*R0;
w0 = 1;

model;
    c = R0*w(-1) - (R0 - 1)*c(-1) + (1 - (((ssigma - 1)/ssigma)*(rrho/(R0-rrho))))*rrho*R(-1)+(1 - (((ssigma - 1)/ssigma)*(rrho/(R0-rrho))))*ssigEpsl*epsl;
    w = R0*w(-1) - (R0 - 1)*c(-1) + R;
    R = rrho*R(-1) + ssigEpsl*epsl;
end;

steady;
check;

shocks;
    var epsl = 1;
end;

stoch_simul(irf=10,order=1);


