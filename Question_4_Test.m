% ________________________________________________________________________________________
% ¦¦¦¦¦¦¦¦¦¦¦-------              QUESTION 4 - Test                      -------¦¦¦¦¦¦¦¦¦¦
% ________________________________________________________________________________________

% standard test case - should return x=2 and err close to 0
X = 16;
n = 4;
x_1 = 1.5;

fprintf('Question 4 Test:\nX=16\nn=4\nx_1=1.5\n\n');
[x, err] = Question_4(X, n, x_1);
disp(x);
disp(err);

% negative X value test case - should return x=0 and err=-1
X = -1;
n = 1;
x_1 = 1;

fprintf('Question 4 Test:\nX=-1\nn=1\nx_1=1\n\n');
[x, err] = Question_4(X, n, x_1);
disp(x);
disp(err);

% infinite X value test case - should return x=inf and err=inf
X = inf;
n = 2; 
x_1 = 999;
fprintf('Question 4 Test:\nX=inf\nn=2\nx_1=999\n\n');
[x, err] = Question_4(X, n, x_1);
disp(x);
disp(err);

% Largest double X value test case - should return x=3.34e154 and err close to 0
X = realmax;
n = 2; 
x_1 = sqrt(realmax)+99999;
fprintf('Question 4 Test:\nX=realmax\nn=2\nx_1=%e\n\n', x_1);
[x, err] = Question_4(X, n, x_1);
disp(x);
disp(err);