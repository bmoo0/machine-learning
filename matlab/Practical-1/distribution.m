function distribution()
    samples = 100000;
    data = randn(samples,1);
    data(1:10);
    
    figure
    hold on
    histogram(data,100);
end