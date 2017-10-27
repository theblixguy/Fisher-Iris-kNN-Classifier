% initDatasets.m
%
% Load training set and testing sets.
% Input:
% train_filename = training set CSV file name (as char vector)
% test_filename = testing set CSV file name (as char vector)
% format = dataset CSV column format (as char vector)
% Output:
% dset_train = training set (as table)
% dset_test = testing set (as table)

function [dset_train, dset_test] = initDatasets(train_filename, test_filename, format)
    dset_train = readtable(train_filename,'Delimiter',',','HeaderLines',0,'ReadVariableNames',false,'Format',format);
    dset_test = readtable(test_filename,'Delimiter',',','HeaderLines',0,'ReadVariableNames',false,'Format',format);
end