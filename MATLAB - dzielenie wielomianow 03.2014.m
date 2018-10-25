function [a] = pier01(zz)
clear
a=input('podaj stopien pierwszego wielomianu ')
a=a+1;
A=zeros(2,a);
b=1;
while b<=a
    c=input('wklepuj wspolczynniki przy potegach iksa od najwyzszej do najnizszej ')
    A(1,b)=c;
    A(2,b)=a-b;
    b=b+1;
end
disp('twoj wielomian wyglada tak')
disp('u gory wspolczynniki na dole potegi iksa')
A
d=input('podaj stopien wielomianu przez ktory bedziemy dzielic pierwszy wielomian ')
d=d+1;
B=zeros(2,d);
e=1;
while e<=d
    f=input('wklepuj wspolczynniki przy potegach iksa od najwyzszej do najnizszej ')
    B(1,e)=f;
    B(2,e)=d-e;
    e=e+1;
end
disp('twoj wielomian wyglada tak')
disp('u gory wspolczynniki na dole potegi iksa')
B
disp('sprawdz czy dobrze wpisales')
z=input('podaj rozmiar pierscienia ');

g=a-d+1;
C=zeros(2,g);
m=1;
while m<=g
  p=0;
  while p<=z
      r=p*B(1,1)-floor(p*B(1,1)/z)*z
      if r==A(1,m)
          C(1,m)=p;
          p=z+1;
      else
          p=p+1;
      end
  end
  %C(1,m)=A(1,m)/B(1,1);
  k=1;
  while k<=d
      A(1,k+m-1)=A(1,k+m-1)-C(1,m)*B(1,k);
      if A(1,k+m-1)>z
         A(1,k+m-1)=A(1,k+m-1)-floor(A(1,k+m-1)/z)*z;
      elseif A(1,k+m-1)<0
         A(1,k+m-1)=A(1,k+m-1)-floor(A(1,k+m-1)/z)*z;
      else
      end
      k=k+1;
  end
  m=m+1;
end
n=1;
while n<=g
    C(2,n)=g-n;
    n=n+1;
end
disp('wynik dzielenia')
C
disp('reszta dzielenia')
A
zz=input('');