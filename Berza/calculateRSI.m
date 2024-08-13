
%Sa ChatGPTa
function rsi = calculateRSI(high_price, low_price, closing_price, period)
    % Check if the length of the price arrays are equal
    if length(high_price) ~= length(low_price) || length(low_price) ~= length(closing_price)
        error('Price arrays must be of the same length');
    end
    
    % Initialize variables
    n = length(closing_price);
    
    % Check if we have enough data
    if n < period
        error('Not enough data points to calculate RSI for the given period');
    end
    
    % Calculate daily price changes
    delta = diff(closing_price);
    
    % Separate gains and losses
    gains = max(delta, 0);
    losses = abs(min(delta, 0));
    
    % Calculate the initial average gain and loss
    avgGain = mean(gains(1:period));
    avgLoss = mean(losses(1:period));
    
    % Calculate the average gain and loss for the remaining periods
    for i = period+1:n-1
        avgGain = (avgGain * (period-1) + gains(i)) / period;
        avgLoss = (avgLoss * (period-1) + losses(i)) / period;
    end
    
    % Calculate the RS and RSI for the most recent period
    rs = avgGain / avgLoss;
    rsi = 100 - (100 / (1 + rs));
end

