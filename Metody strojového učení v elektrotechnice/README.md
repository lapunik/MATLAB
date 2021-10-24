# Metody strojového učení v elektrotechnice

Tohle je předmět z mého prvního roku na doktorátu. Zatím tady přibývají nějaké super funkce, které slouží jako úvod do předmětu. 

## První úkol:
První úkol spočíval ve vytvoření polynomiální regrese za použití metodoy nejmenších čtverců. Smysl této úlohy spočíval v porovnání a prozkoumání toho, jak moc aproximaci ovlivňuje řád polynomu. Pro různě složité křivky jsou vhodné různé řády polynomů. Ve chvíli kdy použiju příliš velký řád polynomu, dojde k přeučení modelu a výsledná aproximace neodpovídá požadované křivce. 

Druhou částí úkolu bylo doplnění této regrese o regularizaci, a stejně jako u řádu polynomu sledovat jak moc regularizace ovlivňuje aproximaci.

K těmto úkolům byli vytvořeny následující soubory:

```
Linear_equations
```

který sloužil pouze pro zopakování si práce s maticemi v MATLABu. 

```
Regression
```

který obsahuje hlavní skript kódu. Z tohoto skriptu jsou volány dále popisované funkce. Skrip je interaktivní a dovoluje hrát si s řádem polynomu resp. s hodnotou regularizačního členu a přímo sledovat tuto změnu na vykreslených grafech.


```
Polynomial_regression
```

tato funkce zajišťuje nejdůležitější část kódu, a sice samotný výpočet aproximace. Celý postup je ve funkci podrobně vysvětlen.

```
Polynomial_evaluation
```

poslední funkce v podstatě jen nahrazuje klasický polyval. Prostě spočítá podle určité aproximace výstupní body. 
