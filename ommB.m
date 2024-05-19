function modelB()

A = 2;    % A je broj napustenih pasa (po km2) koji postaju ulicni psi

K=250;     % maksimalni broj jedinki
n=0.34;    % stopa nataliteta
m=0.12;    % stopa mortaliteta
p=n-m;     % stopa prirastaja
r=p;       % r=p(0)
N_0=20;

% konstantan procenat e_1/e_2/e_3 postojecih pasa
e_1=0.36;
e_2=0.25;
e_3=0.14;

% Koliko pasa ima nakon t=100 godina?
tend=100;
[t_1,x_1]=ode45(@(t,x) x*r*(1-x/K)-e_1*x+A,[0,tend],N_0);
disp('Za e=0.36, nakon');
t_1end = t_1(end);
disp(t_1end);
disp('godina ima ovoliko pasa:');
x_1end = x_1(end);
disp(x_1end);

[t_2,x_2]=ode45(@(t,x) x*r*(1-x/K)-e_2*x+A,[0,tend],N_0);
disp('Za e=0.25, nakon');
t_2end = t_2(end);
disp(t_2end)
disp('godina ima ovoliko pasa:');
x_2end = x_2(end);
disp(x_2end)

[t_3,x_3]=ode45(@(t,x) x*r*(1-x/K)-e_3*x+A,[0,tend],N_0);
disp('Za e=0.14, nakon')
t_3end = t_3(end);
disp(t_3end)
disp('godina ima ovoliko pasa:');
x_3end = x_3(end);
disp(x_3end);

figure(1)
hold on
plot(t_1,x_1)
plot(t_2,x_2)
plot(t_3,x_3)
legend('e=0.36','e=0.25','e=0.14')
hold off
end
