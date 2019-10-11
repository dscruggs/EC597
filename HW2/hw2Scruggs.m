%Scruggs HW 2
clear; clc;
ssigma = 2;
bbeta = 0.98;
R0=1/bbeta;
rrho = 0.5;
ssigEpsl = 0.01*R0;

%% 1.B
psi = (ssigma-1)/ssigma * rrho/(R0-rrho);

modelCoeffs = array2table([R0 (1-R0) (1+psi)*rrho (1-psi)*ssigEpsl],...
        'VariableNames',{'wm1','cm1','rml','epslml'})
        
%% 1.C
chi = ((1-R0)*psi+rrho);
h=0:10;
IRF_c = (chi*((1-rrho.^h)/(1-rrho)) + 1 + psi*rrho.^h)*ssigEpsl; 

figure(1)
    plot(h,IRF_c,'-b','LineWidth',1)
    title('IRF Consumption')
