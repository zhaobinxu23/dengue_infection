% parametersetting; 这个模型要解释为什么可能产生慢性感染 chronic infection

%% figure 4 plot

clc
clear
x0(1) = 1e10;%% S0
x0(2) = 0;%% I0
x0(3) = 1;%% V0
x0(4) = 1e1;%% IgM
x0(5) = 0;%% Cg0
x0(6) = 1e7;%% IgG
x0(7) = 0;


para(1) = 0.0002; %% k2
para(2) = 5e-2; %% k3
para(3) = 1e-5; %%k3’
para(4) = 1e6; %% k4
para(5) = 1e-14;%% k5 
para(6) = 1e-5;%% k6 0.000045546238707
para(7) = 0.5;%% k7 0.502315506084233
para(8) = 0.04;%% k8 0.050064485640223
para(9) = 0.1;%% k9 
para(10) = 1e8; %% km
para(11) = 1e6; %% km'
para(12) = 0.4;%% km for antibody_virus complex    0.410654296439774
para(13) = 1e6;%% km' for antibody_virus complex
para(14) = 1e-5;%% weak binding kinetics        0.000045551220509
para(15) = 0.01; %%  0.033518718654357

% para(10) = 1;
% para(11) = 1;
% para(12) = 1;
% para(13) = 1;987g"&)G 79g7lcv8
% para(14) = 9e-15; 
% para(15) = 8e-15; 
% para(16) = 7e-15; 
% para(17) = 6e-15; 
[t y]=ode15s(@pathway_model_NK_cell_1_figure_4,[0 500],x0,[],para);
% plot(t,y(:,1),'linewidth',2);
% hold on
% plot(t,y(:,1),'linewidth',2);
% hold on
% plot(t,y(:,2),'linewidth',2);
% hold on
plot(t,y(:,3),'linewidth',2);
hold on
%% experimental data
    Time = [73:4:113];
    Virus_control = [31700000 5400000 714000 46900 17500 6100 7430 7090 1920 398 350];
    Constant_1  = 6e9/3.17e7;
    Virus_control_new  = Virus_control*Constant_1;
    Constant_2  = 2e10/44;

    IgM = [2.37 5.28 9.74 16.59 23.72 30.29 30.79 32.18 32.76 36.76 33.39]*Constant_2;   
    IgG = [1.56 4.03 10.1 17.94 26.19 34.79 38.85 43.46 43.56 44.27 44.14]*Constant_2;
    plot(Time,Virus_control_new);
    hold on
    plot(Time,IgM);
    hold on
    plot(Time,IgG);
    hold on