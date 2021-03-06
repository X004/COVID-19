clear;
clc;
%参数设置
%N = 10000;  %人口总数
load test.txt;
total_infected = test(:,2);
total_death = test(:,3);
E = 10;              %潜伏者
I = 323;              %发病者
R = 0;              %累计康复人次
D = 3;              %死亡者
S = 62000000;  %易感者
II =I;               % 发病者累计人次

T = 1:100;
for idx = 1:33
    a_I = 5;    %发病者接触易感者的人数
    B_I = 0.2;  %发病者传染正常人概率
    a_E = 20;    %潜伏者接触易感者的人数
    B_E = 0.207;  %潜伏者传染正常人的概率
    i_R = 0.86;  %发病者康复率
    i_D = 0.14;%发病者死亡率
    e_I= 0.2;    %潜伏者发病率
    e_R = 0.1;   %潜伏者康复率
    n = 0.4;     %发病者未被收治率
    n_d = 1;     %流动人口外出率
    td = 5;      %严禁日期
    if idx>=td
        n_d = 0.5;
    end
    S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
    E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
    I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
    R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
    D(idx+1) = D(idx) + i_D*I(idx);
    II(idx+1) = II(idx)+ I(idx+1);
end
for idx = 34:length(T)-1
    a_I = 5;    %发病者接触易感者的人数
    B_I = 0.2;  %发病者传染正常人概率
    a_E = 18;    %潜伏者接触易感者的人数
    B_E = 0.25;  %潜伏者传染正常人的概率
    i_R = 0.85829;  %发病者康复率
    i_D = 0.14171;%发病者死亡率
    e_I= 0.1295;    %潜伏者发病率
    e_R = 0.1;   %潜伏者康复率
    n = 0.15;     %发病者未被收治率
    n_d = 1;     %流动人口外出率
    td = 5;      %严禁日期
    if idx>=td
        n_d = 0.33382;
    end
    S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
    E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
    I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
    R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
    D(idx+1) = D(idx) + i_D*I(idx);
    II(idx+1) = II(idx)+ I(idx+1);
end
plot(T,total_infected,'r',T,total_death,'b',T,II,'r.',T,D,'b.');
grid on;
hold on;
plot([td td],[0 8000]);
xlabel('Time');ylabel('Number');
legend('Real data Infected','Real data Death','Test data Infected','Test data Death','Exec data');
title('Real vs Test')
saveas(gcf,'C:\Users\mi\Desktop\20200704\6：模型应用\英国\remodleUK.svg');
Caculate_infected = round(II);
Caculate_death = round(D);
Total_infected = round(total_infected.');
Total_death = round(total_death.');
results=[Total_infected;Total_death;Caculate_infected;Caculate_death];
xlswrite('C:\Users\mi\Desktop\20200704\6：模型应用\英国\remodleUK.xlsx',results);
clear;
