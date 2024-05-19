N_0=10;      % pocetni broj jedinki u populaciji
n=0.34;     % stopa nataliteta
m=0.12;     % stopa mortaliteta
K=250;      % maksimalni broj jedinki
t_0=0;       % pocetno t_0
tmax=100;   % kraj intervala
h=0.1;      % korak

% konstantan procenat e_1/e_2/e_3 postojecih pasa
e_1=0.36;
e_2=0.25;
e_3=0.14;

prirastaj=n-m;      % stopa prirastaja
r = prirastaj;      % r=p(0)
i=1;
A = 2;
for t=t_0:h:tmax
    N1(i) = b(r,e_1)/(2*r/K) - (p(K,r,e_1,A) + (2*r/K*N_0-b(r,e_1)-2*r/K*p(K,r,e_1,A)) / (2*r/K-b(r,e_1)+2*r/K*N_0) *p(K,r,e_1,A)*exp(-2*r/K*p(K,r,e_1,A)*t) ) / (1 - (2*r/K*N_0-b(r,e_1)-2*r/K*p(K,r,e_1,A)) / (2*r/K -b(r,e_1)+2*r/K*N_0) *exp(-2*r/K*p(K,r,e_1,A)*t));
    N2(i) = b(r,e_2)/(2*r/K) - (p(K,r,e_2,A) + (2*r/K*N_0-b(r,e_2)-2*r/K*p(K,r,e_2,A)) / (2*r/K-b(r,e_2)+2*r/K*N_0) *p(K,r,e_2,A)*exp(-2*r/K*p(K,r,e_2,A)*t) ) / (1 - (2*r/K*N_0-b(r,e_2)-2*r/K*p(K,r,e_2,A)) / (2*r/K -b(r,e_2)+2*r/K*N_0) *exp(-2*r/K*p(K,r,e_2,A)*t));
    N3(i) = b(r,e_3)/(2*r/K) - (p(K,r,e_3,A) + (2*r/K*N_0-b(r,e_3)-2*r/K*p(K,r,e_3,A)) / (2*r/K-b(r,e_3)+2*r/K*N_0) *p(K,r,e_3,A)*exp(-2*r/K*p(K,r,e_3,A)*t) ) / (1 - (2*r/K*N_0-b(r,e_3)-2*r/K*p(K,r,e_3,A)) / (2*r/K -b(r,e_3)+2*r/K*N_0) *exp(-2*r/K*p(K,r,e_3,A)*t));
    i=i+1;
end
t=t_0:h:tmax;

disp('Za e=0.36, broj pasa nakon');
disp(tmax)
disp('godina je:')
disp(N1(end))

disp('Za e=0.25, broj pasa nakon')
disp(tmax)
disp('godina je:')
disp(N2(end))

disp('Za e=0.14, broj pasa nakon')
disp(tmax)
disp('godina je:')
disp(N3(end))

hold on
plot(t,N1);
plot(t,N2);
plot(t,N3);
xlabel ('Vreme')
ylabel('Broj jedinki')
legend('e=0.36','e=0.25','e=0.14')
hold off

function rezultat = b(r,e)
    rezultat = r-e;
end

function rezultat = p(k,r,e,A)
    rezultat = sqrt(k*(k*r*r-2*r*e*k-e*e*k+4*r*A)/(4*r*r));
end
