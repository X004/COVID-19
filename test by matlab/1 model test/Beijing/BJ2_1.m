clear;
clc;
%��������
%N = 10000;  %�˿�����
real_data_death=[9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9	9]
real_data_infected = [594	594	594	595	601	637	673	700	731	752	777	799	821	830	843	850	863	874	891	905	912	919	922	923	925	926	928	929]
E = 7;              %Ǳ����,ȡ�����ٷ�֮15��1��22������
I = 1;              %������
R = 0;              %�ۼƿ����˴�
D = 0;              %������
S = 21536000;  %�׸���
II =I;               % �������ۼ��˴�
a_I = 5;    %�����߽Ӵ��׸��ߵ�����
B_I = 0.5;  %�����ߴ�Ⱦ�����˸���
a_E = 20;    %Ǳ���߽Ӵ��׸��ߵ�����
B_E = 0.5;  %Ǳ���ߴ�Ⱦ�����˵ĸ���
i_R = 0.999;  %�����߿�����
i_D = 0.001;%������������
e_I= 0.188;    %Ǳ���߷�����(0.142)!!!!
e_R = 0.1;   %Ǳ���߿�����
n = 2/3;     %������δ��������
n_d = 1;     %�����˿������
td = 6;     %�Ͻ�����
T = 1:28;
for idx = 1:27
    if idx>=td
        n_d = 0.075;
    end
    S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
    E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
    I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
    R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
    D(idx+1) = D(idx) + i_D*I(idx);
    II(idx+1) = II(idx)+ I(idx+1);
end
Caculate_infected = round(II) + 598;
Caculate_death = round(D) + 9;
plot(T,Caculate_infected,'r--',T,Caculate_death,'b--',T,real_data_infected,'r',T,real_data_death,'b');
grid on;
hold on;
plot([td td],[0 1000]);
xlabel('Time');ylabel('Number');
legend('Test data Infected','Test data Death','real data Infected','real data Death','Exec data');
title('Test of BJ 140-168')
saveas(gcf,'C:\Users\mi\Desktop\20200704\2��ģ�ͼ��\testmodlebj2.svg');
results=[Caculate_infected;Caculate_death];
xlswrite('C:\Users\mi\Desktop\20200704\2��ģ�ͼ��\testmodlebj2.xlsx',results);
clear;
clc;
