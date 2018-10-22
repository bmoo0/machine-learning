function quadraticCurveRegression() 
    A = 1.6;
    B = 2.5;
    C = 6;
    x = linspace(-4,6,100)
    
    y = A .* (x.^2) + B .* x + C + (5 .* randn(1,100));
    
    figure;
    hold on
    plot(x,y,'bo-');
    
    
    
end