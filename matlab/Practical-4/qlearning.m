function qlearning()
    qTable = initQ();
    plotQtable(qTable)
    GreedyActionSelection(qTable,1,0)
end

% states [1..11]
% moves north 1, east 2, south 3, west 4

function state = startingState()
    state = 2;
    while (state == 2)
        state = randi([1,11]);
    end
end

function newState = transition(state, move)
    if (state == 1 && move == 1 )
        newState = 4;
    elseif (state == 1)
        newState = 1;
    elseif (state == 4 && move == 1)
        newState = 7;
    elseif (state == 4 && move == 3)
        newState = 1;
    elseif (state == 4)
        newState = 4;
    elseif (state == 7 && move == 2)
        newState = 8;
    elseif (state == 7 && move == 3)
        newState = 4;
    elseif (state == 7)
        newState = 7;
    elseif (state == 8 && move == 2)
        newState = 9;
    elseif (state == 8 && move == 4)
        newState = 7;
    elseif (state == 9 && move == 3)
        newState = 5;
    elseif (state == 9 && move == 2)
        newState = 10;
    elseif (state == 9 && move == 4)
        newState = 8;
    elseif (state == 9)
        newState = 9;
    elseif (state == 5 && move == 1)
        newState = 9;
    elseif (state == 5 && move == 3)
        newState = 2; % The goal state!
    elseif (state == 5)
        newState = 5;
    elseif (state == 2)
        newState = 2; % You're already at the goal 
    elseif (state == 10 && move == 2)
        newState = 11;
    elseif (state == 10 && move == 4)
        newState = 9;
    elseif (state == 11 && move == 3)
        newState = 6;
    elseif (state == 11 && move == 2)
        newState = 10;
    elseif (state == 11)
        newState = 11;
    elseif (state == 6 && move == 1)
        newState = 11;
    elseif (state == 6 && move == 3)
        newState = 3;
    elseif (state == 6)
        newState = 6;
    elseif (state == 3 && move == 1)
        newState = 6;
    elseif (state == 3)
        newState = 3;
    end
end

function r = reward(state, action)
    if (state == 5 && action == 3)
        r = 10;
    else
        r = 0;
    end
end

function qvals = initQ()
    upper = 0.1;
    lower = 0.01;
    range = upper - lower;
    mean = (upper + lower) / 2;
    
    qvals = range * (rand(11,4) - 0.5) + mean; 
end

function prob = greedyProbability()
    upper = 1;
    lower = 0;
    range = 1;
    mean = 0.5
    range * rand(1,1) + mean;
end

function action = GreedyActionSelection(qtable, state, e)
    % given a qtable and state return the action with the best qval
    % remaining e% of the time pick a random function
    
    % greedy part
    if (prob >= e) 
        action = max(qtable(state,:));
    else
        % pick a random value
        action = randi([1,4]);
    end
end

function action = actionSelect(qtable, state)
    action = reward(state, 1) + max(qtable);
end 

function plotQtable(qvals)
    figure
    hold on
    title('Q function table values')
    surf(qvals);
    xlabel('Action');
    ylabel('States');
    zlabel('Q value');
    axis([ 1 4 1 11 0 1])
    view([35 45]);
end