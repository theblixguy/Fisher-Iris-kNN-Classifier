% getKNeighbours.m
%
% Return k most similar neighbours from the training set for a provided
% test data instance.
% Input:
% tset = training set (as table)
% tinst = test data instance (as table row)
% k = value of k
% Output:
% result = k-most similar neighbours (as table)

function result = getKNeighbours(tset, tinst, k)
    dists = {};
    neighbours = table;
    for x = 1:height(tset)
        dist = getDistance(tinst, tset(x,:));
        dists = [dists; {tset(x,:), dist}];
    end
    dists = sortrows(dists, 2);
    
    for x = 1:k
        neighbours = [neighbours; dists(x,1)];
    end
    result = neighbours;
end