% main.m
%
% k-Nearest Neighbour classifier by Suyash Srijan, student ID: 14076594
% This is the main script file that puts together all the peices of the kNN
% algorithm and generates predictions.

% Training set file name
train_set_filename = 'IrisData_train.csv';
% Testing set file name
test_set_filename = 'IrisData_test.csv';
% Dataset column format
dset_format = '%f %f %f %f %s';
% k value
k_val = 9;
% Training dataset table
dset_train = table;
% Testing dataset table
dset_test = table;
% Predictions table
predictions = table;
% Load datasets
disp('Loading datasets...');
[dset_train, dset_test] = initDatasets(train_set_filename, test_set_filename, dset_format);
% Compute class predictions
disp('Generating predictions...');
for x = 1:height(dset_test)
        neighbours = getKNeighbours(dset_train, dset_test(x,:), k_val);
        votes = getVotes(neighbours);
        predictions = [predictions; votes];
        disp(['Prediction: ', votes.(1){1}, ', Actual: ', dset_test(x,:).(5){1}]);
end
disp('Done generating predictions!');
% Get and print the accuracy of the model
accuracy = getAccuracy(dset_test, predictions);
fprintf('Accuracy of the model: %f\n', accuracy);