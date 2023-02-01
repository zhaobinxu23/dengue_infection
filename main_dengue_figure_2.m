% parametersetting; 这个模型要解释为什么可能产生慢性感染 chronic infection

%% model 1, only one type of antiboy is considered, therefore, x0(6) is set to be 0.


clc
clear
x0(1) = 1e10;%% S0
x0(2) = 0;%% I0
x0(3) = 1;%% V0
x0(4) = 1e1;%% G0
x0(5) = 0;%% Cg0
x0(6) = 0;%% weak binding antibody 
x0(7) = 0;


para(1) = 0.0002; %% k2
para(2) = 5e-2; %% k3
para(3) = 1e-5; %%k3’
para(4) = 1e6; %% k4
para(5) = 1e-14;%% k5 
para(6) = 1e-5;%% k6 
para(7) = 0.5;%% k7
para(8) = 0.01;%% k8 
para(9) = 0.1;%% k9 
para(10) = 1e8; %% km
para(11) = 1e6; %% km'
para(12) = 1e2;%% km for antibody_virus complex    no use
para(13) = 1e8;%% km' for antibody_virus complex
para(14) = 1e-8;%% weak binding kinetics 

% para(10) = 1;
% para(11) = 1;
% para(12) = 1;
% para(13) = 1;987g"&)G 79g7lcv8
% para(14) = 9e-15; 
% para(15) = 8e-15; 
% para(16) = 7e-15; 
% para(17) = 6e-15; 
[t y]=ode15s(@pathway_model_NK_cell_figure_2,[0 600],x0,[],para);
% plot(t,y(:,1),'linewidth',2);
% hold on
plot(t,y(:,1),'linewidth',2);
hold on
plot(t,y(:,2),'linewidth',2);
hold on
plot(t,y(:,3),'linewidth',2);
hold on
plot(t,y(:,4),'linewidth',2);
hold on
plot(t,y(:,5),'linewidth',2);
hold on
plot(t,y(:,6),'linewidth',2);
hold on
plot(t,y(:,7),'linewidth',2);
hold on