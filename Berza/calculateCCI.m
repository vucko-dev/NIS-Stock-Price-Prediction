function cciValue = calculateCCI(high, low, close, currentIndex, period)
    if currentIndex < period
        cciValue = NaN; % Not enough data points to calculate CCI
    else
        typicalPrice = (high(currentIndex-period+1:currentIndex) + low(currentIndex-period+1:currentIndex) + close(currentIndex-period+1:currentIndex)) / 3;
        sma = mean(typicalPrice);
        meanDeviation = mean(abs(typicalPrice - sma));
        cciValue = (typicalPrice(end) - sma) / (0.015 * meanDeviation);
    end
end
