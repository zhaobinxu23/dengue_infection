
function YY = Objective_dengue_figure_4(para_est)

    parameter_setting_dengue_figure_4;

    
    %% values for newly added parameters
    para(6) = para_est(1);
    para(7) = para_est(2);
    para(8) = para_est(3);
    para(12) = para_est(4);
    para(14) = para_est(5);
    para(15) = para_est(6);
    


    %% Data for IL-6 stimulation, 5 ng/ml
    Time = [73:4:113];
    Virus_control = [31700000 5400000 714000 46900 17500 6100 7430 7090 1920 398 350];
    Constant_1  = 6e9/3.17e7;
    Virus_control_new  = Virus_control*Constant_1;
    Constant_2  = 2e10/44;

    IgM = [2.37 5.28 9.74 16.59 23.72 30.29 30.79 32.18 32.76 36.76 33.39]*Constant_2;   
    IgG = [1.56 4.03 10.1 17.94 26.19 34.79 38.85 43.46 43.56 44.27 44.14]*Constant_2;
    

   
      
    %% calculate the accumulation rate of APP (Jens' paper) and plot the time profile of APP (Heinch's paper) for continuous IL-6 stimulation

    [t y]=ode15s(@pathway_model_NK_cell_1_figure_4,[0 200],x0,[],para);


    Virus_prediction = y(:,3); 
    IgM_prediction = y(:,4);
    IgG_prediction = y(:,6);

    rate_Virus = interp1(t,Virus_prediction,Time);
    rate_IgM = interp1(t,IgM_prediction,Time);
    rate_IgG = interp1(t,IgG_prediction,Time);
%     rate_Hat_data = interp1([0:7], mean(Hap_IL6), Time);   %rate_Hat_data = interp1([0:7], mean(Hap_IL6), Time);
%     rate_Fib_data = interp1([0:7], mean(Fib_IL6), Time);
%     rate_Alb_data = interp1([0:7], mean(Alb_IL6), Time);
    
    Y1 = [(rate_Virus - Virus_control_new) (rate_IgM - IgM) (rate_IgG - IgG)];
%     Y2 = [(rate_IgM - IgM)/max(rate_IgM)];
%     Y3 = [(rate_IgG - IgG)/max(rate_IgG)];

    YY = sum(Y1.^2);

end






