clear;
clc;
%参数设置
%N = 10000;  %人口总数
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
i_R = 0.985;  %发病者康复率
i_D = 0.015;%发病者死亡率
e_I= 0.142;    %潜伏者发病率1/7
e_R = 0.1;   %潜伏者康复率
n = 2/3;     %发病者未被收治率
n_d = 1;     %流动人口外出率
td = 5;     %严禁日期
T = 1:144;
for idx = 1:143
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
plot(T,II,'r--',T,D,'b--');
grid on;
hold on;
plot([td td],[0 1000]);
xlabel('Time');ylabel('Number');
legend('Test data Infected','Test data Death','Exec data');
title('Test of BJ 144')
saveas(gcf,'C:\Users\mi\Desktop\20200704\2：模型检测\testmodlebj1.svg');
Caculate_infected = round(II);
Caculate_death = round(D);
results=[Caculate_infected;Caculate_death];
xlswrite('C:\Users\mi\Desktop\20200704\2：模型检测\testmodlebj1.xlsx',results);
clear;
clc;
