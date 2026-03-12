% ________________________________________________________________________________________
% ¦¦¦¦¦¦¦¦¦¦¦-------                  QUESTION 4                         -------¦¦¦¦¦¦¦¦¦¦
% ________________________________________________________________________________________
function [x, err] = Question_4(X, n, x_1)
    % validate inputs
    if X <= 0 || n <= 0 || x_1 <= 0
        x=0;
        err=-1;
        return
    else
        x_i = x_1;
        err = inf;
    end

    % calculate the error
    function err = calculate_error(x_i, x_i1)
        err = abs(x_i1 - x_i);
    end

    % calciulate x_i+1
    function x_i1 = calculate_x_i1(x_i, X, n)
        x_i1 = (n-1)/n * x_i + X/(n*x_i^(n-1));
    end

    while err > 1e-6
        x_i1 = calculate_x_i1(x_i, X, n);
        err = calculate_error(x_i, x_i1);
        x_i = x_i1;
    end
    x = x_i;

end