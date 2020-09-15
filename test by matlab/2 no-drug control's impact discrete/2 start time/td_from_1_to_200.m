clear;
clc;
E = zeros(1,200);
I = zeros(1,200);
R = zeros(1,200);
D = zeros(1,200);
S = zeros(1,200);
II = zeros(1,200);               % �������ۼ��˴�
a_I = 15;    %�����߽Ӵ��׸��ߵ�����
B_I = 0.313;  %�����ߴ�Ⱦ�����˸���
a_E = 20;    %Ǳ���߽Ӵ��׸��ߵ�����
B_E = 0.313;  %Ǳ���ߴ�Ⱦ�����˵ĸ���
i_R = 0.9436;  %�����߿�����
i_D = 0.0579;%������������
e_I= 1/7;    %Ǳ���߷�����
e_R = 0.1;   %Ǳ���߿�����
n = 2/3;     %������δ��������

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
    n_d = 1;     %�����˿������
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
saveas(gcf,'C:\Users\mi\Desktop\20200704\4����ʩʱ��\td_from_1_to_200.svg');
results=[T;Time;round(Data)];
xlswrite('C:\Users\mi\Desktop\20200704\4����ʩʱ��\td_from_1_to_200.xlsx',results);
clear;
clc;