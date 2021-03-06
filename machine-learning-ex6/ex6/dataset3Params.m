function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

v = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
count = size(v,2);
errorRes = zeros(count*count,3);

smallestError = Inf;

for i=1:count
    tempC = v(i);
    for j=1:count
        i
        j
        tempsigma = v(j);

        row = (i-1)*8+j;
        errorRes(row,1) = tempC;
        errorRes(row,2) = tempsigma;

        model= svmTrain(X, y, tempC, @(x1, x2) gaussianKernel(x1, x2, tempsigma)); 
        predictions = svmPredict(model, Xval);
        modelError = mean(double(predictions ~= yval));

        if modelError < smallestError
            smallestError = modelError;
            C = tempC;
            sigma = tempsigma;
        end

        errorRes(row,3) = modelError;
    end
end






% =========================================================================

end
