%Scruggs: May 3rd; EC 597 Final 
%NK model, graphing Calvo and Rotemberg pricing friction
clear; clc; close all;
dynare NK

cnt = (1:30);

%% Calvo Pricing friction

%graph calvo with productivity shock
figure('Name','Calvo Pricing Friction with productivity shock')
subplot(3,3,1)
plot(y_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('y')
hold off

subplot(3,3,2)
plot(n_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('n')
hold off

subplot(3,3,3)
plot(m_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('m')
hold off

subplot(3,3,4)
plot(infl_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('infl')
hold off

subplot(3,3,5)
plot(inflo_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('inflo')
hold off

subplot(3,3,6)
plot(mc_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('mc')
hold off

subplot(3,3,7)
plot(w_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('w')
hold off

subplot(3,3,8)
plot(DLm_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('DLm')
hold off

subplot(3,3,9)
plot(A_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('A')
hold off


%graph calvo with money supply growth shock
figure('Name','Calvo Pricing Friction with money supply growth shock')
subplot(3,3,1)
plot(y_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('y')
hold off

subplot(3,3,2)
plot(n_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('n')
hold off

subplot(3,3,3)
plot(m_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('m')
hold off

subplot(3,3,4)
plot(infl_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('infl')
hold off

subplot(3,3,5)
plot(inflo_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('inflo')
hold off

subplot(3,3,6)
plot(mc_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('mc')
hold off

subplot(3,3,7)
plot(w_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('w')
hold off

subplot(3,3,8)
plot(DLm_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('DLm')
hold off

%% Rotemberg pricing Friction
clear; clc;
dynare K_R
cnt = (1:30);


%graph rotemberg with productivity shock
figure('Name','Rotemberg Pricing Friction with productivity shock')
subplot(3,3,1)
plot(y_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('y')
hold off

subplot(3,3,2)
plot(n_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('n')
hold off

subplot(3,3,3)
plot(m_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('m')
hold off

subplot(3,3,4)
plot(infl_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('infl')
hold off

subplot(3,3,5)
plot(mc_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('mc')
hold off

subplot(3,3,6)
plot(w_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('w')
hold off

subplot(3,3,7)
plot(DLm_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('DLm')
hold off

subplot(3,3,8)
plot(A_epsa,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('A')
hold off


%graph calvo with money supply growth shock
figure('Name','Rotemberg Pricing Friction with money supply growth shock')
subplot(3,3,1)
plot(y_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('y')
hold off

subplot(3,3,2)
plot(n_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('n')
hold off

subplot(3,3,3)
plot(m_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('m')
hold off

subplot(3,3,4)
plot(infl_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('infl')
hold off

subplot(3,3,5)
plot(mc_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('mc')
hold off

subplot(3,3,6)
plot(w_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('w')
hold off

subplot(3,3,7)
plot(DLm_epsm,'b-','LineWidth',1.5)
hold on
plot(cnt,zeros(size(cnt)),'-r','LineWidth',1)
axis('tight')
title('DLm')
hold off

