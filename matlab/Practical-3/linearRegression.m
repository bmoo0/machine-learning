function linearRegression() 
    X = linspace(-4,6,100)
    W = rand(1,100)
    m = 1.6
    C = 6
    Y = m * X + C + randn(1,100)

    figure(1);
    hold on
    h = plot(X,Y,'bo-');
    
    figure(2);
    Mest= rand();
    Cest = rand();
    
    cycles = 100;
    alpha = 0.001;
    for cidx = 1:cycles
        dedm = errorGradientM(X, Y, Mest, Cest);
        dedc = errorGradientC(X, Y, Mest, Cest);
        Mest = Mest - alpha * dedm;
        Cest = Cest - alpha * dedc;
        
        error(cidx) = sum( (Y - (Mest * X + Cest)).^2);
    end
    
    Y = Mest * X + Cest;
    
    plot(X,Y,'bo-');
    figure(3);
    plot(error,'ro-');
end

function result = errorGradientM(x, y, m ,c)
    result = -2 * sum(x .* (y-(m * x + c)));
end

function result = errorGradientC(x,y,m,c)
    result = -2 * sum(y- (m * x + c));
end

function result = error(x,y,m,c)
    result = sum( (y - (m * x + c)).^2);
end

