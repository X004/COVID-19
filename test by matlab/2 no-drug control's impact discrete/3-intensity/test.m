clear;
clc;
E = 650;              %潜伏者,取发病百分之15，1月22日数据
I = 433;              %发病者
R = 123;              %累计康复人次
D = 17;              %死亡者
S = 11210000;  %易感者
II =I;               % 发病者累计人次
a_I = 15;    %发病者接触易感者的人数
B_I = 0.313;  %发病者传染正常人概率
a_E = 20;    %潜伏者接触易感者的人数
B_E = 0.313;  %潜伏者传染正常人的概率
i_R = 0.9436;  %发病者康复率
i_D = 0.0579;%发病者死亡率
e_I= 1/7;    %潜伏者发病率
e_R = 0.1;   %潜伏者康复率
n = 2/3;     %发病者未被收治率
n_d = 1;     %流动人口外出率
td = 5;     %严禁日期
T = 1:200;
for idx = 1:length(T)-1
    if idx>=td
        n_d = 0.1;
    end
    S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
    E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
    I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
    R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
    D(idx+1) = D(idx) + i_D*I(idx);
    II(idx+1) = II(idx)+ I(idx+1);
end
plot(T,S,T,I,T,D);
grid on;
hold on;
plot([td td],[0 15000000]);
xlabel('Time');ylabel('Number');
legend('S:易感者','I:发病者','D:累计死亡');
title('td = 5 n_d = 0.1')
saveas(gcf,'C:\Users\普璞\Desktop\20200704\5：措施力度\measure_strength1.svg');
Caculate_I = round(I);
Caculate_D = round(D);
Caculate_S = round(S);
results=[Caculate_I;Caculate_D;Caculate_S];
xlswrite('C:\Users\普璞\Desktop\20200704\5：措施力度\measure_strength.xlsx',results,1);
clear;
clc;