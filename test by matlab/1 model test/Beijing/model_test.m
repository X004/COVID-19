
clear;
clc;
%��������
%N = 10000;  %�˿�����
load test.txt;
time = test(:, 1);
total_infected = test(:,2);
total_death = test(:,4);
total_cure = test(:,3);
E = 7;              %Ǳ����,ȡ�����ٷ�֮15��1��22������
I = 5;              %������
R = 0;              %�ۼƿ����˴�
D = 0;              %������
S = 21536000;  %�׸���
II =I;               % �������ۼ��˴�
a_I = 15;    %�����߽Ӵ��׸��ߵ�����
B_I = 0.313;  %�����ߴ�Ⱦ�����˸���
a_E = 20;    %Ǳ���߽Ӵ��׸��ߵ�����
B_E = 0.313;  %Ǳ���ߴ�Ⱦ�����˵ĸ���
i_R = 0.97;  %�����߿�����
i_D = 0.03;%������������
e_I= 1/7;    %Ǳ���߷�����
e_R = 0.1;   %Ǳ���߿�����
n = 2/3;     %������δ��������
n_d = 1;     %�����˿������
td = 5;     %�Ͻ�����

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
saveas(gcf,'C:\Users\���\Desktop\20200704\2��ģ�ͼ��\testmodlebj.svg');
Caculate_infected = round(II);
Caculate_death = round(D);
total_infected = total_infected.';
total_death = total_death.';
Total_infected = round(total_infected);
Total_death = round(total_death);
results=[Caculate_infected;Caculate_death;Total_infected;Total_death];
xlswrite('C:\Users\���\Desktop\20200704\2��ģ�ͼ��\testmodlebj.xlsx',results);
clear;
clc;
