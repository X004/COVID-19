load BJ0815.txt;
time = BJ0815(:,1);
data = BJ0815(:,2);
figure(1);
plot(time,data,'r','LineWidth',2);
%title('北京新增确诊，2020/05/29-2020/07/16');
%legend('New Cases');
xlabel('Time(day)');
ylabel('The number of new cases per day');
