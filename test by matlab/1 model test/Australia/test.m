clear;
clc;
%参数设置
%N = 10000;  %人口总数
load test.txt;
total_infected = test(:,2);
total_death = test(:,3);
E = 10;              %潜伏者
I = 92;              %发病者
R = 0;              %累计康复人次
D = 3;              %死亡者
S = 25440000;  %易感者
II =I;               % 发病者累计人次

T = 1:100;

for idx = 1:8
    a_I = 5;    %发病者接触易感者的人数
    B_I = 0.2;  %发病者传染正常人概率
    a_E = 11;    %潜伏者接触易感者的人数
    B_E = 0.2;  %潜伏者传染正常人的概率
    i_R = 0.99;  %发病者康复率
    i_D = 0.01;%发病者死亡率
    e_I= 0.19;    %潜伏者发病率
    e_R = 0.1;   %潜伏者康复率
    n = 0.2;     %发病者未被收治率
    n_d = 1;     %流动人口外出率
    td = 6;      %严禁日期
    if idx>=td
        n_d = 0.18;
    end
    S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
    E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
    I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
    R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
    D(idx+1) = D(idx) + i_D*I(idx);
    II(idx+1) = II(idx)+ I(idx+1);
end
for idx = 9:15
    a_I = 5;    %发病者接触易感者的人数
    B_I = 0.5;  %发病者传染正常人概率
    a_E = 20;    %潜伏者接触易感者的人数
    B_E = 0.5;  %潜伏者传染正常人的概率
    i_R = 0.999;  %发病者康复率
    i_D = 0.001;%发病者死亡率
    e_I= 0.5;    %潜伏者发病率
    e_R = 0.1;   %潜伏者康复率
    n = 0.6;     %发病者未被收治率
    n_d = 1;     %流动人口外出率
    td = 1;      %严禁日期
    if idx>=td
        n_d = 0.3;
    end
    S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
    E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
    I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
    R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
    D(idx+1) = D(idx) + i_D*I(idx);
    II(idx+1) = II(idx)+ I(idx+1);
end
for idx = 16:54
    a_I = 5;    %发病者接触易感者的人数
    B_I = 0.3;  %发病者传染正常人概率
    a_E = 10;    %潜伏者接触易感者的人数
    B_E = 0.3;  %潜伏者传染正常人的概率
    i_R = 0.9825;  %发病者康复率
    i_D = 0.0175;%发病者死亡率
    e_I= 0.2;    %潜伏者发病率
    e_R = 0.1;   %潜伏者康复率
    n = 0.1;     %发病者未被收治率
    n_d = 1;     %流动人口外出率
    td = 1;      %严禁日期
    if idx>=td
        n_d = 0.256;
    end
    S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
    E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
    I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
    R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
    D(idx+1) = D(idx) + i_D*I(idx);
    II(idx+1) = II(idx)+ I(idx+1);
end
for idx = 55:length(T)-1
    a_I = 5;    %发病者接触易感者的人数
    B_I = 0.3;  %发病者传染正常人概率
    a_E = 19;    %潜伏者接触易感者的人数
    B_E = 0.3;  %潜伏者传染正常人的概率
    i_R = 0.988;  %发病者康复率
    i_D = 0.012;%发病者死亡率
    e_I= 0.89;    %潜伏者发病率
    e_R = 0.1;   %潜伏者康复率
    n = 0.7;     %发病者未被收治率
    n_d = 1;     %流动人口外出率
    td = 1;      %严禁日期
    if idx>=td
        n_d = 0.168;
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
saveas(gcf,'C:\Users\mi\Desktop\20200704\6：模型应用\澳大利亚\remodleAustralia.svg');
Caculate_infected = round(II);
Caculate_death = round(D);
Total_infected = round(total_infected.');
Total_death = round(total_death.');
results=[Total_infected;Total_death;Caculate_infected;Caculate_death];
xlswrite('C:\Users\mi\Desktop\20200704\6：模型应用\澳大利亚\remodleAustralia.xlsx',results);
clear;
