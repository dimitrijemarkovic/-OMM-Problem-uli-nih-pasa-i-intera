N_0=10;      % pocetni broj jedinki u populaciji
n=0.34;     % stopa nataliteta
m=0.12;     % stopa mortaliteta
K=250;      % maksimalni broj jedinki
t0=0;       % pocetno t0
tmax=100;   % kraj intervala
h=0.1;      % korak

% konstantan procenat e_1/e_2/e_3 postojecih pasa
e_1=0.36;
e_2=0.25;
e_3=0.14;

p=n-m;      % stopa prirastaja
r = p;      % r=p(0)
i=1;

for t=t0:h:tmax
    N_1(i)=K*(r-e_1)/(r+(K*(r-e_1)/N_0-r)*exp((e_1-r)*t));
    N_2(i)=K*(r-e_2)/(r+(K*(r-e_2)/N_0-r)*exp((e_2-r)*t));
    N_3(i)=K*(r-e_3)/(r+(K*(r-e_3)/N_0-r)*exp((e_3-r)*t));
    i=i+1;
end
t=t0:h:tmax;

disp('Za e=0.36, broj pasa nakon');
disp(tmax)
disp('godina je:')
disp(N_1(end))

disp('Za e=0.25, broj pasa nakon')
disp(tmax)
disp('godina je:')
disp(N_2(end))

disp('Za e=0.14, broj pasa nakon')
disp(tmax)
disp('godina je:')
disp(N_3(end))

index = 0;
for i = 1:numel(N_1)
  if N_1(i) < 1
    index = i;
    break;
  end
end

disp('Za e_1 nula se dostize posle:')
disp(t(index))
disp('godina')

index = 0;
for i = 1:numel(N_2)
  if N_2(i) < 1
    index = i;
    break;
  end
end

t=t0:h:tmax;
disp('Za e_2 nula se dostize posle:')
disp(t(index))
disp('godina')

hold on
plot(t,N_1);
plot(t,N_2);
plot(t,N_3);
xlabel ('Vreme')
ylabel('Broj jedinki')
legend('e=0.36','e=0.25','e=0.14')
hold off
