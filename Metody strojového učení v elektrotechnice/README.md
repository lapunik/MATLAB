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
Regression_analytically
```

který obsahuje hlavní skript kódu k analitické aproximaci. Z tohoto skriptu jsou volány dále popisované funkce. Skript je interaktivní a dovoluje hrát si s řádem polynomu resp. s hodnotou regularizačního členu a přímo sledovat tuto změnu na vykreslených grafech.


```
Polynomial_regression_analytically
```

tato funkce zajišťuje nejdůležitější část kódu, a sice samotný výpočet aproximace analytickou metodou. Celý postup je ve funkci podrobně vysvětlen. 

```
Polynomial_evaluation
```

tato funkce v podstatě jen substituuje klasický polyval. Prostě spočítá podle určité aproximace výstupní body. 

```
Least_squares_method
```

Metoda pro výpočet nejmenších čtverců. Vstpní parametry jsou dva vektory, mezi kterými se kvadratické odchylky na druhou počítají. 

```
Regression_gradient_method
```

který obsahuje hlavní skript kódu k aproximaci pomocí gradientních metod. Z tohoto skriptu jsou volány dále popisované funkce. Skript je interaktivní a dovoluje hrát si s řádem polynomu resp. s hodnotou regularizačního členu a přímo sledovat tuto změnu na vykreslených grafech.

```
Batch_gradient_decent
```

tato funkce zajišťuje výpočet aprroximace gradientní metodou. Přesněji metodou konvugovaných gradientů.

```
Batch_gradient_decent_symbolic
```

tato funkce zajišťuje výpočet aprroximace gradientní metodou. Jedná se o čistou metodu největšího spádu. Jsou zde využity symbolické proměnné pro práci s gradientem.

```
BGD_detail
```

tento skript demonstruje výpočet aprroximace gradientní metodou. Je velmi detailně popsaný na příkladech optimalizace na základě jendoho parametru, následně dvou parametrů a nakonec M parametrů. Jedná se o čistou metodu největšího spádu. Jsou zde využity symbolické proměnné pro práci s gradientem. Až si budu chtít osvěžit znalosti gradientních metod, tohle je určitě lepší volba, než funkce "Batch_gradient_decent_symbolic" nebo "Batch_gradient_decent".



Structure:

--- Deep learning methods (folder)

        |--- Linear_equations
        |
        |--- Polynomial_evaluetion

        |

        |--- Last_squares_method

        |

        |--- Regression_analytically

        |       |

        |       |--- Polynomial_regression_analytically

        |

        |--- Regression_gradient_method

        |       |

        |       |--- Batch_gradient_decent 

        |

        |--- Batch_gradient_decent_symbolic

        |--- BGD_detail

        |--- BDG_moment
        
        
        


