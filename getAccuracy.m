% getAccuracy.m
%
% Return kNN classification accuracy as a percentage of correct
% classifications
% Input:
% tset = testing dataset (as table)
% votes = predictions (as table)
% Output:
% result = percentage of accuracy (as float)

function result = getAccuracy(tset, votes)
    rightAnswer = 0;
    for x = 1:height(tset)
        if strcmp(tset(x,:).(5){1}, votes(x,:).(1){1})
            rightAnswer = rightAnswer + 1;
        end
    end
    result = (rightAnswer/(height(tset)) * 100.0);
end
