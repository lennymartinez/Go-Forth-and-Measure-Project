% Error calculations
close all; clear all;
syms x;

% Babolat Fit
f1(x)= 296*x^2 + 3*x + 43;
% Head Fit
f2(x)= 756*x^2 + -188*x + 141;
% Prince Fit
f3(x)= 854*x^2 + -205.2*x + 211;

t = linspace(-.74,.74);

y_pre = double([min(f1(t)) min(f2(t)) min(f3(t))]);
y = y_pre.*1.10;
a = [296.7 756 854];
b = [3.791 -188 -205];
c = [43.04 141 211];
X1 = [];
X2 = [];
A = [];
for n=1:3
    dis = double(sqrt(b(n)^2 + (4*a(n)*y(n)) -(4*a(n)*c(n))));
    x1 = (-b(n)- dis)/(2*a(n));
    x2 = (-b(n)+ dis)/(2*a(n));

    dc1 = 1 / dis;
    db1 = (-b(n) + dis)/(2*a(n)*sqrt(4*a(n)*c(n)));
    da1 = - ((-dis - b(n))/(2*a(n)^2)) - ((4*y(n) - 4*c(n))/(4*a(n)*dis));

    da2 = ((4*y(n) - 4*c(n))/(4*a(n)*dis)) - ( (dis-b(n))/(2*a(n)^2));
    db2 = -((dis - b(n))/(2*a(n)*dis));
    dc2 = -(1/dis);

    x1 = double(x1);
    x2 = double(x2);
    da1 = double(da1);
    da2 = double(da2);
    db1 = double(db1);
    db2 = double(db2);
    dc1 = double(dc1);
    dc2 = double(dc2);
    X1 = [X1; x1];
    X2 = [X2; x2];
    ux1 = sqrt( (da1.*a(n))^2 + (db1.*b(n))^2 + (dc1.*c(n))^2 );
    ux2 = sqrt( (da2.*a(n))^2 + (db2.*b(n))^2 + (dc2.*c(n))^2 ); 
    DeltaX = x2 - x1;
    Ux = sqrt( (ux1*x1)^2 + (ux2*x2)^2);

    Result = [DeltaX Ux].*100;
    A = [A;Result];
end
