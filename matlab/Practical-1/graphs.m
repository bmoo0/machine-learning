function graphs()
    timeMax = 2;
    deltaT = 0.01;
    t = 0:deltaT:timeMax;
    
    size(t')
    
    f = 1.7;
    amplitude = 10;
    dataSin = amplitude * sin(2*pi*f*t);
    dataCos = amplitude * cos(2*pi*f*t);
    
    dataSin(1:10);  
    
    figure
    hold on
    
    h=plot(dataCos, dataSin,'bo-');
    
end