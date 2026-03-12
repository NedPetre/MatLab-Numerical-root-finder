% ________________________________________________________________________________________
% ¦¦¦¦¦¦¦¦¦¦¦-------                  QUESTION 1                         -------¦¦¦¦¦¦¦¦¦¦
% ________________________________________________________________________________________

prompt = 'Enter your Student number: ';
disp(prompt);
% ask user for student num
while true
    StudentNumber = input("--", 's');
    if length(StudentNumber) == 7 && all(isstrprop(StudentNumber, 'digit'))
        prompt = 'Thank you for entering your Student number';
        disp(prompt);
        break;
    else
        prompt = 'The entered Student number is not valid.\nPlease enter a valid Student number: ';
        fprintf(prompt);
    
    end
end
% validate input


% =======================================================================================
% part a
% =======================================================================================
ID = SplitInput(StudentNumber);
disp('Part a: ')
disp(ID)

function ID = SplitInput(StudentNumber)
    a = str2double(StudentNumber(1));
    b = str2double(StudentNumber(2));
    c = str2double(StudentNumber(3));
    d = str2double(StudentNumber(4));
    e = str2double(StudentNumber(5));
    f = str2double(StudentNumber(6));
    g = str2double(StudentNumber(7));
    ID = [a, b, c, d, e, f, g];
end
% ======================================================================================
% part b
% ======================================================================================
Partb = max(ID);
% uses max function to find the maximum value in the ID array
disp('Part b: ')
disp(Partb);

% ======================================================================================
% part c
% ======================================================================================
number = 10*ID(2) + ID(3);
% create the number "2 3"
number = sind(number);
% calulate sine of the number "2 3" in degrees
Partc = number;
disp('Part c: ')
disp(Partc)

% ======================================================================================
% part d
% ======================================================================================
number = ID(1)^ID(2);
number = number/Partb;
number2 = 10*ID(5) + ID(4);
number = number*number2;
Partd = number;
disp('Part d: ')
disp(Partd)

% ======================================================================================
% part e
% ======================================================================================
Parte = ID;
for i = 1:length(ID)
    if ID(i) <= 5
        Parte(i) = false;
    else
        Parte(i) = true;
    end
end
disp('Part e: ')
disp(Parte)

% ======================================================================================
% part f
% ======================================================================================
partf = arrayfun(@(x) x^3, ID);
disp('Part f: ')
disp(partf)

% ======================================================================================
% part g
% ======================================================================================
Partg = ID*10.^(length(ID)-1:-1:0)';
disp('Part g: ')
disp(Partg)


% ________________________________________________________________________________________
% ¦¦¦¦¦¦¦¦¦¦¦-------                  QUESTION 2                         -------¦¦¦¦¦¦¦¦¦¦
% ________________________________________________________________________________________

A_inlet = 0.01;%m^2
A_neck = A_inlet/2;%m^2
Rho = 1000;%kg/m^3
U_inlet = 1;%m/s

% Q and rho are constant => A1*U1 = A2*U2 => U2 = A1*U1/A2
U_neck = A_inlet*U_inlet/A_neck;%m/s

% Bernoulli's equation: P1 + 0.5*rho*U1^2 = P2 + 0.5*rho*U2^2
% => P2 - P1 = 0.5*rho*(U1^2 - U2^2)
% => P2 - P1 = DeltaP = Part a
DeltaP = 0.5*Rho*(U_inlet^2 - U_neck^2);%Pa
disp('Delta P: ')
disp(DeltaP)

x = linspace(0, 0.1, 500);%m

r = 0.05 * sqrt((3+cos(10*pi*x)/pi));
A_x = pi*r.^2;
U_x = A_inlet*U_inlet./A_x;

P_inlet = 101325;%Pa

P_x = P_inlet + 0.5*Rho*(U_inlet^2 - U_x.^2);

figure('Name', 'Question 2');
plot(x, P_x/1000, "LineWidth", 2);
xlabel('x (m)');
ylabel('Pressure (kPa)');
title('Pressure vs distance along Venturi tube')
grid on

% ________________________________________________________________________________________
% ¦¦¦¦¦¦¦¦¦¦¦-------                  QUESTION 3                         -------¦¦¦¦¦¦¦¦¦¦
% ________________________________________________________________________________________

L = 1;
n = 11;
dX = L/(n-1);

A = zeros(n, n);
b = zeros(n, 1);

A(1, 1) = 1;
b(1) = 0;

for i = 2:n-1

    kw = 1/((i-1.5)*dX+1);
    ke = 1/((i-0.5)*dX+1);

    A(i,i-1) = -kw/dX.^2;
    A(i,i) = (kw+ke)/dX.^2;
    A(i,i+1) = -ke/dX^2;
    
end

A(n, n) = 1;
A(n,n-1) = -1;
b(n) = 10*dX;

T=A\b;

x=linspace(0, L, n);

T_a = 2.5*(x.^2 + 2*x);

figure('Name', 'Question 3');
plot(x, T, 'o-', 'LineWidth', 2, 'DisplayName', 'Numerical Solution');
hold on 
plot(x, T_a, 'r--', 'LineWidth', 2, 'DisplayName', 'Analytical Solution');
xlabel('x (m)');
ylabel('T (°C)');
legend('Finite Difference', 'Analytical');
grid on

