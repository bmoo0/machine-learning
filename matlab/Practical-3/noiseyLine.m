function noiseyLine()
    x = linspace(-4,6,100)
    m = 1.6
    C = 6
    y = m * x + C + randn(1,100)

    figure;
    hold on
    h = plot(x,y,'bo-')
end