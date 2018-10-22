function analyticalClosedSolution()
    cycles = 100
    x = linspace(-4,6,cycles)
    m = 1.6
    C = 6
    y = m * x + C + randn(1,cycles)

    figure(1);
    hold on
    plot(x,y,'bo-')
    
    alpha = 0.001
    
    
    Mest = rand();
    Cest = rand();
    
    for cidx = 1:cycles
        dedm = errorGradientM(x, y, Mest, Cest);
        dedc = errorGradientC(x, y, Mest, Cest);
        
        Mest = Mest - alpha * dedm;
        Cest = Cest - alpha * dedc;
    end
    
    Yest = Mest * x + Cest
    plot(x,Yest,'r');
    
    
    
    
end

function result = errorGradientM(x, y, m ,c)
    result = -2 * sum(x .* (y-(m * x + c)));
end

function result = errorGradientC(x,y,m,c)
    result = -2 * sum(y- (m * x + c));
end