function F=pathway_model_NK_cell_1_figure_4(t,y,para)
% the rate constant parameters
%% para(1) = 2e-5; para(2) = 1e-12; para(3) = 10; para(4) = 0.98; para(5) = 1.2
% F(1,1) = 0;
% F(2,1) = 0;
F(1,1)=1e7+(0 - para(1))*y(1)*y(3)/(y(3)+para(10))-(1e-3)*y(1);%% para(10)-para(11)*y(1)-para(1)*y(1)*y(3);
F(2,1) = (0 + para(1))*y(1)*y(3)/(y(3)+para(10)) - para(2)*y(2)*y(6)/(y(6)+para(13)) - para(2)*y(2)*y(4)/(y(4)+para(11)) - para(3)*y(2);  %(para(1)+ 5*y(5)/(y(3)+y(5)+y(7)))*y(2)-para(2)*y(2)*y(4)-para(3)*y(2)-para(10)*y(2)*y(6);%% para(1)*y(1)*y(3)-para(2)*y(2)*y(4)-para(3)*y(2);

F(3,1) = para(4)*para(3)*y(2)-para(6)*y(4)*y(3)-para(14)*y(6)*y(3)+para(5)*(y(5)+y(7));

F(4,1) = para(7)*y(5)-para(6)*y(4)*y(3)-para(8)*y(4)+para(5)*y(5);
F(5,1) = para(6)*y(4)*y(3)-para(9)*y(5)-para(5)*y(5);
F(6,1) = para(12)*y(7)-para(14)*y(6)*y(3)-para(15)*y(6)+para(5)*y(7);
F(7,1) = para(14)*y(6)*y(3)-para(9)*y(7)-para(5)*y(7);

end



