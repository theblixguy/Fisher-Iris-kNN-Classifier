% initDatasetsRandom.m
%
% Load and split main dataset randomly into a training set and testing set.
% Input:
% filename = dataset CSV file name (as char vector)
% format = dataset CSV column format (as char vector)
% Output:
% dset_train = training dataset (as table)
% dset_test = testing dataset (as table)

function [dset_train, dset_test] = initDatasetsRandom(filename, format, split)
    dset = readtable(filename,'Delimiter',',','HeaderLines',0,'ReadVariableNames',false,'Format',format);
    ranRows = randperm(height(dset));
    dset_train = dset(ranRows(1:round(split*height(dset))), :);
    dset_test = dset(ranRows(round(split*height(dset))+1:end), :);
end