%Scruggs HW6: April 12th RBC with capital adjustment costs;
pphivalues = [0.0;2;4];
%set_param_value('rrhoA',rrhoAvalues(4));
%stoch_simul(var_list_);
%%
clear; close all; clc;
dynare RBC_CAC
%steady-states (copied from the Dynare file)
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

%looking for dynare for different values of rho
pphivalues = [0.0;2;4];
T=40; %simulation horizon
[nphis,~] = size(pphivalues); %creates matrix with columns for each phi values
A = nan(T,nphis);
Y = nan(T,nphis);
C = nan(T,nphis);
N = nan(T,nphis);
INV = nan(T,nphis);
W = nan(T,nphis);
R = nan(T,nphis);
RF = nan(T,nphis);
Q = nan(T,nphis);
K = nan(T,nphis);

for i=1:nphis
    set_param_value('pphi',pphivalues(i));
    stoch_simul(var_list_);
    
   A(:,i)= A_epsA;
   Y(:,i)= y_epsA;
   C(:,i)= c_epsA;
   N(:,i)= n_epsA;
   INV(:,i)= inv_epsA;
   W(:,i)= w_epsA;
   R(:,i)= r_epsA;
   RF(:,i)= Rf_epsA;
   Q(:,i)= q_epsA;
   K(:,i)= k_epsA;
   
   %N bounded so not transformed
end

%baseline: anything that grows, does it with rate g=0.02.
cnt = (1:T)'; %counter
%% Plotting the responses:
figure(1)
%
subplot(4,3,1)
plot(cnt,Y(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,Y(:,2),'-r','LineWidth',1.5)
plot(cnt,Y(:,3),'-g','LineWidth',1.5)
axis('tight')
title('Output (y)')
hold off
%
subplot(4,3,2)
plot(cnt,C(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,C(:,2),'-r','LineWidth',1.5)
plot(cnt,C(:,3),'-g','LineWidth',1.5)
axis('tight')
title('Consumption (c)')
hold off
%
subplot(4,3,3)
plot(cnt,N(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,N(:,2),'-r','LineWidth',1.5)
plot(cnt,N(:,3),'-g','LineWidth',1.5)
plot(cnt,zeros(size(cnt)),'-k','LineWidth',1)
axis('tight')
title('Hours (n)')
hold off
legend('\phi=0','\phi=2','\phi=4','Location','east')
%
subplot(4,3,4)
plot(cnt,A(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,A(:,2),'-r','LineWidth',1.5)
plot(cnt,A(:,3),'-g','LineWidth',1.5)
axis('tight')
title('Productivity (A)')
hold off
%
subplot(4,3,5)
plot(cnt,INV(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,INV(:,2),'-r','LineWidth',1.5)
plot(cnt,INV(:,3),'-g','LineWidth',1.5)
plot(cnt,zeros(size(cnt)),'-k','LineWidth',1)
axis('tight')
title('Investment (inv)')
hold off
%
subplot(4,3,6)
plot(cnt,W(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,W(:,2),'-r','LineWidth',1.5)
plot(cnt,W(:,3),'-g','LineWidth',1.5)
axis('tight')
title('Wages (w)')
hold off
%
subplot(4,3,7)
plot(cnt,R(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,R(:,2),'-r','LineWidth',1.5)
plot(cnt,R(:,3),'-g','LineWidth',1.5)
plot(cnt,zeros(size(cnt)),'-k','LineWidth',1)
axis('tight')
title('Interest (r)')
hold off
%
subplot(4,3,8)
plot(cnt,RF(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,RF(:,2),'-r','LineWidth',1.5)
plot(cnt,RF(:,3),'-g','LineWidth',1.5)
axis('tight')
title('RF Interest (Rf)')
hold off
%
subplot(4,3,9)
plot(cnt,Q(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,Q(:,2),'-r','LineWidth',1.5)
plot(cnt,Q(:,3),'-g','LineWidth',1.5)
plot(cnt,zeros(size(cnt)),'-k','LineWidth',1)
axis('tight')
title('q')
hold off
%
subplot(4,3,10)
plot(cnt,K(:,1),'-b','LineWidth',1.5)
hold on
plot(cnt,K(:,2),'-r','LineWidth',1.5)
plot(cnt,K(:,3),'-g','LineWidth',1.5)
axis('tight')
title('Capital (k)')
hold off
%

%saving into eps
print('RBC_CAC_IRFs','-depsc')
%saving into pdf
set(gcf, 'PaperPosition', [0 0 8 6]);
saveas(gcf, 'RBC_CAC_IRFs', 'pdf')