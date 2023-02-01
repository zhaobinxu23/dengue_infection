clc
clear
format long
para0 = [1e-5 0.5 0.04 0.4 1e-5 0.01];


% Objective_new(para0)
[para_est, fval] = fmincon(@Objective_dengue_figure_4,para0,[],[],[],[],[1e-6 0.1 0.01 0.1 1e-6 0.002], [1e-4 2 0.2 2 1e-4 0.05])