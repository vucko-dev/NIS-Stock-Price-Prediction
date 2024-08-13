function izlazi_za_model = izlazi_funkcija(cena_ulazi, max_cijena_ulazi, min_cijena_ulazi, ulazi)
    izlazi_za_model = zeros(7, 1);
    LL = min(min_cijena_ulazi(1:10));
    HH = max(max_cijena_ulazi(1:10));

    izlazi_za_model(1) = mean(cena_ulazi(1:10));
    
    suma = sum(1:10);
    suma2 = 0;
    for j = 1:10
        if isnan(cena_ulazi(j))
            continue;
        end
        suma2 = suma2 + ((10 - j + 1) * cena_ulazi(j));
    end
    izlazi_za_model(2) = suma2 / suma;

    izlazi_za_model(3) = cena_ulazi(1) - cena_ulazi(10);

    izlazi_za_model(4) = (cena_ulazi(1) - LL) / (HH - LL) * 100;

    suma = sum(ulazi(4,1:9));
    suma = suma + izlazi_za_model(4);
    izlazi_za_model(5) = suma/10;

    izlazi_za_model(6) = calculateRSI(max_cijena_ulazi(1:10), min_cijena_ulazi(1:10), cena_ulazi(1:10), 9);

    izlazi_za_model(7) = ((max(max_cijena_ulazi(1:10)) - cena_ulazi(1))/(max(max_cijena_ulazi(1:10))-min(min_cijena_ulazi(1:10))))*100;

end

