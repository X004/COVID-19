clear;
clc;
E = 650;              %Ǳ����,ȡ�����ٷ�֮15��1��22������
I = 433;              %������
R = 123;              %�ۼƿ����˴�
D = 17;              %������
S = 11210000;  %�׸���
II =I;               % �������ۼ��˴�
a_I = 15;    %�����߽Ӵ��׸��ߵ�����
B_I = 0.313;  %�����ߴ�Ⱦ�����˸���
a_E = 20;    %Ǳ���߽Ӵ��׸��ߵ�����
B_E = 0.313;  %Ǳ���ߴ�Ⱦ�����˵ĸ���
i_R = 0.9436;  %�����߿�����
i_D = 0.0579;%������������
e_I= 1/7;    %Ǳ���߷�����
e_R = 0.1;   %Ǳ���߿�����
n = 2/3;     %������δ��������
n_d = 1;     %�����˿������
td = 200;     %�Ͻ�����

T = 1:200;
for idx = 1:length(T)-1
    if idx>=td
        n_d = 0.285;
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
xlabel('Time');ylabel('Number');
legend('S:�׸���','I:������','D:�ۼ�����');
title('�޽��ϴ�ʩ')
saveas(gcf,'C:\Users\���\Desktop\20200704\3�����޴�ʩ\resultN.svg');
Caculate_infected = round(I);
Caculate_death = round(D);
Caculate_suspect = round(S);
results=[Caculate_infected;Caculate_death;Caculate_suspect];
xlswrite('C:\Users\���\Desktop\20200704\3�����޴�ʩ\Caculate_file1N.xlsx',results,1);
clear;

E = 650;              %Ǳ����,ȡ�����ٷ�֮15��1��22������
I = 433;              %������
R = 123;              %�ۼƿ����˴�
D = 17;              %������
S = 11210000;  %�׸���
II =I;               % �������ۼ��˴�
a_I = 15;    %�����߽Ӵ��׸��ߵ�����
B_I = 0.313;  %�����ߴ�Ⱦ�����˸���
a_E = 20;    %Ǳ���߽Ӵ��׸��ߵ�����
B_E = 0.313;  %Ǳ���ߴ�Ⱦ�����˵ĸ���
i_R = 0.9436;  %�����߿�����
i_D = 0.0579;%������������
e_I= 1/7;    %Ǳ���߷�����
e_R = 0.1;   %Ǳ���߿�����
n = 2/3;     %������δ��������
n_d = 1;     %�����˿������
td = 5;     %�Ͻ�����
T = 1:200;
for idx = 1:length(T)-1
    if idx>=td
        n_d = 0.285;
    end
    S(idx+1) = S(idx) - a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + i_R*I(idx) + e_R*E(idx);
    E(idx+1) = E(idx) + a_I*B_I*n*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) + a_E*B_E*n_d*I(idx)*S(idx)/(S(idx) + E(idx) + R(idx) + I(idx) * n) - e_I*E(idx) - e_R*E(idx);
    I(idx+1) = I(idx) + e_I*E(idx) - i_R*I(idx) - i_D*I(idx);
    R(idx+1) = R(idx) + i_R*I(idx) + e_R*E(idx);
    D(idx+1) = D(idx) + i_D*I(idx);
    II(idx+1) = II(idx)+ I(idx+1);
end
figure(2);
plot(T,S,T,I,T,D);
grid on;
hold on;
xlabel('Time');ylabel('Number');
legend('S:�׸���','I:������','D:�ۼ�����');
title('�н��ϴ�ʩ')
saveas(gcf,'C:\Users\���\Desktop\20200704\3�����޴�ʩ\resultY.svg');
Caculate_infected = round(I);
Caculate_death = round(D);
Caculate_suspect = round(S);
results=[Caculate_infected;Caculate_death;Caculate_suspect];
xlswrite('C:\Users\���\Desktop\20200704\3�����޴�ʩ\Caculate_file1Y.xlsx',results);
clear;
clc;