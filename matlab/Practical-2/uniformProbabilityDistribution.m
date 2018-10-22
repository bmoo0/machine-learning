function uniformProbabilityDistribution(n)
    data = rand(1,n);
    
    
    disp(size(data));
    
    figure(1);
    hold on
    
    title('Uniform Probability Distribution');
    histogram(data,1000);
    xlabel('Data Point Number');
    ylabel('Data Point Occurences');
    
    
    figure(2);
    plot(data,'b');
    title('Uniform Probability Distribution');
    xlabel('Data Point Number');
    ylabel('Data Point Value');
end