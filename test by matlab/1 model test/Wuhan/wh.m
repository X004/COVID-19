
clear;
clc;
%��������
%N = 10000;  %�˿�����
% load test.txt;
% total_infected = test(:,3);
% total_death = test(:,4);
% total_cure = test(:,5);
total_infected = [433	495	572	618	698	1590	1905	2261	2639	3215	4109	5142	6384	8351	10117	11618	13603	14982	16902	18454	19558	32994	35991	37914	39462	41152	42752	44412	45027	45346	45660	46201	46607	47071	47441	47824	48137	48557	49122	49315	49426	49540	49671	49797	49871	49912	49948	49965	49978	49986	49991	49995	49999	50003	50004	50005	50005	50005	50005	50005	50005	50006	50006	50006	50006	50006	50006	50006	50006	50007	50007	50007	50008	50008	50008	50008	50008	50008	50008	50008	50008	50008	50008	50008	50008	50008	50333	50333	50333	50333	50333	50333	50333	50333	50333	50333	50333	50333	50333	50333];
total_death = [17	24	38	45	63	85	104	129	159	192	224	265	313	362	414	478	545	608	681	748	820	1036	1016	1123	1233	1309	1381	1497	1585	1684	1774	1856	1987	2043	2085	2104	2132	2169	2195	2227	2251	2282	2305	2328	2349	2370	2388	2404	2423	2430	2436	2446	2456	2469	2480	2490	2496	2498	2504	2508	2517	2524	2526	2531	2535	2538	2543	2547	2548	2553	2559	2563	2567	2570	2571	2571	2572	2574	2575	2577	2577	2579	2579	2579	2579	2579	3869	3869	3869	3869	3869	3869	3869	3869	3869	3869	3869	3869	3869	3869];

E = 650;              %Ǳ����,ȡ�����ٷ�֮15��1��22������
I = 433;              %������
R = 123;              %�ۼƿ����˴�
D = 17;              %������
S = 11210000;  %�׸���
II =I;               % �������ۼ��˴�
a_I = 5;    %�����߽Ӵ��׸��ߵ�����
B_I = 0.5;  %�����ߴ�Ⱦ�����˸���
a_E = 20;    %Ǳ���߽Ӵ��׸��ߵ�����
B_E = 0.5;  %Ǳ���ߴ�Ⱦ�����˵ĸ���
i_R = 0.9436;  %�����߿�����
i_D = 0.0579;%������������
e_I= 0.188;    %Ǳ���߷�����
e_R = 0.1;   %Ǳ���߿�����
n = 2/3;     %������δ��������
n_d = 1;     %�����˿������
td = 5;     %�Ͻ�����

T = 1:100;
for idx = 1:length(T)-1
    if idx>=td
        n_d = 0.0822;
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
plot([td td],[0 100000]);
xlabel('Time');ylabel('Number');
legend('Real data Infected','Real data Death','Test data Infected','Test data Death','Exec data');
title('Real vs Test of WH')
saveas(gcf,'C:\Users\mi\Desktop\20200704\1��ģ��У��\�人\remodlewh.svg');
Caculate_infected = round(II);
Caculate_death = round(D);
total_infected = total_infected.';
total_death = total_death.';
Total_infected = round(total_infected.');
Total_death = round(total_death.');
results=[Caculate_infected;Caculate_death;Total_infected;Total_death];
xlswrite('C:\Users\mi\Desktop\20200704\1��ģ��У��\�人\remodlewh1.xlsx',results);
clear;
clc;
