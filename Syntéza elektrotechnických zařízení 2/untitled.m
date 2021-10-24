data_1 = data1(:,2);
data_2 = data2(:,2);
data_3 = data3(:,2);

prumer = ((sum(data_3))/1000);

data_u_1 = data_1-prumer;

o = (0:41/1000:(41-(41/1000)));

data_u_1 = data_u_1/2.2;

 plot(o,data_u_1);
% plot(data_1);
% hold on;
% plot(data_2);
% plot(data_3);

spotreba = ((sum(data_u_1)+(0.0062)*9894))/10894;

xlabel('èas (ms)');
ylabel('proud (mA)');



