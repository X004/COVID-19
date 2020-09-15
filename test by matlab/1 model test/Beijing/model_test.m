
clear;
clc;
%参数设置
%N = 10000;  %人口总数
load test.txt;
time = test(:, 1);
total_infected = test(:,2);
total_death = test(:,4);
total_cure = test(:,3);
E = 7;              %潜伏者,取发病百分之15，1月22日数据
I = 5;              %发病者
R = 0;              %累计康复人次
D = 0;              %死亡者
S = 21536000;  %易感者
II =I;               % 发病者累计人次
a_I = 15;    %发病者接触易感者的人数
B_I = 0.313;  %发病者传染正常人概率
a_E = 20;    %潜伏者接触易感者的人数
B_E = 0.313;  %潜伏者传染正常人的概率
i_R = 0.97;  %发病者康复率
i_D = 0.03;%发病者死亡率
e_I= 1/7;    %潜伏者发病率
e_R = 0.1;   %潜伏者康复率
n = 2/3;     %发病者未被收治率
n_d = 1;     %流动人口外出率
td = 5;     %严禁日期

T = 1:168;
for idx = 1:167
    if idx>=td
        n_d = 0.15;
    end
    S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
    E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
    I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
    R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
    D(idx+1) = D(idx) + i_D*I(idx);
    II(idx+1) = II(idx)+ I(idx+1);
end

plot(T,total_infected,'r',T,total_death,'b',T,II,'r--',T,D,'b--');
grid on;
hold on;
plot([td td],[0 1000]);
xlabel('Time');ylabel('Number');
legend('Real data Infected','Real data Death','Test data Infected','Test data Death','Exec data');
title('Real vs Test of BJ')
saveas(gcf,'C:\Users\普璞\Desktop\20200704\2：模型检测\testmodlebj.svg');
Caculate_infected = round(II);
Caculate_death = round(D);
total_infected = total_infected.';
total_death = total_death.';
Total_infected = round(total_infected);
Total_death = round(total_death);
results=[Caculate_infected;Caculate_death;Total_infected;Total_death];
xlswrite('C:\Users\普璞\Desktop\20200704\2：模型检测\testmodlebj.xlsx',results);
clear;
clc;
