function [rX, ry, rXval, ryval] = ...
    randomExamples(X, y, Xval, yval, count)

% Number of training examples
m = size(X, 1);
mval = size(Xval, 1);

if count>=m
    rX = X;
    ry = y;
else 
    rX = zeros(count,size(X,2));
    ry = zeros(count,1);
    randv = randperm(m);
    for i=1:count
        rX(i,:) = X(randv(i),:);
        ry(i) = y(randv(i));
    end
end


if count>=mval
    rXval = Xval;
    ryval = yval;
else 
    rXval = zeros(count,size(Xval,2));
    ryval = zeros(count,1);
    randv = randperm(mval);
    for i=1:count
        rXval(i,:) = Xval(randv(i),:);
        ryval(i) = yval(randv(i));
    end
end


% -------------------------------------------------------------

% =========================================================================

end
