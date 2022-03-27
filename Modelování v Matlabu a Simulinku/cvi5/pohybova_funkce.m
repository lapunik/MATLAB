function vektor_velicin_derivace = pohybova_funkce(t,vektor_velicin) 
    g = 9.8;
    
    vektor_velicin_derivace(1) = vektor_velicin(3);
    vektor_velicin_derivace(2) = vektor_velicin(4);
    vektor_velicin_derivace(3) = vektor_velicin(5);
    vektor_velicin_derivace(4) = vektor_velicin(6);
    vektor_velicin_derivace(5) = 0;     
    vektor_velicin_derivace(6) = -g;
         
    if(vektor_velicin(2) < 0) % pokud jsi na zemi stuj
        vektor_velicin_derivace(1) = 0;
        vektor_velicin_derivace(2) = 0;
        vektor_velicin_derivace(3) = 0;
        vektor_velicin_derivace(4) = 0;
        vektor_velicin_derivace(5) = 0;
        vektor_velicin_derivace(6) = 0;
    end
end