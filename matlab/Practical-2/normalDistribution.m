function normalDistribution(n)
    data = randn(1,n);
    
    disp(size(data));
    
    figure(1);
    hold on
    
    title('Normal Distribution Histogram');
    histogram(data,200);
    xlabel('Data Point Number');
    ylabel('Data Point Occurences');
    
    
    figure(2);
    plot(data,'bo');
    title('Raw plot of Normal Distribution');
    xlabel('Data Point Number');
    ylabel('Data Point Value');
end