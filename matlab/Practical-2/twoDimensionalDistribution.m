function twoDimensionalDistribution(n)
    data = randn(2,n);
    
    disp(size(data));
    %disp("Mean");
    %disp(mean(data));
    %disp("Covariance");
    %disp(cov(data));
        
    figure;
    hold on
    
    plot(data(1,:),data(2,:),'bo');
    title('Uniform 2-D Raw Data Plot');
    xlabel('x-value');
    ylabel('y-value');
end