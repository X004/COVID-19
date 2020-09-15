clear;
clc;
E = zeros(1,200);
I = zeros(1,200);
R = zeros(1,200);
D = zeros(1,200);
S = zeros(1,200);
II = zeros(1,200);               % 发病者累计人次
a_I = 15;    %发病者接触易感者的人数
B_I = 0.313;  %发病者传染正常人概率
a_E = 20;    %潜伏者接触易感者的人数
B_E = 0.313;  %潜伏者传染正常人的概率
i_R = 0.9436;  %发病者康复率
i_D = 0.0579;%发病者死亡率
e_I= 1/7;    %潜伏者发病率
e_R = 0.1;   %潜伏者康复率
n = 2/3;     %发病者未被收治率

td = 1:200;
Time = zeros(1,200);
Data = zeros(1,200);
for td_indx = 1:length(td)-1
    T = 1:200;
    E(1) = 650;  
    I(1) = 433;
    R(1) = 123;
    D(1) = 17;
    S(1) = 11210000;
    II(1) = 433;
    n_d = 1;     %流动人口外出率
    for idx = 1:length(T)-1
        if idx>=td_indx
            n_d = 0.15;
        end
        S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
        E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
        I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
        R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
        D(idx+1) = D(idx) + i_D*I(idx);
        II(idx+1) = II(idx)+ I(idx+1);
    end
        [val,index] = max(I);
        Time(td_indx) = index;
        Data(td_indx) = val; 
end
T = 1:200;
plot(T,Time,'r',T,Data,'b');
grid on;
hold on;
xlabel('Time');ylabel('Number & Day');
legend('Infected DAY ','Infected NUMBER');
title('200day');
saveas(gcf,'C:\Users\mi\Desktop\20200704\4：措施时间\td_from_1_to_200.svg');
results=[T;Time;round(Data)];
xlswrite('C:\Users\mi\Desktop\20200704\4：措施时间\td_from_1_to_200.xlsx',results);
clear;
clc;