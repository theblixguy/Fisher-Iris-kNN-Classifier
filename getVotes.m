% getVotes.m
%
% Return the most voted class by the neighbours. Let each neighbour
% vote for their class and pick the most voted one as the prediction!
% Input:
% neighbours = k neighbours returned by getKNeighbours()
% Output:
% result = most voted class and vote count (as table row)

function result = getVotes(neighbours)
    sortedTable = table;
    classificationVotes = containers.Map('KeyType','char','ValueType','int32');
    for x = 1:height(neighbours)
        response = neighbours(x,:).(1).(5){1};
        if isKey(classificationVotes, response)
            curValue = classificationVotes(response);
            curValue = curValue + 1;
            classificationVotes(response) = curValue;
        else
            classificationVotes(response) = 1;
        end
    end
    keys = classificationVotes.keys;
    for k = keys
        sortedTable = [sortedTable; table(k, classificationVotes(k{1}))]; 
    end
    sortedTable = sortrows(sortedTable, -2);
    result = sortedTable(1,:);
end

