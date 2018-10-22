function centralLimitTheorem(n)
    data = rand(n,n);
    
    M = mean(data,2);

    disp(size(data));


    figure(1);
    hold on
    
    title('Mean over many datapoints');
    histogram(M,800);
    xlabel('Data Point Number');
    ylabel('Data Point Occurences');
    
    
    figure(2);
    plot(M,'b');
    title('Raw plot of Mean');
    xlabel('Data Point Number');
    ylabel('Data Point Value');
end