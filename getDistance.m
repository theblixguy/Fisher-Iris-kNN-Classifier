% getDistance.m
%
% Return the euclidean distance between two data instances.
% Input:
% inst1 = data instance (as table row)
% inst2 = data instance (as table row)
% Output:
% result = euclidean distance between the instances (as float)

function result = getDistance(inst1, inst2)
    dist = 0;
    for x = 1:4
        dist = dist + power(inst1.(x) - inst2.(x), 2);
    end
    result = sqrt(dist);
end