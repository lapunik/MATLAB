% x = [-2:2]; % radkovy vektor, -2, -1, 0, 1, 2 (strednik zabranuje vykresleni)
% x = 2:2 % lze i bez zavorek 
% x = [-2:2]' % transponovan (ve sloupci) 

x = [-2:0.1:2]'; % krok 0.1
y = x.^(2);

%plot(x,y,'k'); % spojity cas (narozdil od stem napø.)
%plot(x,y,'--ks','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','r','MarkerFaceColor',[0.5,0.5,0.5])

%xlabel('osa x');
%ylabel('osa y');

%****************************************************************************************
%{
stem(x,y); % diskretni cas

xlabel('osa x \alpha_1'); % nìco málo pøíkazù to zná z Techu
ylabel('osa y \gamma_2','rotation',45); % rotation a uhel aby to nevypadalo špatnì 

title('Titulek');
%title(['\fontsize{16}black {\color{magenta}magenta ','\color[rgb]{0 .5 .5}teal \color{red}red} black again'])

grid on;

%****************************************************************************************

figure(2); % novy obrazek

clf; % zavøe prvni obrazek a nahradi ho novym

set(gcf,'color','white'); % bíle pozadí (místo šedého)

stem(x,y,'k');

set(gca,'box', 'off', 'LineWidth','2','FontWeight','demi'); % ramecek vypnout, silnìjší èáry, velikost fontu

grid on;

parametr = 24;

sparametr = num2str(parametr); % nyní mùžeme použít parametr jako string (tøeba v titulku figure)

title(['parametr je',sparametr]);

%}

%****************************************************************************************

subplot(2,3,1); % kolik radku, kolik sloupcu a do jakeho policka se graf vykresli

