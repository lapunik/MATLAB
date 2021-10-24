%% load + parse data
if exist('skm_data.mat', 'file')
    fprintf('Data naètena z naposledy uloženého souboru\n')
    load('skm_data.mat', 'skm', 'menza', 'breakfests', 'lunches')
else
    loadDataSkm;

    menza = getMenzaData(skm); % vyseparuje údaje jenom nákupy z menzy

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
    fprintf('Data naètena z xlsx souboru\n')
end

%% Útrata
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

xlabel('Èas')
ylabel('[kKè]')
title('Jak se hromadila celková útrata')
hold off

%% Poèet položek
time = posixtime(lunches.Cas);

p = polyfit(time, lunches.Cena, 4);
cena = polyval(p, time(1:10:end));

p = polyfit(time, lunches.Elements, 4);
elements = polyval(p, time(1:10:end));


figure(3)
yyaxis left
plot(lunches.Cas(1:10:end), cena, 'b')% , lunches.Cas, lunches.Cena, 'k.')
ylim([0 Inf])
ylabel('Kè')

yyaxis right
plot(lunches.Cas(1:10:end), elements, 'r')
ylabel('ks')

xlabel('Èas')
title('Prùmìrné množství a cena položek k obìdu')
legend('Cena', 'Poèet položek')

clear time p cena elements

%% TOP list
figure(4)
top = 30;
h=histogram(menza.Popis, 'DisplayOrder', 'descend', 'NumDisplayBins', top);
ylabel('[ks]')
title(sprintf('TOP%d jídel', top))

fprintf('Nejvíce (%dx) jsi koupil - %s\n',h.Values(1),string(h.Categories(1)));

clear top h

%% Nejdražší položka
[m index] = max(menza.Uhrady);
fprintf('Nejdražší jídlo, co jsi koupil, je - %s za %dKè\n', string(menza.Popis(index)), m);
clear m index

%% Je nìco, co zajímavì vzrostlo/pokleslo ?

%% Prùmìrná cena obìda
figure(5);
plot(lunches.Cas, lunches.Cena)

fprintf('\n')
fprintf('Prùmìrná cena obìda od poèátku je %.1fKè (medián %.1fKè)\n', mean(lunches.Cena), median(lunches.Cena));
fprintf('Prùmìrná cena obìda za poslední rok je %.1fKè (medián %.1fKè)\n', mean(lunches.Cena(lunches.Cas >= (datetime - years(1)))), median(lunches.Cena(lunches.Cas >= (datetime - years(1)))));
fprintf('\n')
%% Kdy nejèastìji nakupuji ?
temp = lunches.Cas;
temp.Year = 2018;
temp.Month = 1;
temp.Day = 1;
figure(6);
h = histogram(temp);
h.BinWidth = minutes(10);
title('Kdy nejèastìji nakupuji?')
% plot(flip(temp))


clear h temp








function menza=getMenzaData(skm)
    menza = skm;
    cond = ((skm.Popis == 'Hotovost') | (skm.Popis == 'Nabíjecí služba') | ...
        (skm.Popis == 'SafeQ') | (skm.Popis == 'Platba z úètu') | ...
        (skm.Popis == 'Vklad hotovosti') | (skm.Popis == 'Pøevod z Záloha na ubytování') | ...
        (skm.Popis == 'Platební karta') | (skm.Popis == 'Pøevod na Záloha na ubytování') | ...
        (skm.Popis == 'Uhrada za tiskove sluzby') | (skm.Popis == 'Pøevod na Rezervaèní kauce') | ...
        (skm.Popis == 'Pøevod na Ubytovací kauce') | contains(string(menza.Popis), 'Ubytování') | ... 
        contains(string(menza.Popis), 'promoce'));
    menza(cond,:) = [];
    cond = (menza.Popis == 'Jablka malá');
    menza.Popis(cond) = categorical(cellstr('Jablka'));
    
%     menza.Popis = strrep(menza.Popis, '150g', '');
%     menza.Popis = strtrim(table2cell(menza.Popis));
end