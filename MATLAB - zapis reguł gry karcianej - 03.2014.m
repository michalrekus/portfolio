function P1 = tura5graczy2(A,D2,D3,D4,D5,B2,B3,B4,B5)
d=1;
B1=[];
K=[];
D1=[];
S1=zeros(1,6);
E1={'1M','2M','3M','4M','5M','10M'};
E2={'Czynsz nie-bra','Czynsz roz-pom','Czynsz cze-zol','Czynsz gra-zie','Czynsz cza-oli','Czynsz kolorowy','Mega Transakcja','Wymuszona Transakcja','Chytra Transakcja','Powiedz NIE','Bierz Kase','Urodziny','Podwojny Czynsz','Start'};
E3={'Dom','Hotel'};
E4={'DK nie-bra', 'DK nie-cza', 'DK roz-pom', 'DK cze-zol', 'DK gra-zie', 'DK zie-cza', 'DK cza-oli', 'DK kolorowa', 'D brazowa', 'D niebieska', 'D rozowa', 'D pomaranczowa', 'D czerwona', 'D zolta', 'D zielona', 'D granatowa', 'D czarna', 'D oliwkowa'};
while d<=3
   P1
   a=input('wybierz karte ktora chcesz zagrac ');
   c=P1(a);
   c1=max(strcmp(E1,c));
   c2=max(strcmp(E2,c));
   c3=max(strcmp(E3,c));
   c4=max(strcmp(E4,c));
   c5=strcmp(E4,c);
   if c1==1
       b=input('wskazana karte: 1-przenies do banku, 0-cofnij ruch ')
       if b==1
           B1=[B1 c];
           P1(a)=[];
           d=d+1;
       elseif b==0
       else
           disp('zla liczba');
       end
   elseif c2==1
       b=input('wskazana karte: 1-przenies do banku, 3-wykonaj akcje, 0-cofnij ruch')
       if b==1
           B1=[B1 c];
           P1(a)=[];
           d=d+1;
       elseif b==3
           disp('akcja')
           K=[K c];
           P1(a)=[];
           d=d+1;
           % poczatek akcji
           if strcmp(P1(a),'Start')==1
               P1=[P1 A(1:2)]
               A(1:2)=[];
           elseif strcmp(P1(a),'Podwojny Czynsz')==1
               S1(1,5)=1;
           elseif strcmp(P1(a),'Urodziny')==1
               z2=2;
               [Bz,Dz,S2,P2,B2,D2,K]=zaplata2(z2,S2,P2,B2,D2,K);
               B1=[B1 Bz];
               e=size(Dz);
               e=e(1,2);
               f=1;
               while f<=e
                   ca=Dz(f);
                   ca3=max(strcmp(E3,ca));
                   ca4=max(strcmp(E4,ca));
                   if ca3==1
                       b=input('wskazana karte: 1-przenies do banku, 2-przenies do kart dzielek, 4-potem przeniose ta karte ')
                       if b==1
                           B1=[B1 ca];
                           Dz(f)=[];
                           f=f+1;
                       elseif b==2
                           if strcmp(Dz(f),'Dom')==1
                               if S1(1,2)-S1(1,3)==1
                                   g=size(D1);
                                   h=1;
                                   while h<=g(1,2)
                                       if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                           D1(3,h)={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           h=g(1,2)+1;
                                           S1(1,3)=S1(1,3)+1;
                                       elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                           D1(4,h)={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           h=g(1,2)+1;
                                           S1(1,3)=S1(1,3)+1;
                                       else
                                           h=h+1;
                                       end
                                   end
                               elseif S1(1,2)-S1(1,3)==2
                                   F=zeros(2,2);
                                   g=size(D1);
                                   h=1;
                                   while h<=g(1,2)
                                       if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                           F(1,1)=h;
                                           F(2,1)=4;
                                           k=h;
                                           h=g(1,2)+1;
                                       elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                           F(1,1)=h;
                                           F(2,1)=5;
                                           k=h;
                                           h=g(1,2)+1;
                                       else
                                           h=h+1;
                                       end
                                   end
                                   while k<=g
                                       if ((strcmp(D1(1,k),'granatowa')==1 || strcmp(D1(1,k),'brazowa')==1) && strcmp(D1(3,k),'')==0 && strcmp(D1(4,k),'')==1)
                                           F(1,2)=k;
                                           F(2,2)=4;
                                           k=g(1,2)+1;
                                       elseif ((strcmp(D1(1,k),'niebieska')==1 || strcmp(D1(1,k),'rozowa')==1 || strcmp(D1(1,k),'pomaranczowa')==1 || strcmp(D1(1,k),'czerwona')==1 || strcmp(D1(1,k),'zolta')==1 || strcmp(D1(1,k),'zielona')==1) && strcmp(D1(4,k),'')==0 && strcmp(D1(5,k),'')==1)
                                           F(1,2)=k;
                                           F(2,2)=5;
                                           k=g(1,2)+1;
                                       else
                                           k=k+1;
                                       end
                                   end
                                   D1
                                   m=input(['masz dwie pelne dzielnice w ktorych mozesz postawic dom: w kolumnie ' num2str(F1(1,1)) ' i w kolumnie ' num2str(F1(1,2)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic dom '])
                                   if (m==F(1,1) && m~=0)
                                       D1(F(2,1),F(1,1))={'Dom'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S1(1,3)=S1(1,3)+1;
                                   elseif (m==F(1,2) && m~=0)
                                       D1(F(2,2),F(1,2))={'Dom'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S1(1,3)=S1(1,3)+1;
                                   else
                                       disp('w podanej kolumnie nie mozesz postawic domu')
                                   end
                               else
                                   disp('nie masz pelnej dzielnicy w ktorej mozesz postawic dom')
                               end
                           elseif strcmp(Dz(f),'Hotel')==1
                               if (S1(1,3)==1 && S1(1,4)==0)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   D1(g+1,h)={'Hotel'};
                                   %Dz(f)=[];
                                   f=f+1;
                                   S(1,4)=S1(1,4)+1;
                               elseif (S1(1,3)==2 && S1(1,4)==1)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   if strcmp(D1(g(1,1)+1,h(1,1)),'')==1
                                       D1(g(1,1)+1,h(1,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   elseif strcmp(D1(g(2,1)+1,h(2,1)),'')==1
                                       D1(g(2,1)+1,h(2,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   else
                                       disp('blad 149')
                                   end
                               elseif (S1(1,3)==2 && S1(1,4)==0)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   D1
                                   k=input(['masz dwie dzielnice w ktorych mozesz postawic hotel: w kolumnie ' num2str(h(1,1)) ' i w kolumnie ' num2str(h(2,1)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic hotel '])
                                   if k==h(1,1)
                                       D1(g(1,1)+1,h(1,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   elseif k==h(2,1)
                                       D1(g(2,1)+1,h(2,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   else
                                       disp('w podanej kolumnie nie mozesz postawic hotelu')
                                   end
                               else
                                   disp('nie masz dzielnicy w ktorej mozesz postawic hotel')
                               end
                           else
                               disp('blad 172')
                           end
                       elseif b==4
                           Dz(f)=[];
                           Dz=[Dz ca];
                       else
                           disp('wpisany numer nie ma przypisanego dzialania')
                       end
                   elseif ca4==1
                       % funkcja na ukladanie otrzymanej dzialki 
                       [D1,S1,f] = otrzymana1(ca,f,S1,D1);
                   else
                       disp('blad 191')
                   end
               end
               
               z3=2;
               [Bz,Dz,S3,P3,B3,D3,K]=zaplata3(z3,S3,P3,B3,D3,K);
               B1=[B1 Bz];
               e=size(Dz);
               e=e(1,2);
               f=1;
               while f<=e
                   ca=Dz(f);
                   ca3=max(strcmp(E3,ca));
                   ca4=max(strcmp(E4,ca));
                   if ca3==1
                       b=input('wskazana karte: 1-przenies do banku, 2-przenies do kart dzielek, 4-potem przeniose ta karte ')
                       if b==1
                           B1=[B1 ca];
                           Dz(f)=[];
                           f=f+1;
                       elseif b==2
                           if strcmp(Dz(f),'Dom')==1
                               if S1(1,2)-S1(1,3)==1
                                   g=size(D1);
                                   h=1;
                                   while h<=g(1,2)
                                       if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                           D1(3,h)={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           h=g(1,2)+1;
                                           S1(1,3)=S1(1,3)+1;
                                       elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                           D1(4,h)={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           h=g(1,2)+1;
                                           S1(1,3)=S1(1,3)+1;
                                       else
                                           h=h+1;
                                       end
                                   end
                               elseif S1(1,2)-S1(1,3)==2
                                   F=zeros(2,2);
                                   g=size(D1);
                                   h=1;
                                   while h<=g(1,2)
                                       if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                           F(1,1)=h;
                                           F(2,1)=4;
                                           k=h;
                                           h=g(1,2)+1;
                                       elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                           F(1,1)=h;
                                           F(2,1)=5;
                                           k=h;
                                           h=g(1,2)+1;
                                       else
                                           h=h+1;
                                       end
                                   end
                                   while k<=g
                                       if ((strcmp(D1(1,k),'granatowa')==1 || strcmp(D1(1,k),'brazowa')==1) && strcmp(D1(3,k),'')==0 && strcmp(D1(4,k),'')==1)
                                           F(1,2)=k;
                                           F(2,2)=4;
                                           k=g(1,2)+1;
                                       elseif ((strcmp(D1(1,k),'niebieska')==1 || strcmp(D1(1,k),'rozowa')==1 || strcmp(D1(1,k),'pomaranczowa')==1 || strcmp(D1(1,k),'czerwona')==1 || strcmp(D1(1,k),'zolta')==1 || strcmp(D1(1,k),'zielona')==1) && strcmp(D1(4,k),'')==0 && strcmp(D1(5,k),'')==1)
                                           F(1,2)=k;
                                           F(2,2)=5;
                                           k=g(1,2)+1;
                                       else
                                           k=k+1;
                                       end
                                   end
                                   D1
                                   m=input(['masz dwie pelne dzielnice w ktorych mozesz postawic dom: w kolumnie ' num2str(F1(1,1)) ' i w kolumnie ' num2str(F1(1,2)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic dom '])
                                   if (m==F(1,1) && m~=0)
                                       D1(F(2,1),F(1,1))={'Dom'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S1(1,3)=S1(1,3)+1;
                                   elseif (m==F(1,2) && m~=0)
                                       D1(F(2,2),F(1,2))={'Dom'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S1(1,3)=S1(1,3)+1;
                                   else
                                       disp('w podanej kolumnie nie mozesz postawic domu')
                                   end
                               else
                                   disp('nie masz pelnej dzielnicy w ktorej mozesz postawic dom')
                               end
                           elseif strcmp(Dz(f),'Hotel')==1
                               if (S1(1,3)==1 && S1(1,4)==0)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   D1(g+1,h)={'Hotel'};
                                   %Dz(f)=[];
                                   f=f+1;
                                   S(1,4)=S1(1,4)+1;
                               elseif (S1(1,3)==2 && S1(1,4)==1)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   if strcmp(D1(g(1,1)+1,h(1,1)),'')==1
                                       D1(g(1,1)+1,h(1,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   elseif strcmp(D1(g(2,1)+1,h(2,1)),'')==1
                                       D1(g(2,1)+1,h(2,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   else
                                       disp('blad 149')
                                   end
                               elseif (S1(1,3)==2 && S1(1,4)==0)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   D1
                                   k=input(['masz dwie dzielnice w ktorych mozesz postawic hotel: w kolumnie ' num2str(h(1,1)) ' i w kolumnie ' num2str(h(2,1)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic hotel '])
                                   if k==h(1,1)
                                       D1(g(1,1)+1,h(1,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   elseif k==h(2,1)
                                       D1(g(2,1)+1,h(2,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   else
                                       disp('w podanej kolumnie nie mozesz postawic hotelu')
                                   end
                               else
                                   disp('nie masz dzielnicy w ktorej mozesz postawic hotel')
                               end
                           else
                               disp('blad 172')
                           end
                       elseif b==4
                           Dz(f)=[];
                           Dz=[Dz ca];
                       else
                           disp('wpisany numer nie ma przypisanego dzialania')
                       end
                   elseif ca4==1
                       % funkcja na ukladanie otrzymanej dzialki 
                       [D1,S1,f] = otrzymana1(ca,f,S1,D1);
                   else
                       disp('blad 191')
                   end
               end
               
               z4=2;
               [Bz,Dz,S4,P4,B4,D4,K]=zaplata4(z4,S4,P4,B4,D4,K);
               B1=[B1 Bz];
               e=size(Dz);
               e=e(1,2);
               f=1;
               while f<=e
                   ca=Dz(f);
                   ca3=max(strcmp(E3,ca));
                   ca4=max(strcmp(E4,ca));
                   if ca3==1
                       b=input('wskazana karte: 1-przenies do banku, 2-przenies do kart dzielek, 4-potem przeniose ta karte ')
                       if b==1
                           B1=[B1 ca];
                           Dz(f)=[];
                           f=f+1;
                       elseif b==2
                           if strcmp(Dz(f),'Dom')==1
                               if S1(1,2)-S1(1,3)==1
                                   g=size(D1);
                                   h=1;
                                   while h<=g(1,2)
                                       if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                           D1(3,h)={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           h=g(1,2)+1;
                                           S1(1,3)=S1(1,3)+1;
                                       elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                           D1(4,h)={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           h=g(1,2)+1;
                                           S1(1,3)=S1(1,3)+1;
                                       else
                                           h=h+1;
                                       end
                                   end
                               elseif S1(1,2)-S1(1,3)==2
                                   F=zeros(2,2);
                                   g=size(D1);
                                   h=1;
                                   while h<=g(1,2)
                                       if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                           F(1,1)=h;
                                           F(2,1)=4;
                                           k=h;
                                           h=g(1,2)+1;
                                       elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                           F(1,1)=h;
                                           F(2,1)=5;
                                           k=h;
                                           h=g(1,2)+1;
                                       else
                                           h=h+1;
                                       end
                                   end
                                   while k<=g
                                       if ((strcmp(D1(1,k),'granatowa')==1 || strcmp(D1(1,k),'brazowa')==1) && strcmp(D1(3,k),'')==0 && strcmp(D1(4,k),'')==1)
                                           F(1,2)=k;
                                           F(2,2)=4;
                                           k=g(1,2)+1;
                                       elseif ((strcmp(D1(1,k),'niebieska')==1 || strcmp(D1(1,k),'rozowa')==1 || strcmp(D1(1,k),'pomaranczowa')==1 || strcmp(D1(1,k),'czerwona')==1 || strcmp(D1(1,k),'zolta')==1 || strcmp(D1(1,k),'zielona')==1) && strcmp(D1(4,k),'')==0 && strcmp(D1(5,k),'')==1)
                                           F(1,2)=k;
                                           F(2,2)=5;
                                           k=g(1,2)+1;
                                       else
                                           k=k+1;
                                       end
                                   end
                                   D1
                                   m=input(['masz dwie pelne dzielnice w ktorych mozesz postawic dom: w kolumnie ' num2str(F1(1,1)) ' i w kolumnie ' num2str(F1(1,2)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic dom '])
                                   if (m==F(1,1) && m~=0)
                                       D1(F(2,1),F(1,1))={'Dom'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S1(1,3)=S1(1,3)+1;
                                   elseif (m==F(1,2) && m~=0)
                                       D1(F(2,2),F(1,2))={'Dom'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S1(1,3)=S1(1,3)+1;
                                   else
                                       disp('w podanej kolumnie nie mozesz postawic domu')
                                   end
                               else
                                   disp('nie masz pelnej dzielnicy w ktorej mozesz postawic dom')
                               end
                           elseif strcmp(Dz(f),'Hotel')==1
                               if (S1(1,3)==1 && S1(1,4)==0)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   D1(g+1,h)={'Hotel'};
                                   %Dz(f)=[];
                                   f=f+1;
                                   S(1,4)=S1(1,4)+1;
                               elseif (S1(1,3)==2 && S1(1,4)==1)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   if strcmp(D1(g(1,1)+1,h(1,1)),'')==1
                                       D1(g(1,1)+1,h(1,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   elseif strcmp(D1(g(2,1)+1,h(2,1)),'')==1
                                       D1(g(2,1)+1,h(2,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   else
                                       disp('blad 149')
                                   end
                               elseif (S1(1,3)==2 && S1(1,4)==0)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   D1
                                   k=input(['masz dwie dzielnice w ktorych mozesz postawic hotel: w kolumnie ' num2str(h(1,1)) ' i w kolumnie ' num2str(h(2,1)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic hotel '])
                                   if k==h(1,1)
                                       D1(g(1,1)+1,h(1,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   elseif k==h(2,1)
                                       D1(g(2,1)+1,h(2,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   else
                                       disp('w podanej kolumnie nie mozesz postawic hotelu')
                                   end
                               else
                                   disp('nie masz dzielnicy w ktorej mozesz postawic hotel')
                               end
                           else
                               disp('blad 172')
                           end
                       elseif b==4
                           Dz(f)=[];
                           Dz=[Dz ca];
                       else
                           disp('wpisany numer nie ma przypisanego dzialania')
                       end
                   elseif ca4==1
                       % funkcja na ukladanie otrzymanej dzialki 
                       [D1,S1,f] = otrzymana1(ca,f,S1,D1);
                   else
                       disp('blad 191')
                   end
               end
               
               z5=2;
               [Bz,Dz,S5,P5,B5,D5,K]=zaplata5(z5,S5,P5,B5,D5,K);
               B1=[B1 Bz];
               e=size(Dz);
               e=e(1,2);
               f=1;
               while f<=e
                   ca=Dz(f);
                   ca3=max(strcmp(E3,ca));
                   ca4=max(strcmp(E4,ca));
                   if ca3==1
                       b=input('wskazana karte: 1-przenies do banku, 2-przenies do kart dzielek, 4-potem przeniose ta karte ')
                       if b==1
                           B1=[B1 ca];
                           Dz(f)=[];
                           f=f+1;
                       elseif b==2
                           if strcmp(Dz(f),'Dom')==1
                               if S1(1,2)-S1(1,3)==1
                                   g=size(D1);
                                   h=1;
                                   while h<=g(1,2)
                                       if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                           D1(3,h)={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           h=g(1,2)+1;
                                           S1(1,3)=S1(1,3)+1;
                                       elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                           D1(4,h)={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           h=g(1,2)+1;
                                           S1(1,3)=S1(1,3)+1;
                                       else
                                           h=h+1;
                                       end
                                   end
                               elseif S1(1,2)-S1(1,3)==2
                                   F=zeros(2,2);
                                   g=size(D1);
                                   h=1;
                                   while h<=g(1,2)
                                       if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                           F(1,1)=h;
                                           F(2,1)=4;
                                           k=h;
                                           h=g(1,2)+1;
                                       elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                           F(1,1)=h;
                                           F(2,1)=5;
                                           k=h;
                                           h=g(1,2)+1;
                                       else
                                           h=h+1;
                                       end
                                   end
                                   while k<=g
                                       if ((strcmp(D1(1,k),'granatowa')==1 || strcmp(D1(1,k),'brazowa')==1) && strcmp(D1(3,k),'')==0 && strcmp(D1(4,k),'')==1)
                                           F(1,2)=k;
                                           F(2,2)=4;
                                           k=g(1,2)+1;
                                       elseif ((strcmp(D1(1,k),'niebieska')==1 || strcmp(D1(1,k),'rozowa')==1 || strcmp(D1(1,k),'pomaranczowa')==1 || strcmp(D1(1,k),'czerwona')==1 || strcmp(D1(1,k),'zolta')==1 || strcmp(D1(1,k),'zielona')==1) && strcmp(D1(4,k),'')==0 && strcmp(D1(5,k),'')==1)
                                           F(1,2)=k;
                                           F(2,2)=5;
                                           k=g(1,2)+1;
                                       else
                                           k=k+1;
                                       end
                                   end
                                   D1
                                   m=input(['masz dwie pelne dzielnice w ktorych mozesz postawic dom: w kolumnie ' num2str(F1(1,1)) ' i w kolumnie ' num2str(F1(1,2)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic dom '])
                                   if (m==F(1,1) && m~=0)
                                       D1(F(2,1),F(1,1))={'Dom'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S1(1,3)=S1(1,3)+1;
                                   elseif (m==F(1,2) && m~=0)
                                       D1(F(2,2),F(1,2))={'Dom'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S1(1,3)=S1(1,3)+1;
                                   else
                                       disp('w podanej kolumnie nie mozesz postawic domu')
                                   end
                               else
                                   disp('nie masz pelnej dzielnicy w ktorej mozesz postawic dom')
                               end
                           elseif strcmp(Dz(f),'Hotel')==1
                               if (S1(1,3)==1 && S1(1,4)==0)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   D1(g+1,h)={'Hotel'};
                                   %Dz(f)=[];
                                   f=f+1;
                                   S(1,4)=S1(1,4)+1;
                               elseif (S1(1,3)==2 && S1(1,4)==1)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   if strcmp(D1(g(1,1)+1,h(1,1)),'')==1
                                       D1(g(1,1)+1,h(1,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   elseif strcmp(D1(g(2,1)+1,h(2,1)),'')==1
                                       D1(g(2,1)+1,h(2,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   else
                                       disp('blad 149')
                                   end
                               elseif (S1(1,3)==2 && S1(1,4)==0)
                                   [g,h]=find(strcmp(D1,'Dom'));
                                   D1
                                   k=input(['masz dwie dzielnice w ktorych mozesz postawic hotel: w kolumnie ' num2str(h(1,1)) ' i w kolumnie ' num2str(h(2,1)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic hotel '])
                                   if k==h(1,1)
                                       D1(g(1,1)+1,h(1,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   elseif k==h(2,1)
                                       D1(g(2,1)+1,h(2,1))={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S(1,4)+1;
                                   else
                                       disp('w podanej kolumnie nie mozesz postawic hotelu')
                                   end
                               else
                                   disp('nie masz dzielnicy w ktorej mozesz postawic hotel')
                               end
                           else
                               disp('blad 172')
                           end
                       elseif b==4
                           Dz(f)=[];
                           Dz=[Dz ca];
                       else
                           disp('wpisany numer nie ma przypisanego dzialania')
                       end
                   elseif ca4==1
                       % funkcja na ukladanie otrzymanej dzialki 
                       [D1,S1,f] = otrzymana1(ca,f,S1,D1);
                   else
                       disp('blad 191')
                   end
               end
           elseif strcmp(P1(a),'Bierz Kase')==1
               ee=input('wybierz gracza od ktorego chcesz wziac 5 milionow ')
               if ee==2
                   z2=5;
                   [Bz,Dz,S2,P2,B2,D2,K]=zaplata2(z2,S2,P2,B2,D2,K);
                   B1=[B1 Bz];
                   e=size(Dz);
                   e=e(1,2);
                   f=1;
                   while f<=e
                       ca=Dz(f);
                       ca3=max(strcmp(E3,ca));
                       ca4=max(strcmp(E4,ca));
                       if ca3==1
                           b=input('wskazana karte: 1-przenies do banku, 2-przenies do kart dzielek, 4-potem przeniose ta karte ')
                           if b==1
                               B1=[B1 ca];
                               Dz(f)=[];
                               f=f+1;
                           elseif b==2
                               if strcmp(Dz(f),'Dom')==1
                                   if S1(1,2)-S1(1,3)==1
                                       g=size(D1);
                                       h=1;
                                       while h<=g(1,2)
                                           if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                               D1(3,h)={'Dom'};
                                               %Dz(f)=[];
                                               f=f+1;
                                               h=g(1,2)+1;
                                               S1(1,3)=S1(1,3)+1;
                                           elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                               D1(4,h)={'Dom'};
                                               %Dz(f)=[];
                                               f=f+1;
                                               h=g(1,2)+1;
                                               S1(1,3)=S1(1,3)+1;
                                           else
                                               h=h+1;
                                           end
                                       end
                                   elseif S1(1,2)-S1(1,3)==2
                                       F=zeros(2,2);
                                       g=size(D1);
                                       h=1;
                                       while h<=g(1,2)
                                           if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                               F(1,1)=h;
                                               F(2,1)=4;
                                               k=h;
                                               h=g(1,2)+1;
                                           elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                               F(1,1)=h;
                                               F(2,1)=5;
                                               k=h;
                                               h=g(1,2)+1;
                                           else
                                               h=h+1;
                                           end
                                       end
                                       while k<=g
                                           if ((strcmp(D1(1,k),'granatowa')==1 || strcmp(D1(1,k),'brazowa')==1) && strcmp(D1(3,k),'')==0 && strcmp(D1(4,k),'')==1)
                                               F(1,2)=k;
                                               F(2,2)=4;
                                               k=g(1,2)+1;
                                           elseif ((strcmp(D1(1,k),'niebieska')==1 || strcmp(D1(1,k),'rozowa')==1 || strcmp(D1(1,k),'pomaranczowa')==1 || strcmp(D1(1,k),'czerwona')==1 || strcmp(D1(1,k),'zolta')==1 || strcmp(D1(1,k),'zielona')==1) && strcmp(D1(4,k),'')==0 && strcmp(D1(5,k),'')==1)
                                               F(1,2)=k;
                                               F(2,2)=5;
                                               k=g(1,2)+1;
                                           else
                                               k=k+1;
                                           end
                                       end
                                       D1
                                       m=input(['masz dwie pelne dzielnice w ktorych mozesz postawic dom: w kolumnie ' num2str(F1(1,1)) ' i w kolumnie ' num2str(F1(1,2)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic dom '])
                                       if (m==F(1,1) && m~=0)
                                           D1(F(2,1),F(1,1))={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S1(1,3)=S1(1,3)+1;
                                       elseif (m==F(1,2) && m~=0)
                                           D1(F(2,2),F(1,2))={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S1(1,3)=S1(1,3)+1;
                                       else
                                           disp('w podanej kolumnie nie mozesz postawic domu')
                                       end
                                   else
                                       disp('nie masz pelnej dzielnicy w ktorej mozesz postawic dom')
                                   end
                               elseif strcmp(Dz(f),'Hotel')==1
                                   if (S1(1,3)==1 && S1(1,4)==0)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       D1(g+1,h)={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S1(1,4)+1;
                                   elseif (S1(1,3)==2 && S1(1,4)==1)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       if strcmp(D1(g(1,1)+1,h(1,1)),'')==1
                                           D1(g(1,1)+1,h(1,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       elseif strcmp(D1(g(2,1)+1,h(2,1)),'')==1
                                           D1(g(2,1)+1,h(2,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       else
                                           disp('blad 149')
                                       end
                                   elseif (S1(1,3)==2 && S1(1,4)==0)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       D1
                                       k=input(['masz dwie dzielnice w ktorych mozesz postawic hotel: w kolumnie ' num2str(h(1,1)) ' i w kolumnie ' num2str(h(2,1)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic hotel '])
                                       if k==h(1,1)
                                           D1(g(1,1)+1,h(1,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       elseif k==h(2,1)
                                           D1(g(2,1)+1,h(2,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       else
                                           disp('w podanej kolumnie nie mozesz postawic hotelu')
                                       end
                                   else
                                       disp('nie masz dzielnicy w ktorej mozesz postawic hotel')
                                   end
                               else
                                   disp('blad 172')
                               end
                           elseif b==4
                               Dz(f)=[];
                               Dz=[Dz ca];
                           else
                               disp('wpisany numer nie ma przypisanego dzialania')
                           end
                       elseif ca4==1
                           % funkcja na ukladanie otrzymanej dzialki 
                           [D1,S1,f] = otrzymana1(ca,f,S1,D1);
                       else
                           disp('blad 191')
                       end
                   end
               elseif ee==3
                   z3=5;
                   [Bz,Dz,S2,P2,B2,D2,K]=zaplata3(z2,S2,P2,B2,D2,K);
                   B1=[B1 Bz];
                   e=size(Dz);
                   e=e(1,2);
                   f=1;
                   while f<=e
                       ca=Dz(f);
                       ca3=max(strcmp(E3,ca));
                       ca4=max(strcmp(E4,ca));
                       if ca3==1
                           b=input('wskazana karte: 1-przenies do banku, 2-przenies do kart dzielek, 4-potem przeniose ta karte ')
                           if b==1
                               B1=[B1 ca];
                               Dz(f)=[];
                               f=f+1;
                           elseif b==2
                               if strcmp(Dz(f),'Dom')==1
                                   if S1(1,2)-S1(1,3)==1
                                       g=size(D1);
                                       h=1;
                                       while h<=g(1,2)
                                           if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                               D1(3,h)={'Dom'};
                                               %Dz(f)=[];
                                               f=f+1;
                                               h=g(1,2)+1;
                                               S1(1,3)=S1(1,3)+1;
                                           elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                               D1(4,h)={'Dom'};
                                               %Dz(f)=[];
                                               f=f+1;
                                               h=g(1,2)+1;
                                               S1(1,3)=S1(1,3)+1;
                                           else
                                               h=h+1;
                                           end
                                       end
                                   elseif S1(1,2)-S1(1,3)==2
                                       F=zeros(2,2);
                                       g=size(D1);
                                       h=1;
                                       while h<=g(1,2)
                                           if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                               F(1,1)=h;
                                               F(2,1)=4;
                                               k=h;
                                               h=g(1,2)+1;
                                           elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                               F(1,1)=h;
                                               F(2,1)=5;
                                               k=h;
                                               h=g(1,2)+1;
                                           else
                                               h=h+1;
                                           end
                                       end
                                       while k<=g
                                           if ((strcmp(D1(1,k),'granatowa')==1 || strcmp(D1(1,k),'brazowa')==1) && strcmp(D1(3,k),'')==0 && strcmp(D1(4,k),'')==1)
                                               F(1,2)=k;
                                               F(2,2)=4;
                                               k=g(1,2)+1;
                                           elseif ((strcmp(D1(1,k),'niebieska')==1 || strcmp(D1(1,k),'rozowa')==1 || strcmp(D1(1,k),'pomaranczowa')==1 || strcmp(D1(1,k),'czerwona')==1 || strcmp(D1(1,k),'zolta')==1 || strcmp(D1(1,k),'zielona')==1) && strcmp(D1(4,k),'')==0 && strcmp(D1(5,k),'')==1)
                                               F(1,2)=k;
                                               F(2,2)=5;
                                               k=g(1,2)+1;
                                           else
                                               k=k+1;
                                           end
                                       end
                                       D1
                                       m=input(['masz dwie pelne dzielnice w ktorych mozesz postawic dom: w kolumnie ' num2str(F1(1,1)) ' i w kolumnie ' num2str(F1(1,2)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic dom '])
                                       if (m==F(1,1) && m~=0)
                                           D1(F(2,1),F(1,1))={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S1(1,3)=S1(1,3)+1;
                                       elseif (m==F(1,2) && m~=0)
                                           D1(F(2,2),F(1,2))={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S1(1,3)=S1(1,3)+1;
                                       else
                                           disp('w podanej kolumnie nie mozesz postawic domu')
                                       end
                                   else
                                       disp('nie masz pelnej dzielnicy w ktorej mozesz postawic dom')
                                   end
                               elseif strcmp(Dz(f),'Hotel')==1
                                   if (S1(1,3)==1 && S1(1,4)==0)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       D1(g+1,h)={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S1(1,4)+1;
                                   elseif (S1(1,3)==2 && S1(1,4)==1)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       if strcmp(D1(g(1,1)+1,h(1,1)),'')==1
                                           D1(g(1,1)+1,h(1,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       elseif strcmp(D1(g(2,1)+1,h(2,1)),'')==1
                                           D1(g(2,1)+1,h(2,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       else
                                           disp('blad 149')
                                       end
                                   elseif (S1(1,3)==2 && S1(1,4)==0)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       D1
                                       k=input(['masz dwie dzielnice w ktorych mozesz postawic hotel: w kolumnie ' num2str(h(1,1)) ' i w kolumnie ' num2str(h(2,1)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic hotel '])
                                       if k==h(1,1)
                                           D1(g(1,1)+1,h(1,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       elseif k==h(2,1)
                                           D1(g(2,1)+1,h(2,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       else
                                           disp('w podanej kolumnie nie mozesz postawic hotelu')
                                       end
                                   else
                                       disp('nie masz dzielnicy w ktorej mozesz postawic hotel')
                                   end
                               else
                                   disp('blad 172')
                               end
                           elseif b==4
                               Dz(f)=[];
                               Dz=[Dz ca];
                           else
                               disp('wpisany numer nie ma przypisanego dzialania')
                           end
                       elseif ca4==1
                           % funkcja na ukladanie otrzymanej dzialki 
                           [D1,S1,f] = otrzymana1(ca,f,S1,D1);
                       else
                           disp('blad 191')
                       end
                   end
               elseif ee==4
                   z4=5;
                   [Bz,Dz,S2,P2,B2,D2,K]=zaplata4(z2,S2,P2,B2,D2,K);
                   B1=[B1 Bz];
                   e=size(Dz);
                   e=e(1,2);
                   f=1;
                   while f<=e
                       ca=Dz(f);
                       ca3=max(strcmp(E3,ca));
                       ca4=max(strcmp(E4,ca));
                       if ca3==1
                           b=input('wskazana karte: 1-przenies do banku, 2-przenies do kart dzielek, 4-potem przeniose ta karte ')
                           if b==1
                               B1=[B1 ca];
                               Dz(f)=[];
                               f=f+1;
                           elseif b==2
                               if strcmp(Dz(f),'Dom')==1
                                   if S1(1,2)-S1(1,3)==1
                                       g=size(D1);
                                       h=1;
                                       while h<=g(1,2)
                                           if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                               D1(3,h)={'Dom'};
                                               %Dz(f)=[];
                                               f=f+1;
                                               h=g(1,2)+1;
                                               S1(1,3)=S1(1,3)+1;
                                           elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                               D1(4,h)={'Dom'};
                                               %Dz(f)=[];
                                               f=f+1;
                                               h=g(1,2)+1;
                                               S1(1,3)=S1(1,3)+1;
                                           else
                                               h=h+1;
                                           end
                                       end
                                   elseif S1(1,2)-S1(1,3)==2
                                       F=zeros(2,2);
                                       g=size(D1);
                                       h=1;
                                       while h<=g(1,2)
                                           if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                               F(1,1)=h;
                                               F(2,1)=4;
                                               k=h;
                                               h=g(1,2)+1;
                                           elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                               F(1,1)=h;
                                               F(2,1)=5;
                                               k=h;
                                               h=g(1,2)+1;
                                           else
                                               h=h+1;
                                           end
                                       end
                                       while k<=g
                                           if ((strcmp(D1(1,k),'granatowa')==1 || strcmp(D1(1,k),'brazowa')==1) && strcmp(D1(3,k),'')==0 && strcmp(D1(4,k),'')==1)
                                               F(1,2)=k;
                                               F(2,2)=4;
                                               k=g(1,2)+1;
                                           elseif ((strcmp(D1(1,k),'niebieska')==1 || strcmp(D1(1,k),'rozowa')==1 || strcmp(D1(1,k),'pomaranczowa')==1 || strcmp(D1(1,k),'czerwona')==1 || strcmp(D1(1,k),'zolta')==1 || strcmp(D1(1,k),'zielona')==1) && strcmp(D1(4,k),'')==0 && strcmp(D1(5,k),'')==1)
                                               F(1,2)=k;
                                               F(2,2)=5;
                                               k=g(1,2)+1;
                                           else
                                               k=k+1;
                                           end
                                       end
                                       D1
                                       m=input(['masz dwie pelne dzielnice w ktorych mozesz postawic dom: w kolumnie ' num2str(F1(1,1)) ' i w kolumnie ' num2str(F1(1,2)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic dom '])
                                       if (m==F(1,1) && m~=0)
                                           D1(F(2,1),F(1,1))={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S1(1,3)=S1(1,3)+1;
                                       elseif (m==F(1,2) && m~=0)
                                           D1(F(2,2),F(1,2))={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S1(1,3)=S1(1,3)+1;
                                       else
                                           disp('w podanej kolumnie nie mozesz postawic domu')
                                       end
                                   else
                                       disp('nie masz pelnej dzielnicy w ktorej mozesz postawic dom')
                                   end
                               elseif strcmp(Dz(f),'Hotel')==1
                                   if (S1(1,3)==1 && S1(1,4)==0)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       D1(g+1,h)={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S1(1,4)+1;
                                   elseif (S1(1,3)==2 && S1(1,4)==1)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       if strcmp(D1(g(1,1)+1,h(1,1)),'')==1
                                           D1(g(1,1)+1,h(1,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       elseif strcmp(D1(g(2,1)+1,h(2,1)),'')==1
                                           D1(g(2,1)+1,h(2,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       else
                                           disp('blad 149')
                                       end
                                   elseif (S1(1,3)==2 && S1(1,4)==0)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       D1
                                       k=input(['masz dwie dzielnice w ktorych mozesz postawic hotel: w kolumnie ' num2str(h(1,1)) ' i w kolumnie ' num2str(h(2,1)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic hotel '])
                                       if k==h(1,1)
                                           D1(g(1,1)+1,h(1,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       elseif k==h(2,1)
                                           D1(g(2,1)+1,h(2,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       else
                                           disp('w podanej kolumnie nie mozesz postawic hotelu')
                                       end
                                   else
                                       disp('nie masz dzielnicy w ktorej mozesz postawic hotel')
                                   end
                               else
                                   disp('blad 172')
                               end
                           elseif b==4
                               Dz(f)=[];
                               Dz=[Dz ca];
                           else
                               disp('wpisany numer nie ma przypisanego dzialania')
                           end
                       elseif ca4==1
                           % funkcja na ukladanie otrzymanej dzialki 
                           [D1,S1,f] = otrzymana1(ca,f,S1,D1);
                       else
                           disp('blad 191')
                       end
                   end
               elseif ee==5
                   z5=5;
                   [Bz,Dz,S2,P2,B2,D2,K]=zaplata5(z2,S2,P2,B2,D2,K);
                   B1=[B1 Bz];
                   e=size(Dz);
                   e=e(1,2);
                   f=1;
                   while f<=e
                       ca=Dz(f);
                       ca3=max(strcmp(E3,ca));
                       ca4=max(strcmp(E4,ca));
                       if ca3==1
                           b=input('wskazana karte: 1-przenies do banku, 2-przenies do kart dzielek, 4-potem przeniose ta karte ')
                           if b==1
                               B1=[B1 ca];
                               Dz(f)=[];
                               f=f+1;
                           elseif b==2
                               if strcmp(Dz(f),'Dom')==1
                                   if S1(1,2)-S1(1,3)==1
                                       g=size(D1);
                                       h=1;
                                       while h<=g(1,2)
                                           if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                               D1(3,h)={'Dom'};
                                               %Dz(f)=[];
                                               f=f+1;
                                               h=g(1,2)+1;
                                               S1(1,3)=S1(1,3)+1;
                                           elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                               D1(4,h)={'Dom'};
                                               %Dz(f)=[];
                                               f=f+1;
                                               h=g(1,2)+1;
                                               S1(1,3)=S1(1,3)+1;
                                           else
                                               h=h+1;
                                           end
                                       end
                                   elseif S1(1,2)-S1(1,3)==2
                                       F=zeros(2,2);
                                       g=size(D1);
                                       h=1;
                                       while h<=g(1,2)
                                           if ((strcmp(D1(1,h),'granatowa')==1 || strcmp(D1(1,h),'brazowa')==1) && strcmp(D1(3,h),'')==0 && strcmp(D1(4,h),'')==1)
                                               F(1,1)=h;
                                               F(2,1)=4;
                                               k=h;
                                               h=g(1,2)+1;
                                           elseif ((strcmp(D1(1,h),'niebieska')==1 || strcmp(D1(1,h),'rozowa')==1 || strcmp(D1(1,h),'pomaranczowa')==1 || strcmp(D1(1,h),'czerwona')==1 || strcmp(D1(1,h),'zolta')==1 || strcmp(D1(1,h),'zielona')==1) && strcmp(D1(4,h),'')==0 && strcmp(D1(5,h),'')==1)
                                               F(1,1)=h;
                                               F(2,1)=5;
                                               k=h;
                                               h=g(1,2)+1;
                                           else
                                               h=h+1;
                                           end
                                       end
                                       while k<=g
                                           if ((strcmp(D1(1,k),'granatowa')==1 || strcmp(D1(1,k),'brazowa')==1) && strcmp(D1(3,k),'')==0 && strcmp(D1(4,k),'')==1)
                                               F(1,2)=k;
                                               F(2,2)=4;
                                               k=g(1,2)+1;
                                           elseif ((strcmp(D1(1,k),'niebieska')==1 || strcmp(D1(1,k),'rozowa')==1 || strcmp(D1(1,k),'pomaranczowa')==1 || strcmp(D1(1,k),'czerwona')==1 || strcmp(D1(1,k),'zolta')==1 || strcmp(D1(1,k),'zielona')==1) && strcmp(D1(4,k),'')==0 && strcmp(D1(5,k),'')==1)
                                               F(1,2)=k;
                                               F(2,2)=5;
                                               k=g(1,2)+1;
                                           else
                                               k=k+1;
                                           end
                                       end
                                       D1
                                       m=input(['masz dwie pelne dzielnice w ktorych mozesz postawic dom: w kolumnie ' num2str(F1(1,1)) ' i w kolumnie ' num2str(F1(1,2)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic dom '])
                                       if (m==F(1,1) && m~=0)
                                           D1(F(2,1),F(1,1))={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S1(1,3)=S1(1,3)+1;
                                       elseif (m==F(1,2) && m~=0)
                                           D1(F(2,2),F(1,2))={'Dom'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S1(1,3)=S1(1,3)+1;
                                       else
                                           disp('w podanej kolumnie nie mozesz postawic domu')
                                       end
                                   else
                                       disp('nie masz pelnej dzielnicy w ktorej mozesz postawic dom')
                                   end
                               elseif strcmp(Dz(f),'Hotel')==1
                                   if (S1(1,3)==1 && S1(1,4)==0)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       D1(g+1,h)={'Hotel'};
                                       %Dz(f)=[];
                                       f=f+1;
                                       S(1,4)=S1(1,4)+1;
                                   elseif (S1(1,3)==2 && S1(1,4)==1)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       if strcmp(D1(g(1,1)+1,h(1,1)),'')==1
                                           D1(g(1,1)+1,h(1,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       elseif strcmp(D1(g(2,1)+1,h(2,1)),'')==1
                                           D1(g(2,1)+1,h(2,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       else
                                           disp('blad 149')
                                       end
                                   elseif (S1(1,3)==2 && S1(1,4)==0)
                                       [g,h]=find(strcmp(D1,'Dom'));
                                       D1
                                       k=input(['masz dwie dzielnice w ktorych mozesz postawic hotel: w kolumnie ' num2str(h(1,1)) ' i w kolumnie ' num2str(h(2,1)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic hotel '])
                                       if k==h(1,1)
                                           D1(g(1,1)+1,h(1,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       elseif k==h(2,1)
                                           D1(g(2,1)+1,h(2,1))={'Hotel'};
                                           %Dz(f)=[];
                                           f=f+1;
                                           S(1,4)=S(1,4)+1;
                                       else
                                           disp('w podanej kolumnie nie mozesz postawic hotelu')
                                       end
                                   else
                                       disp('nie masz dzielnicy w ktorej mozesz postawic hotel')
                                   end
                               else
                                   disp('blad 172')
                               end
                           elseif b==4
                               Dz(f)=[];
                               Dz=[Dz ca];
                           else
                               disp('wpisany numer nie ma przypisanego dzialania')
                           end
                       elseif ca4==1
                           % funkcja na ukladanie otrzymanej dzialki 
                           [D1,S1,f] = otrzymana1(ca,f,S1,D1);
                       else
                           disp('blad 191')
                       end
                   end
               else
                   disp('nie istnieje gracz o wskazanym numerze')
               end
           elseif strcmp(P1(a),'Chytra Transakcja')==1
               dd=0;
               while dd==0 
                   e=input('wybierz gracza ktoremu chcesz zabrac karte ')
                   if e==2
                       D=D2;
                   elseif e==3
                       D=D3;
                   elseif e==4
                       D=D4;
                   elseif e==5
                       D=D5;
                   else
                       disp('nie istnieje gracz o wskazanym numerze')
                   end
                   h=size(D);
                   h=h(1,1)*h(1,2);
                   if sum(strcmp(D,''))+sum(strcmp(D,'DK kolorowa'))==h
                       disp('wskazany gracz nie posiada zadnych dzialek ktore mozesz zagrac')
                       dd=1;
                   else
                   %end
                       f=input('wybierz kolumne w ktorej znajduje sie dzialka ktora chcesz zabrac ')
                       g=input('wybierz wiersz w ktorym znajduje sie dzialka ktora chcesz zabrac ')
                       h=size(D);
                       h=h(1,2);
                       if (g==2 || g==3 || g==4)
                           if (strcmp(D(g,f),'')==0 && strcmp(D(g,f),'DK kolorowa')==0 && strcmp(D(g,f),'Dom')==0 && strcmp(D(g,f),'Hotel')==0)
                               if (strcmp(D(1,f),'granatowa')==1 || strcmp(D(1,f),'brazowa')==1 || strcmp(D(1,f),'oliwkowa')==1)
                                   if sum(strcmp(D(:,f),''))<=3
                                       disp('wskazana karta jest czescia pelnej dzielnicy, nie mozesz jej zabrac')
                                   elseif sum(strcmp(D(:,f),''))>3
                                       Dz=D(g,f);
                                       D(g,f)={''};
                                       dd=1;
                                   else
                                       disp('blad 1257')
                                   end
                               elseif (strcmp(D(1,f),'niebieska')==1 || strcmp(D(1,f),'rozowa')==1 || strcmp(D(1,f),'pomaranczowa')==1 || strcmp(D(1,f),'czerwona')==1 || strcmp(D(1,f),'zolta')==1 || strcmp(D(1,f),'zielona')==1)
                                   if sum(strcmp(D(:,f),''))<=2
                                       disp('wskazana karta jest czescia pelnej dzielnicy, nie mozesz jej zabrac')
                                   elseif sum(strcmp(D(:,f),''))>2
                                       Dz=D(g,f);
                                       D(g,f)={''};
                                       dd=1;
                                   else
                                       disp('blad 1267')
                                   end
                               elseif strcmp(D(1,f),'czarna')==1
                                   if sum(strcmp(D(:,f),''))<=1
                                       disp('wskazana karta jest czescia pelnej dzielnicy, nie mozesz jej zabrac')
                                   elseif sum(strcmp(D(:,f),''))>1
                                       Dz=D(g,f);
                                       D(g,f)={''};
                                       dd=1;
                                   else
                                       disp('blad 1277')
                                   end
                               else
                                   disp('we wskazanej kolumnie nie znajduja sie dzialki ktore mozesz zabrac')
                               end
                           else
                               disp('nie mozesz zabrac kolorowej dzikiej karty, karty Dom, karty Hotel')
                           end
                       else
                           disp('w podanych wierszach napewno nie znajduje sie karta ktora mozesz zabrac')
                       end
                   end
               end
           elseif strcmp(P1(a),'Wymuszona Transakcja')==1
               k=size(D1);
               k=k(1,1)*k(1,2);
               if sum(strcmp(D1,''))+sum(strcmp(D1,'DK kolorowa'))==k
                   disp('nie masz zadnej dzialki ktora mozesz wymienic')
                   dd=1
               else
                   dd=0
               end
               while dd==0;
                   m=input('wybierz kolumne w ktorej znajduje sie dzialka ktora chcesz oddac')
                   n=input('wybierz wiersz w ktorym znajduje sie dzialka ktora chcesz oddac')
                   if (n==2 || n==3 || n==4)
                       if (strcmp(D1(n,m),'')==0 && strcmp(D1(n,m),'DK kolorowa')==0 && strcmp(D1(n,m),'Dom')==0 && strcmp(D1(n,m),'Hotel')==0)
                           if (strcmp(D1(1,m),'granatowa')==1 || strcmp(D1(1,m),'brazowa')==1 || strcmp(D1(1,m),'oliwkowa')==1)
                               if sum(strcmp(D1(:,m),''))<=3
                                   disp('wskazana karta jest czescia pelnej dzielnicy, nie mozesz jej oddac')
                               elseif sum(strcmp(D1(:,m),''))>3
                                   Do=D1(n,m);
                                   D1(n,m)={''};
                                   dd=2;
                               else
                                   disp('blad 1257')
                               end
                           elseif (strcmp(D1(1,m),'niebieska')==1 || strcmp(D1(1,m),'rozowa')==1 || strcmp(D1(1,m),'pomaranczowa')==1 || strcmp(D1(1,m),'czerwona')==1 || strcmp(D1(1,m),'zolta')==1 || strcmp(D1(1,m),'zielona')==1)
                               if sum(strcmp(D1(:,m),''))<=2
                                   disp('wskazana karta jest czescia pelnej dzielnicy, nie mozesz jej oddac')
                               elseif sum(strcmp(D1(:,m),''))>2
                                   Do=D1(n,m);
                                   D1(n,m)={''};
                                   dd=2;
                               else
                                   disp('blad 1267')
                               end
                           elseif strcmp(D1(1,m),'czarna')==1
                               if sum(strcmp(D1(:,m),''))<=1
                                   disp('wskazana karta jest czescia pelnej dzielnicy, nie mozesz jej oddac')
                               elseif sum(strcmp(D1(:,m),''))>1
                                   Do=D1(n,m);
                                   D1(n,m)={''};
                                   dd=2;
                               else
                                   disp('blad 1277')
                               end
                           else
                               disp('we wskazanej kolumnie nie znajduja sie dzialki ktore mozesz oddac')
                           end
                       else
                           disp('nie mozesz oddac kolorowej dzikiej karty, karty Dom, karty Hotel')
                       end
                   else
                       disp('w podanych wierszach napewno nie znajduje sie karta ktora mozesz oddac')
                   end
               end
               if dd==2
                   ee=0
                   while ee==0 
                       e=input('wybierz gracza ktoremu chcesz zabrac karte ')
                       if e==2
                           D=D2;
                       elseif e==3
                           D=D3;
                       elseif e==4
                           D=D4;
                       elseif e==5
                           D=D5;
                       else
                           disp('nie istnieje gracz o wskazanym numerze')
                       end
                       h=size(D);
                       h=h(1,1)*h(1,2);
                       if sum(strcmp(D,''))+sum(strcmp(D,'DK kolorowa'))==h
                           disp('wskazany gracz nie posiada zadnych dzialek ktore mozesz zagrac')
                           ee=1;
                       else
                       %end
                           f=input('wybierz kolumne w ktorej znajduje sie dzialka ktora chcesz zabrac ')
                           g=input('wybierz wiersz w ktorym znajduje sie dzialka ktora chcesz zabrac ')
                           h=size(D);
                           h=h(1,2);
                           if (g==2 || g==3 || g==4)
                               if (strcmp(D(g,f),'')==0 && strcmp(D(g,f),'DK kolorowa')==0 && strcmp(D(g,f),'Dom')==0 && strcmp(D(g,f),'Hotel')==0)
                                   if (strcmp(D(1,f),'granatowa')==1 || strcmp(D(1,f),'brazowa')==1 || strcmp(D(1,f),'oliwkowa')==1)
                                       if sum(strcmp(D(:,f),''))<=3
                                           disp('wskazana karta jest czescia pelnej dzielnicy, nie mozesz jej zabrac')
                                       elseif sum(strcmp(D(:,f),''))>3
                                           Dz=D(g,f);
                                           D(g,f)={''};
                                           ee=1;
                                       else
                                           disp('blad 1257')
                                       end
                                   elseif (strcmp(D(1,f),'niebieska')==1 || strcmp(D(1,f),'rozowa')==1 || strcmp(D(1,f),'pomaranczowa')==1 || strcmp(D(1,f),'czerwona')==1 || strcmp(D(1,f),'zolta')==1 || strcmp(D(1,f),'zielona')==1)
                                       if sum(strcmp(D(:,f),''))<=2
                                           disp('wskazana karta jest czescia pelnej dzielnicy, nie mozesz jej zabrac')
                                       elseif sum(strcmp(D(:,f),''))>2
                                           Dz=D(g,f);
                                           D(g,f)={''};
                                           ee=1;
                                       else
                                           disp('blad 1267')
                                       end
                                   elseif strcmp(D(1,f),'czarna')==1
                                       if sum(strcmp(D(:,f),''))<=1
                                           disp('wskazana karta jest czescia pelnej dzielnicy, nie mozesz jej zabrac')
                                       elseif sum(strcmp(D(:,f),''))>1
                                           Dz=D(g,f);
                                           D(g,f)={''};
                                           ee=1;
                                       else
                                           disp('blad 1277')
                                       end
                                   else
                                       disp('we wskazanej kolumnie nie znajduja sie dzialki ktore mozesz zabrac')
                                   end
                               else
                                   disp('nie mozesz zabrac kolorowej dzikiej karty, karty Dom, karty Hotel')
                               end
                           else
                               disp('w podanych wierszach napewno nie znajduje sie karta ktora mozesz zabrac')
                           end
                       end
                   end
               elseif dd==1
                   disp('nie oddasz przeciwnikowi zadnej karty wiec nie mozesz wziac od przeciwnika karty')
               else
                   disp('blad 1423')
               end
           elseif strcmp(P1(a),'Mega Transakcja')==1
               dd=0;
               while dd==0 
                   e=input('wybierz gracza ktoremu chcesz zabrac dzielnice ')
                   if e==2
                       D=D2;
                   elseif e==3
                       D=D3;
                   elseif e==4
                       D=D4;
                   elseif e==5
                       D=D5;
                   else
                       disp('nie istnieje gracz o wskazanym numerze')
                       D=[];
                   end
                   E=D(1,:);
                   h=size(E);
                   h=h(1,2);
                   k=1;
                   F=[];
                   while k<=h
                       if (strcmp(E(k),'granatowa')==1 || strcmp(E(k),'brazowa')==1 || strcmp(E(k),'oliwkowa')==1)
                           if sum(strcmp(D(:,k),''))<=3
                               F=[F k];
                               k=k+1;
                           else
                               k=k+1;
                           end
                       elseif (strcmp(E(k),'niebieska')==1 || strcmp(E(k),'rozowa')==1 || strcmp(E(k),'pomaranczowa')==1 || strcmp(E(k),'czerwona')==1 || strcmp(E(k),'zolta')==1 || strcmp(E(k),'zielona')==1)
                           if sum(strcmp(D(:,k),''))<=2
                               F=[F k];
                               k=k+1;
                           else
                               k=k+1;
                           end
                       elseif (stcmp(E(k),'czarna')==1)
                           if sum(strcmp(D(:,k),''))==1
                               F=[F k];
                               k=k+1;
                           else
                               k=k+1;
                           end
                       else
                           k=k+1;
                       end
                   end
                   if size(F)==0
                       dd=1;
                       disp('wskazany gracz nie ma zadnej pelnej dzielnicy ktora mozesz zabrac')
                   elseif size(F)==1
                       D1=[D1 D(:,F)];
                       dd=1;
                   elseif size(F)==2
                       m=input('podaj numer kolumny ktorej dzielnice chcesz zabrac graczowi ')
                       n=find(F==m);
                       if n>0
                           D1=[D1 D(:,m)];
                           dd=1;
                       else
                           disp('w podanej kolumnie nie znajduje sie pelna dzielnica ktora mozesz zabrac')
                           dd=1;
                       end
                   else
                       disp('blad 1485 3 pelne dzielnice i brak konca gry')
                       dd=1;
                   end
               end
           elseif strcmp(P1(a),'Czynsz kolorowy')==1
                   
             
           
           else
               disp('blad 49')
           end
           %koniec akcji
           d=d+1;
       elseif b==0
           disp('cofnij')
       else
           disp('podanej liczbie nie jest przyporzadkowana zadna czynnosc');
       end
   elseif c3==1
       b=input('wskazana karte: 1-przenies do banku, 2-przenies do kart dzielek, 0-cofin ruch ')
       if b==1
           B1=[B1 c];
           P1(a)=[];
           d=d+1;
       elseif b==2
           if strcmp(P1(a),'Dom')==1
               if S1(1,2)-S1(1,3)==1
                   e=size(D1);
                   f=1;
                   while f<=e(1,2)
                       if ((strcmp(D1(1,f),'granatowa')==1 || strcmp(D1(1,f),'brazowa')==1) && strcmp(D1(3,f),'')==0 && strcmp(D1(4,f),'')==1)
                           D1(3,f)={'Dom'};
                           P1(a)=[];
                           d=d+1;
                           f=e(1,2)+1;
                           S1(1,3)=S1(1,3)+1;
                       elseif ((strcmp(D1(1,f),'niebieska')==1 || strcmp(D1(1,f),'rozowa')==1 || strcmp(D1(1,f),'pomaranczowa')==1 || strcmp(D1(1,f),'czerwona')==1 || strcmp(D1(1,f),'zolta')==1 || strcmp(D1(1,f),'zielona')==1) && strcmp(D1(4,f),'')==0 && strcmp(D1(5,f),'')==1)
                           D1(4,f)={'Dom'};
                           P1(a)=[];
                           d=d+1;
                           f=e(1,2)+1;
                           S1(1,3)=S1(1,3)+1;
                       else
                           f=f+1;
                       end
                   end
               elseif S1(1,2)-S1(1,3)==2
                   F=zeros(2,2);
                   e=size(D1);
                   f=1;
                   while f<=e(1,2)
                       if ((strcmp(D1(1,f),'granatowa')==1 || strcmp(D1(1,f),'brazowa')==1) && strcmp(D1(3,f),'')==0 && strcmp(D1(4,f),'')==1)
                           F(1,1)=f;
                           F(2,1)=4;
                           g=f;
                           f=e(1,2)+1;
                       elseif ((strcmp(D1(1,f),'niebieska')==1 || strcmp(D1(1,f),'rozowa')==1 || strcmp(D1(1,f),'pomaranczowa')==1 || strcmp(D1(1,f),'czerwona')==1 || strcmp(D1(1,f),'zolta')==1 || strcmp(D1(1,f),'zielona')==1) && strcmp(D1(4,f),'')==0 && strcmp(D1(5,f),'')==1)
                           F(1,1)=f;
                           F(2,1)=5;
                           g=f;
                           f=e(1,2)+1;
                       else
                           f=f+1;
                       end
                   end
                   while g<=e
                       if ((strcmp(D1(1,g),'granatowa')==1 || strcmp(D1(1,g),'brazowa')==1) && strcmp(D1(3,g),'')==0 && strcmp(D1(4,g),'')==1)
                           F(1,2)=g;
                           F(2,2)=4;
                           g=e(1,2)+1;
                       elseif ((strcmp(D1(1,g),'niebieska')==1 || strcmp(D1(1,g),'rozowa')==1 || strcmp(D1(1,g),'pomaranczowa')==1 || strcmp(D1(1,g),'czerwona')==1 || strcmp(D1(1,g),'zolta')==1 || strcmp(D1(1,g),'zielona')==1) && strcmp(D1(4,g),'')==0 && strcmp(D1(5,g),'')==1)
                           F(1,2)=g;
                           F(2,2)=5;
                           g=e(1,2)+1;
                       else
                           g=g+1;
                       end
                   end
                   D1
                   h=input(['masz dwie pelne dzielnice w ktorych mozesz postawic dom: w kolumnie ' num2str(F1(1,1)) ' i w kolumnie ' num2str(F1(1,2)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic dom '])
                   if (h==F(1,1) && h~=0)
                       D1(F(2,1),F(1,1))={'Dom'};
                       P1(a)=[];
                       d=d+1;
                       S1(1,3)=S1(1,3)+1;
                   elseif (h==F(1,2) && h~=0)
                       D1(F(2,2),F(1,2))={'Dom'};
                       P1(a)=[];
                       d=d+1;
                       S1(1,3)=S1(1,3)+1;
                   else
                       disp('w podanej kolumnie nie mozesz postawic domu')
                   end
               else
                   disp('nie masz pelnej dzielnicy w ktorej mozesz postawic dom')
               end
           elseif strcmp(P1(a),'Hotel')==1
               if (S1(1,3)==1 && S1(1,4)==0)
                   [e,f]=find(strcmp(D1,'Dom'));
                   D1(e+1,f)={'Hotel'};
                   P1(a)=[];
                   d=d+1;
                   S(1,4)=S1(1,4)+1;
               elseif (S1(1,3)==2 && S1(1,4)==1)
                   [e,f]=find(strcmp(D1,'Dom'));
                   if strcmp(D1(e(1,1)+1,f(1,1)),'')==1
                       D1(e(1,1)+1,f(1,1))={'Hotel'};
                       P1(a)=[];
                       d=d+1;
                       S(1,4)=S(1,4)+1;
                   elseif strcmp(D1(e(2,1)+1,f(2,1)),'')==1
                       D1(e(2,1)+1,f(2,1))={'Hotel'};
                       P1(a)=[];
                       d=d+1;
                       S(1,4)=S(1,4)+1;
                   else
                       disp('blad 149')
                   end
               elseif (S1(1,3)==2 && S1(1,4)==0)
                   [e,f]=find(strcmp(D1,'Dom'));
                   D1
                   g=input(['masz dwie dzielnice w ktorych mozesz postawic hotel: w kolumnie ' num2str(f(1,1)) ' i w kolumnie ' num2str(f(2,1)) ', wybierz kolumne dzielnicy w ktorej chcesz postawic hotel '])
                   if g==f(1,1)
                       D1(e(1,1)+1,f(1,1))={'Hotel'};
                       P1(a)=[];
                       d=d+1;
                       S(1,4)=S(1,4)+1;
                   elseif g==f(2,1)
                       D1(e(2,1)+1,f(2,1))={'Hotel'};
                       P1(a)=[];
                       d=d+1;
                       S(1,4)=S(1,4)+1;
                   else
                       disp('w podanej kolumnie nie mozesz postawic hotelu')
                   end
               else
                   disp('nie masz dzielnicy w ktorej mozesz postawic hotel')
               end
           else
           disp('blad 172')
           end
       else
           disp('dom / hotel - cofnij')
       end
       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
       
   elseif c4==1
       b=input('wskazana karte: 2-przenies do kart dzialek, 0-cofnij ruch ')
       if b==2
           if c5(1)==1
               e=input('ktorego koloru chesz uzyc 1-niebieski 2-brazowy 0-cofnij ')
               
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
            if e==1
                D1(1,k)={'niebieska'};
            elseif e==2
                D1(1,k)={'brazowa'};
            else
            end
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'DK nie-bra'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==2
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            elseif (strcmp(D1(4,k),'')==1 && e==1)
                D1(4,k)={'DK nie-bra'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('nie mozesz postawic brazowej dzialki do dwoch kolorowych dzikich kart')
            end
        elseif strcmp(D1(1,m),'')==1
            if e==1
                D1(1,m)={'niebieska'};
            elseif e==2
                D1(1,m)={'brazowa'};
            else
            end
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'DK nie-bra'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==2
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            elseif (strcmp(D1(4,m),'')==1 && e==1)
                D1(4,m)={'DK nie-bra'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('nie mozesz postawic brazowej dzialki do dwoch kolorowych dzikich kart')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if (e==1 && f==1)
                   D={'niebieska';'DK nie-bra';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==1 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'niebieska'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'niebieska'))==1
                           g=find(strcmp(D1(1,:),'niebieska')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'DK nie-bra'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'niebieska')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'DK nie-bra'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               elseif (e==2 && f==1)
                   D={'brazowa';'DK nie-bra';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==2 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'brazowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'brazowa'))==1
                           g=find(strcmp(D1(1,:),'brazowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3)
                               D1(h,g)={'DK nie-bra'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               S1(1,2)=S1(1,2)+1;
                               disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'brazowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3)
                                   D1(k,h)={'DK nie-bra'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
               end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

           elseif c5(2)==1
               e=input('ktorego koloru chesz uzyc 1-niebieski 2-czarny 0-cofnij ')
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
            if e==1
                D1(1,k)={'niebieska'};
            elseif e==2
                D1(1,k)={'czarna'};
            else
            end
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'DK nie-cza'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'DK nie-cza'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==1
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            else
                disp('blad 166')
            end
        elseif strcmp(D1(1,m),'')==1
            if e==1
                D1(1,m)={'niebieska'};
            elseif e==2
                D1(1,m)={'czarna'};
            else
            end
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'DK nie-cza'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'DK nie-cza'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==1
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            else
                disp('blad 166')
            end
        else
            disp('blad 195')
        end
    else
               
               if (e==1 && f==1)
                   D={'niebieska';'DK nie-cza';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==1 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'niebieska'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'niebieska'))==1
                           g=find(strcmp(D1(1,:),'niebieska')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'DK nie-cza'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'niebieska')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'DK nie-cza'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               elseif (e==2 && f==1)
                   D={'czarna';'DK nie-cza';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==2 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'czarna'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'czarna'))==1
                           g=find(strcmp(D1(1,:),'czarna')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4||h==5)
                               D1(h,g)={'DK nie-cza'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==5
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'czarna')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4||k==5)
                                   D1(k,h)={'DK nie-cza'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==5
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
               end
    end
               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

           elseif c5(3)==1
               e=input('ktorego koloru chesz uzyc 1-rozowy 2-pomaranczowy 0-cofnij ')
               
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
            if e==1
                D1(1,k)={'rozowa'};
            elseif e==2
                D1(1,k)={'pomaranczowa'};
            else
            end
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'DK roz-pom'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'DK roz-pom'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 166')
            end
        elseif strcmp(D1(1,m),'')==1
            if e==1
                D1(1,m)={'rozowa'};
            elseif e==2
                D1(1,m)={'pomaranczowa'};
            else
            end
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'DK roz-pom'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'DK roz-pom'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 166')
            end
        else
            disp('blad 195')
        end
    else              
               
               
               
              % f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if (e==1 && f==1)
                   D={'rozowa';'DK roz-pom';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==1 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'rozowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'rozowa'))==1
                           g=find(strcmp(D1(1,:),'rozowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'DK roz-pom'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'rozowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'DK roz-pom'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               elseif (e==2 && f==1)
                   D={'pomaranczowa';'DK roz-pom';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==2 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'pomaranczowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'pomaranczowa'))==1
                           g=find(strcmp(D1(1,:),'pomaranczowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'DK roz-pom'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'pomaranczowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'DK roz-pom'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
               end
    end
               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

           elseif c5(4)==1
               e=input('ktorego koloru chesz uzyc 1-czerwony 2-zolty 0-cofnij ')
               
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
            if e==1
                D1(1,k)={'czerwona'};
            elseif e==2
                D1(1,k)={'zolta'};
            else
            end
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'DK cze-zol'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'DK cze-zol'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 166')
            end
        elseif strcmp(D1(1,m),'')==1
            if e==1
                D1(1,m)={'czerwona'};
            elseif e==2
                D1(1,m)={'zolta'};
            else
            end
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'DK cze-zol'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'DK cze-zol'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 166')
            end
        else
            disp('blad 195')
        end
    else             
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if (e==1 && f==1)
                   D={'czerwona';'DK cze-zol';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==1 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'czerwona'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'czerwona'))==1
                           g=find(strcmp(D1(1,:),'czerwona')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'DK cze-zol'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'czerwona')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'DK cze-zol'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               elseif (e==2 && f==1)
                   D={'zolta';'DK cze-zol';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==2 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'zolta'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'zolta'))==1
                           g=find(strcmp(D1(1,:),'zolta')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'DK cze-zol'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'zolta')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'DK cze-zol'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
               end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

           elseif c5(5)==1
               e=input('ktorego koloru chesz uzyc 1-granatowy 2-zielony 0-cofnij ')
               
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
            if e==1
                D1(1,k)={'granatowa'};
            elseif e==2
                D1(1,k)={'zielona'};
            else
            end
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'DK gra-zie'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==1
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            elseif (strcmp(D1(4,k),'')==1 && e==2)
                D1(4,k)={'DK gra-zie'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('nie mozesz postawic granatowej dzialki do dwoch kolorowych dzikich kart')
            end
        elseif strcmp(D1(1,m),'')==1
            if e==1
                D1(1,m)={'granatowa'};
            elseif e==2
                D1(1,m)={'zielona'};
            else
            end
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'DK gra-zie'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==1
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            elseif (strcmp(D1(4,m),'')==1 && e==2)
                D1(4,m)={'DK gra-zie'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('nie mozesz postawic granatowej dzialki do dwoch kolorowych dzikich kart')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if (e==1 && f==1)
                   D={'granatowa';'DK gra-zie';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==1 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'granatowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'granatowa'))==1
                           g=find(strcmp(D1(1,:),'granatowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3)
                               D1(h,g)={'DK gra-zie'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               S1(1,2)=S1(1,2)+1;
                               disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'granatowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3)
                                   D1(k,h)={'DK gra-zie'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               elseif (e==2 && f==1)
                   D={'zielona';'DK gra-zie';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==2 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'zielona'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'zielona'))==1
                           g=find(strcmp(D1(1,:),'zielona')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'DK gra-zie'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'zielona')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'DK gra-zie'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
               end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%               
               
           elseif c5(6)==1
               e=input('ktorego koloru chesz uzyc 1-zielony 2-czarny 0-cofnij ')
               
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
            if e==1
                D1(1,k)={'zielona'};
            elseif e==2
                D1(1,k)={'czarna'};
            else
            end
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'DK zie-cza'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'DK zie-cza'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==1
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            else
                disp('blad 166')
            end
        elseif strcmp(D1(1,m),'')==1
            if e==1
                D1(1,m)={'zielona'};
            elseif e==2
                D1(1,m)={'czarna'};
            else
            end
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'DK zie-cza'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'DK zie-cza'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==1
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            else
                disp('blad 166')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if (e==1 && f==1)
                   D={'zielona';'DK zie-cza';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==1 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'zielona'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'zielona'))==1
                           g=find(strcmp(D1(1,:),'zielona')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'DK zie-cza'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'zielona')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'DK zie-cza'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               elseif (e==2 && f==1)
                   D={'czarna';'DK zie-cza';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==2 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'czarna'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'czarna'))==1
                           g=find(strcmp(D1(1,:),'czarna')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4||h==5)
                               D1(h,g)={'DK zie-cza'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==5
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'czarna')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4||k==5)
                                   D1(k,h)={'DK zie-cza'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==5
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
               end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
               
           elseif c5(7)==1
               e=input('ktorego koloru chesz uzyc 1-czarny 2-oliwkowy 0-cofnij ')
               
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
            if e==1
                D1(1,k)={'czarna'};
            elseif e==2
                D1(1,k)={'oliwkowa'};
            else
            end
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'DK cza-oli'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==2
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            elseif (strcmp(D1(4,k),'')==1 && e==1)
                D1(4,k)={'DK cza-oli'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            else
                disp('nie mozesz postawic oliwkowej dzialki do dwoch kolorowych dzikich kart')
            end
        elseif strcmp(D1(1,m),'')==1
            if e==1
                D1(1,m)={'czarna'};
            elseif e==2
                D1(1,m)={'oliwkowa'};
            else
            end
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'DK cza-oli'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                if e==2
                    S1(1,2)=S1(1,2)+1;
                    disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                else
                end
            elseif (strcmp(D1(4,m),'')==1 && e==1)
                D1(4,m)={'DK cza-oli'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            else
                disp('nie mozesz postawic oliwkowej dzialki do dwoch kolorowych dzikich kart')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if (e==1 && f==1)
                   D={'czarna';'DK cza-oli';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==1 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'czarna'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'czarna'))==1
                           g=find(strcmp(D1(1,:),'czarna')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4||h==5)
                               D1(h,g)={'DK cza-oli'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==5
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'czarna')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4||k==5)
                                   D1(k,h)={'DK cza-oli'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==5
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               elseif (e==2 && f==1)
                   D={'oliwkowa';'DK cza-oli';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (e==2 && f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'oliwkowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'oliwkowa'))==1
                           g=find(strcmp(D1(1,:),'oliwkowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3)
                               D1(h,g)={'DK cza-oli'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               S1(1,2)=S1(1,2)+1;
                               disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'oliwkowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3)
                                   D1(k,h)={'DK cza-oli'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
               end
    end
               
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     kolorowa dzika karta          

           elseif c5(8)==1
                              
               
               
               e=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if e==1
                   S1(1,1)=S1(1,1)+1;
                   D={'';'DK kolorowa';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif e==2
                   E=size(D1);
                   if E(1,2)==0
                       disp('nie posiadasz zadnej dzialki')
                   elseif E(1,2)==1
                       if (strcmp(D(1,1),'niebieska')==1||strcmp(D(1,1),'rozowa')==1||strcmp(D(1,1),'pomaranczowa')==1||strcmp(D(1,1),'czerwona')==1||strcmp(D(1,1),'zolta')==1||strcmp(D(1,1),'zielona')==1)
                           k=min(find(strcmp(D1(:,1),'')));
                           if (k==3||k==4)
                               D1(k,1)={'DK kolorowa'};
                               D1
                               P1(a)=[];
                               d=d+1;
                               if k==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       elseif (strcmp(D(1,1),'brazowa')==1||strcmp(D(1,1),'granatowa')==1||strcmp(D(1,1),'oliwkowa')==1)
                           k=min(find(strcmp(D1(:,1),'')));
                           if (k==3)
                               D1(k,1)={'DK kolorowa'};
                               D1
                               P1(a)=[];
                               d=d+1;
                               S1(1,2)=S1(1,2)+1;
                               disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                           else
                               disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       elseif (strcmp(D(1,1),'czarna')==1)
                           k=min(find(strcmp(D1(:,1),'')));
                           if (k==3||k==4||k==5)
                               D1(k,1)={'DK kolorowa'};
                               D1
                               P1(a)=[];
                               d=d+1;
                               if k==5
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       elseif (strcmp(D(2,1),'DK kolorowa')==1 && strcmp(D(1,1),'')==1)
                           D1(3,1)={'DK kolorowa'};
                           D1
                           P1(a)=[];
                           d=d+1;
                           %disp('nie moga wystepowac dwie kolorowe dzikie karty bez dzielnicy o ustalonym kolorze')
                       else
                           disp('blad 1331')
                       end
                   else
                       h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                       if (strcmp(D(1,h),'niebieska')==1||strcmp(D(1,h),'rozowa')==1||strcmp(D(1,h),'pomaranczowa')==1||strcmp(D(1,h),'czerwona')==1||strcmp(D(1,h),'zolta')==1||strcmp(D(1,h),'zielona')==1)
                           k=min(find(strcmp(D1(:,h),'')));
                           if (k==3||k==4)
                               D1(k,h)={'DK kolorowa'};
                               D1
                               P1(a)=[];
                               d=d+1;
                               if k==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       elseif (strcmp(D(1,h),'brazowa')==1||strcmp(D(1,h),'granatowa')==1||strcmp(D(1,h),'oliwkowa')==1)
                           k=min(find(strcmp(D1(:,h),'')));
                           if (k==3)
                               D1(k,h)={'DK kolorowa'};
                               D1
                               P1(a)=[];
                               d=d+1;
                               S1(1,2)=S1(1,2)+1;
                               disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                           else
                               disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       elseif (strcmp(D(1,h),'czarna')==1)
                           k=min(find(strcmp(D1(:,h),'')));
                           if (k==3||k==4||k==5)
                               D1(k,h)={'DK kolorowa'};
                               D1
                               P1(a)=[];
                               d=d+1;
                               if k==5
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end                               
                           else
                               disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       elseif (strcmp(D(2,h),'DK kolorowa')==1 && strcmp(D(1,h),'')==1)
                           D1(3,h)={'DK kolorowa'};
                           D1
                           P1(a)=[];
                           d=d+1;
                       else
                           disp('blad 1383')
                       end
                   end
               else
               end

                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  brazowa           
               
           elseif c5(9)==1
                   
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'brazowa'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D brazowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('nie mozesz postawic brazowej dzialki do dwoch kolorowych dzikich kart')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'brazowa'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D brazowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])                
            else
                disp('nie mozesz postawic brazowej dzialki do dwoch kolorowych dzikich kart')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if (f==1)
                   D={'brazowa';'D brazowa';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'brazowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'brazowa'))==1
                           g=find(strcmp(D1(1,:),'brazowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3)
                               D1(h,g)={'D brazowa'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               S1(1,2)=S1(1,2)+1;
                               disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'brazowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3)
                                   D1(k,h)={'D brazowa'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('cofnij')
               end
    end
                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% niebieska
    
           elseif c5(10)==1        
                   
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'niebieska'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D niebieska'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'D niebieska'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1272')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'niebieska'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D niebieska'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'D niebieska'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])                
            else
                disp('blad 1287')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if f==1
                   D={'niebieska';'D niebieska';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif f==2
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'niebieska'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'niebieska'))==1
                           g=find(strcmp(D1(1,:),'niebieska')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'D niebieska'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'niebieska')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'D niebieska'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('cofnij')
               end
    end               
               
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rozowa
 
            elseif c5(11)==1
                
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'rozowa'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D rozowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'D rozowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1272')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'rozowa'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D rozowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'D rozowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1287')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if f==1
                   D={'rozowa';'D rozowa';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif f==2
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'rozowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'rozowa'))==1
                           g=find(strcmp(D1(1,:),'rozowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'D rozowa'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'rozowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'D rozowa'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('cofnij')
               end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% pomaranczowa
    
    
            elseif c5(12)==1
                
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'pomaranczowa'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D pomaranczowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'D pomaranczowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1272')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'pomaranczowa'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D pomaranczowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'D pomaranczowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])                
            else
                disp('blad 1287')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if f==1
                   D={'pomaranczowa';'D pomaranczowa';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif f==2
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'pomaranczowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'pomaranczowa'))==1
                           g=find(strcmp(D1(1,:),'pomaranczowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'D pomaranczowa'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'pomaranczowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'D pomaranczowa'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('cofnij')
               end
    end                
               
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% czerwona
    
               elseif c5(13)==1 
                   
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'czerwona'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D czerwona'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'D czerwona'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1272')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'czerwona'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D czerwona'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'D czerwona'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1287')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if f==1
                   D={'czerwona';'D czerwona';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif f==2
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'czerwona'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'czerwona'))==1
                           g=find(strcmp(D1(1,:),'czerwona')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'D czerwona'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'czerwona')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'D czerwona'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('cofnij')
               end
    end       
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% zolta
                   
               elseif c5(14)==1
                   
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'zolta'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D zolta'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'D zolta'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1272')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'zolta'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D zolta'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'D zolta'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1287')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if f==1
                   D={'zolta';'D zolta';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif f==2
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'zolta'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'zolta'))==1
                           g=find(strcmp(D1(1,:),'zolta')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'D zolta'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'zolta')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'D zolta'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('cofnij')
               end
    end                  
                   
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% zielona  
 
                elseif c5(15)==1
                    
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'zielona'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D zielona'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'D zielona'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1272')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'zielona'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D zielona'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'D zielona'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('blad 1287')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if f==1
                   D={'zielona';'D zielona';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif f==2
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'zielona'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'zielona'))==1
                           g=find(strcmp(D1(1,:),'zielona')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4)
                               D1(h,g)={'D zielona'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==4
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'zielona')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4)
                                   D1(k,h)={'D zielona'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==4
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('cofnij')
               end
    end                     
                    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% granatowa

           elseif c5(16)==1

if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'granatowa'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D granatowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('nie mozesz postawic granatowej dzialki do dwoch kolorowych dzikich kart')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'granatowa'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D granatowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('nie mozesz postawic granatowej dzialki do dwoch kolorowych dzikich kart')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if (f==1)
                   D={'granatowa';'D granatowa';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'granatowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'granatowa'))==1
                           g=find(strcmp(D1(1,:),'granatowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3)
                               D1(h,g)={'D granatowa'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               S1(1,2)=S1(1,2)+1;
                               disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'granatowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3)
                                   D1(k,h)={'D granatowa'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('cofnij')
               end
    end               
            
    %%%%%%%%%%%%%%%%%%%%% czarna
    
           elseif c5(17)==1
               
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'czarna'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D czarna'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,k),'')==1
                D1(4,k)={'D czarna'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            else
                disp('blad 1921')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'czarna'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D czarna'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            elseif strcmp(D1(4,m),'')==1
                D1(4,m)={'D czarna'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
            else
                disp('blad 1936')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if f==1
                   D={'czarna';'D czarna';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif f==2
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'czarna'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'czarna'))==1
                           g=find(strcmp(D1(1,:),'czarna')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3||h==4||h==5)
                               D1(h,g)={'D czarna'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               if h==5
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                               end
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'czarna')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3||k==4||k==5)
                                   D1(k,h)={'D czarna'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   if k==5
                                       S1(1,2)=S1(1,2)+1;
                                       disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                                   else
                                   end
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('blad 1986')
               end
    end               
               
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% oliwkowa   
    
           elseif c5(18)==1
               
if S1(1,1)>0
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 3-dostaw dzialke do kolorwej dzikiej karty 0-cofnij')
else
    f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
end
    if (f==3 && S1(1,1)>0)
        k=min(find(strcmp(D1(2,:),'DK kolorowa')));
        m=max(find(strcmp(D1(2,:),'DK kolorowa')));
        if strcmp(D1(1,k),'')==1
                D1(1,k)={'oliwkowa'};
            if strcmp(D1(3,k),'')==1
                D1(3,k)={'D oliwkowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('nie mozesz postawic oliwkowej dzialki do dwoch kolorowych dzikich kart')
            end
        elseif strcmp(D1(1,m),'')==1
                D1(1,m)={'oliwkowa'};
            if strcmp(D1(3,m),'')==1
                D1(3,m)={'D oliwkowa'};
                P1(a)=[];
                d=d+1;
                S1(1,1)=S1(1,1)-1;
                S1(1,2)=S1(1,2)+1;
                disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
            else
                disp('nie mozesz postawic oliwkowej dzialki do dwoch kolorowych dzikich kart')
            end
        else
            disp('blad 195')
        end
    else               
               
               %f=input('jak chcesz uzyc dzialki 1-utworz nowa dzielnice 2-dostaw dzialke do istniejacej dzielnicy 0-cofnij ')
               if (f==1)
                   D={'oliwkowa';'D oliwkowa';'';'';'';''};
                   D1=[D1 D]
                   P1(a)=[];
                   d=d+1;
               elseif (f==2)
                   if size(D1)>0
                       if sum(strcmp(D1(1,:),'oliwkowa'))==0
                           disp('nie masz zadnej dzialki o tym kolorze')
                       elseif sum(strcmp(D1(1,:),'oliwkowa'))==1
                           g=find(strcmp(D1(1,:),'oliwkowa')==1);
                           h=min(find(strcmp(D1(:,g),'')));
                           if (h==3)
                               D1(h,g)={'D oliwkowa'};
                               %D1=[D1 D]
                               D1
                               P1(a)=[];
                               d=d+1;
                               S1(1,2)=S1(1,2)+1;
                               disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                           else
                               disp('w posiadanej dzielnicy nie ma miejsca na ta dzialke')
                           end
                       else
                           h=input('wybierz dzielnice do ktorej chcesz dostawic dzialke')
                           if strcmp(D1(1,h),'oliwkowa')==1
                               k=min(find(strcmp(D1(:,h),'')));
                               if (k==3)
                                   D1(k,h)={'D oliwkowa'};
                                   %D1=[D1 D]
                                   D1
                                   P1(a)=[];
                                   d=d+1;
                                   S1(1,2)=S1(1,2)+1;
                                   disp(['masz ' num2str(S1(1,2)) ' pelnych dzialek'])
                               else
                                   disp('w podanej dzielnicy nie ma miejsca na ta dzialke')
                               end
                           else
                               disp('w podanej kolumnie nie znajduja sie dzialki w kolorze uzywanej karty')
                           end
                       end
                   else
                       disp('nie masz zadnej dzialki')
                   end
               else
                   disp('cofnij')
               end
    end               
               
     %%%%%%%%%%%%%%%%%%%%%%%%%%%  
           else
               disp('niezidentyfikowana dzialka')
           end
       else
           disp('cofnij')
       end
   else
       disp('cofnij')
   end 
end