%% load + parse data
if exist('skm_data.mat', 'file')
    fprintf('Data na�tena z naposledy ulo�en�ho souboru\n')
    load('skm_data.mat', 'skm', 'menza', 'breakfests', 'lunches')
else
    loadDataSkm;

    menza = getMenzaData(skm); % vyseparuje �daje jenom n�kupy z menzy

    lunches = struct();
    breakfests = struct();
    index_l = 1;
    k = 1;
       
    while k < (size(menza,1)-1)
        num = 0;
        while ((menza.Cas(k) - menza.Cas(k+num+1)) < minutes(45))
            num = num+1;
        end
        
            lunches.Cas(index_l) = menza.Cas(k);
            lunches.Cena(index_l) = sum(menza.Uhrady(k:k+num));
            lunches.Elements(index_l) = num+1;
            index_l = index_l+1;
            
        k = k+num+1;
    end

    for k = 1:size(menza,1)
        str = menza.Popis(k);
        str = char(str);
        while ~isempty(sscanf(str(end), '%d'))
            if (~isempty(sscanf(str(end-1:end), '%2d')) && (str(end-1) ~= ' '))
                str(end-2:end) = [];
            elseif ~isempty(sscanf(str(end), '%1d'))
                str(end-1:end) = [];
            end
        end
        menza.Popis(k) = categorical(cellstr(str));
    end
    clear k t index* str
    save('skm_data.mat', 'skm', 'menza', 'breakfests', 'lunches');
    fprintf('Data na�tena z xlsx souboru\n')
end

%% �trata
figure(1)
% fit
time = posixtime(skm.Cas);
price = flip(cumsum(skm.Uhrady))/1000;

p = polyfit(time,price,2);
y = polyval(p, time);

% plot
figure(2)
plot(skm.Cas, price);
hold on
plot(skm.Cas, y)

xlabel('�as')
ylabel('[kK�]')
title('Jak se hromadila celkov� �trata')
hold off

%% Po�et polo�ek
time = posixtime(lunches.Cas);

p = polyfit(time, lunches.Cena, 4);
cena = polyval(p, time(1:10:end));

p = polyfit(time, lunches.Elements, 4);
elements = polyval(p, time(1:10:end));


figure(3)
yyaxis left
plot(lunches.Cas(1:10:end), cena, 'b')% , lunches.Cas, lunches.Cena, 'k.')
ylim([0 Inf])
ylabel('K�')

yyaxis right
plot(lunches.Cas(1:10:end), elements, 'r')
ylabel('ks')

xlabel('�as')
title('Pr�m�rn� mno�stv� a cena polo�ek k ob�du')
legend('Cena', 'Po�et polo�ek')

clear time p cena elements

%% TOP list
figure(4)
top = 30;
h=histogram(menza.Popis, 'DisplayOrder', 'descend', 'NumDisplayBins', top);
ylabel('[ks]')
title(sprintf('TOP%d j�del', top))

fprintf('Nejv�ce (%dx) jsi koupil - %s\n',h.Values(1),string(h.Categories(1)));

clear top h

%% Nejdra��� polo�ka
[m index] = max(menza.Uhrady);
fprintf('Nejdra��� j�dlo, co jsi koupil, je - %s za %dK�\n', string(menza.Popis(index)), m);
clear m index

%% Je n�co, co zaj�mav� vzrostlo/pokleslo ?

%% Pr�m�rn� cena ob�da
figure(5);
plot(lunches.Cas, lunches.Cena)

fprintf('\n')
fprintf('Pr�m�rn� cena ob�da od po��tku je %.1fK� (medi�n %.1fK�)\n', mean(lunches.Cena), median(lunches.Cena));
fprintf('Pr�m�rn� cena ob�da za posledn� rok je %.1fK� (medi�n %.1fK�)\n', mean(lunches.Cena(lunches.Cas >= (datetime - years(1)))), median(lunches.Cena(lunches.Cas >= (datetime - years(1)))));
fprintf('\n')
%% Kdy nej�ast�ji nakupuji ?
temp = lunches.Cas;
temp.Year = 2018;
temp.Month = 1;
temp.Day = 1;
figure(6);
h = histogram(temp);
h.BinWidth = minutes(10);
title('Kdy nej�ast�ji nakupuji?')
% plot(flip(temp))


clear h temp








function menza=getMenzaData(skm)
    menza = skm;
    cond = ((skm.Popis == 'Hotovost') | (skm.Popis == 'Nab�jec� slu�ba') | ...
        (skm.Popis == 'SafeQ') | (skm.Popis == 'Platba z ��tu') | ...
        (skm.Popis == 'Vklad hotovosti') | (skm.Popis == 'P�evod z Z�loha na ubytov�n�') | ...
        (skm.Popis == 'Platebn� karta') | (skm.Popis == 'P�evod na Z�loha na ubytov�n�') | ...
        (skm.Popis == 'Uhrada za tiskove sluzby') | (skm.Popis == 'P�evod na Rezerva�n� kauce') | ...
        (skm.Popis == 'P�evod na Ubytovac� kauce') | contains(string(menza.Popis), 'Ubytov�n�') | ... 
        contains(string(menza.Popis), 'promoce'));
    menza(cond,:) = [];
    cond = (menza.Popis == 'Jablka mal�');
    menza.Popis(cond) = categorical(cellstr('Jablka'));
    
%     menza.Popis = strrep(menza.Popis, '150g', '');
%     menza.Popis = strtrim(table2cell(menza.Popis));
end