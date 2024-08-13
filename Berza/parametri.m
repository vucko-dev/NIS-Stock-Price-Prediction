n = 10;
velicina = size(tabela.Cena);
velicina = velicina(1,1);

ulazi = zeros(7, velicina-n);
izlazi = zeros(2, velicina -n);

cijena = tabela.Cena;
promena = tabela.Promena;
open = tabela.Open;
max_cijena = tabela.Max;
min_cijena = tabela.Min;

lowest_low_in_10days = zeros(1,velicina);
highest_high_in_10days = zeros(1,velicina);


% 4.
for i = 1:velicina-n-1
    LL = min(min_cijena(i+1:i+n-1));
    HH = max(max_cijena(i+1:i+n-1));
    ulazi(4,i) = (cijena(i+1) - LL)/(HH-LL) * 100;
end


for i = 1:velicina-n-1

    %Izlazi
    izlazi(1, i) = min(min_cijena(i+1:i+5));
    izlazi(2, i) = max(max_cijena(i+1:i+5));

    % 1.
    ulazi(1,i) = mean(cijena(i+1:i+n));

    % 2.
    sum_of_weights = sum(1:n);
    weighted_sum = 0;
    for j=1:n
        if isnan(cijena(i+j))
            continue;
        end
        weighted_sum = weighted_sum + ((n-j+1) * cijena(i+j));
    end
    ulazi(2,i) = weighted_sum / sum_of_weights;

    % 3.
    ulazi(3,i) = cijena(i+1) - cijena(i+1+n);
    if isnan(ulazi(3,i))
        ulazi(3,i) = 0;
    end

    % 5.
    if i+n-1<=velicina-n-1
        ulazi(5,i) = mean(ulazi(4,i+1:i+n));
    end

    % 6.     
    ulazi(6,i) = calculateRSI(max_cijena(i:i+n), min_cijena(i:i+n), cijena(i:i+n), n);

    % 7.
    ulazi(7,i) = ((max(max_cijena(i+1:i+10)) - cijena(i+1))/(max(max_cijena(i+1:i+10))-min(min_cijena(i+1:i+10))))*100;
end
