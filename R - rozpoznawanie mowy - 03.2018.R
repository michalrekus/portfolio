library("tuneR", lib.loc="~/R/win-library/3.3")
library("seewave", lib.loc="~/R/win-library/3.3")

s6<-readWave("d:/hobby/DSP/imiona01.wav")
plot(s6)
s1<-s6[1]
class(s6)
s1[0]

spectrum(s6)
fft(s6)
play(s6)


diffenv
diffspec

s1<-drawenv(s6,f=8000,n=30,plot=F,listen=F,output = "matrix")
s1
plot(s1)
plot(s1[0:500])
max(s1)
s2<-env(s6,f=10000,envt="hil",msmooth=NULL,ksmooth=NULL,ssmooth=500,norm=F,plot=T,k=1,j=1)
plot(s2)
plot(s2[0:500])

s2[0:1000]
length(s2)
s2[s2<0]
avg(s2)
max(s3)
min(s2)
s3<-s2
s3<- s3 / max(s3)
plot(s3)
plot(Ag)

while (mean(s3[0:5000]) < 0.05 && length(s3) >= 5000)
{
  s3<-s3[-0:-5000];
}
Ag <- vector(mode="numeric", length=0)
while (mean(s3[0:10000]) > 0.05 && length(s3) >= 10000)
{
  Ag<-rbind(Ag,data.matrix(s3[0:10000]));
  s3<-s3[-0:-10000];
}

while (mean(s3[0:5000]) < 0.05 && length(s3) >= 5000)
{
  s3<-s3[-0:-5000];
}
Do <- vector(mode="numeric", length=0)
while (mean(s3[0:10000]) > 0.05 && length(s3) >= 10000)
{
  Do<-rbind(Do,data.matrix(s3[0:10000]));
  s3<-s3[-0:-10000];
}

while (mean(s3[0:5000]) < 0.05 && length(s3) >= 5000)
{
  s3<-s3[-0:-5000];
}
Ma <- vector(mode="numeric", length=0)
while (mean(s3[0:10000]) > 0.05 && length(s3) >= 10000)
{
  Ma<-rbind(Ma,data.matrix(s3[0:10000]));
  s3<-s3[-0:-10000];
}

while (mean(s3[0:5000]) < 0.05 && length(s3) >= 5000)
{
  s3<-s3[-0:-5000];
}
Se <- vector(mode="numeric", length=0)
while (mean(s3[0:10000]) > 0.05 && length(s3) >= 10000)
{
  Se<-rbind(Se,data.matrix(s3[0:10000]));
  s3<-s3[-0:-10000];
}

while (mean(s3[0:5000]) < 0.05 && length(s3) >= 5000)
{
  s3<-s3[-0:-5000];
}
Ba <- vector(mode="numeric", length=0)
while (mean(s3[0:10000]) > 0.05 && length(s3) >= 10000)
{
  Ba<-rbind(Ba,data.matrix(s3[0:10000]));
  s3<-s3[-0:-10000];
}

while (mean(s3[0:5000]) < 0.05 && length(s3) >= 5000)
{
  s3<-s3[-0:-5000];
}
Ka <- vector(mode="numeric", length=0)
while (mean(s3[0:10000]) > 0.05 && length(s3) >= 10000)
{
  Ka<-rbind(Ka,data.matrix(s3[0:10000]));
  s3<-s3[-0:-10000];
}

while (mean(s3[0:5000]) < 0.05 && length(s3) >= 5000)
{
  s3<-s3[-0:-5000];
}
Ja <- vector(mode="numeric", length=0)
while (mean(s3[0:10000]) > 0.05 && length(s3) >= 10000)
{
  Ja<-rbind(Ja,data.matrix(s3[0:10000]));
  s3<-s3[-0:-10000];
}

while (mean(s3[0:5000]) < 0.05 && length(s3) >= 5000)
{
  s3<-s3[-0:-5000];
}
Pa <- vector(mode="numeric", length=0)
while (mean(s3[0:10000]) > 0.05 && length(s3) >= 10000)
{
  Pa<-rbind(Pa,data.matrix(s3[0:10000]));
  s3<-s3[-0:-10000];
}

while (mean(s3[0:5000]) < 0.05 && length(s3) >= 5000)
{
  s3<-s3[-0:-5000];
}
Fr <- vector(mode="numeric", length=0)
while (mean(s3[0:10000]) > 0.05 && length(s3) >= 10000)
{
  Fr<-rbind(Fr,data.matrix(s3[0:10000]));
  s3<-s3[-0:-10000];
}
length(Ag)
length(Do)
length(Ma)
length(Se)
length(Ba)
length(Ka)
length(Ja)
length(Pa)
length(Fr)

AgM <- vector(mode="numeric", length=1000)
Ag <- Ag / max(Ag)
a<-0
for (a in 0:999)
{
AgM[a] <- mean(Ag[(a*length(Ag)/1000):((a+1)*length(Ag)/1000)])
}

DoM <- vector(mode="numeric", length=1000)
Do <- Do / max(Do)
a<-0
for (a in 0:999)
{
  DoM[a] <- mean(Do[(a*length(Do)/1000):((a+1)*length(Do)/1000)])
}

MaM <- vector(mode="numeric", length=1000)
Ma <- Ma / max(Ma)
a<-0
for (a in 0:999)
{
  MaM[a] <- mean(Ma[(a*length(Ma)/1000):((a+1)*length(Ma)/1000)])
}

SeM <- vector(mode="numeric", length=1000)
Se <- Se / max(Se)
a<-0
for (a in 0:999)
{
  SeM[a] <- mean(Se[(a*length(Se)/1000):((a+1)*length(Se)/1000)])
}

BaM <- vector(mode="numeric", length=1000)
Ba <- Ba / max(Ba)
a<-0
for (a in 0:999)
{
  BaM[a] <- mean(Ba[(a*length(Ba)/1000):((a+1)*length(Ba)/1000)])
}

KaM <- vector(mode="numeric", length=1000)
Ka <- Ka / max(Ka)
a<-0
for (a in 0:999)
{
  KaM[a] <- mean(Ka[(a*length(Ka)/1000):((a+1)*length(Ka)/1000)])
}

JaM <- vector(mode="numeric", length=1000)
Ja <- Ja / max(Ja)
a<-0
for (a in 0:999)
{
  JaM[a] <- mean(Ja[(a*length(Ja)/1000):((a+1)*length(Ja)/1000)])
}

PaM <- vector(mode="numeric", length=1000)
Pa <- Pa / max(Pa)
a<-0
for (a in 0:999)
{
  PaM[a] <- mean(Pa[(a*length(Pa)/1000):((a+1)*length(Pa)/1000)])
}

FrM <- vector(mode="numeric", length=1000)
Fr <- Fr / max(Fr)
a<-0
for (a in 0:999)
{
  FrM[a] <- mean(Fr[(a*length(Fr)/1000):((a+1)*length(Fr)/1000)])
}

length(AgM)

################
r6<-readWave("d:/hobby/DSP/imiona02.wav")
r2<-env(r6,f=10000,envt="hil",msmooth=NULL,ksmooth=NULL,ssmooth=500,norm=F,plot=T,k=1,j=1)
r3<-r2
r3<- r3 / max(r3)
plot(r3)
plot(FrT)
plot(Fr)

while (mean(r3[0:5000]) < 0.13 && length(r3) >= 5000)
{
  r3<-r3[-0:-5000];
}
DoT <- vector(mode="numeric", length=0)
while (mean(r3[0:10000]) > 0.13 && length(r3) >= 10000)
{
  DoT<-rbind(DoT,data.matrix(r3[0:10000]));
  r3<-r3[-0:-10000];
}

while (mean(r3[0:5000]) < 0.13 && length(r3) >= 5000)
{
  r3<-r3[-0:-5000];
}
SeT <- vector(mode="numeric", length=0)
while (mean(r3[0:10000]) > 0.13 && length(r3) >= 10000)
{
  SeT<-rbind(SeT,data.matrix(r3[0:10000]));
  r3<-r3[-0:-10000];
}

while (mean(r3[0:5000]) < 0.13 && length(r3) >= 5000)
{
  r3<-r3[-0:-5000];
}
KaT <- vector(mode="numeric", length=0)
while (mean(r3[0:10000]) > 0.13 && length(r3) >= 10000)
{
  KaT<-rbind(KaT,data.matrix(r3[0:10000]));
  r3<-r3[-0:-10000];
}

while (mean(r3[0:5000]) < 0.13 && length(r3) >= 5000)
{
  r3<-r3[-0:-5000];
}
PaT <- vector(mode="numeric", length=0)
while (mean(r3[0:10000]) > 0.13 && length(r3) >= 10000)
{
  PaT<-rbind(PaT,data.matrix(r3[0:10000]));
  r3<-r3[-0:-10000];
}

while (mean(r3[0:5000]) < 0.13 && length(r3) >= 5000)
{
  r3<-r3[-0:-5000];
}
AgT <- vector(mode="numeric", length=0)
while (mean(r3[0:10000]) > 0.13 && length(r3) >= 10000)
{
  AgT<-rbind(AgT,data.matrix(r3[0:10000]));
  r3<-r3[-0:-10000];
}

while (mean(r3[0:5000]) < 0.13 && length(r3) >= 5000)
{
  r3<-r3[-0:-5000];
}
MaT <- vector(mode="numeric", length=0)
while (mean(r3[0:10000]) > 0.13 && length(r3) >= 10000)
{
  MaT<-rbind(MaT,data.matrix(r3[0:10000]));
  r3<-r3[-0:-10000];
}

while (mean(r3[0:5000]) < 0.13 && length(r3) >= 5000)
{
  r3<-r3[-0:-5000];
}
BaT <- vector(mode="numeric", length=0)
while (mean(r3[0:10000]) > 0.13 && length(r3) >= 10000)
{
  BaT<-rbind(BaT,data.matrix(r3[0:10000]));
  r3<-r3[-0:-10000];
}

while (mean(r3[0:5000]) < 0.13 && length(r3) >= 5000)
{
  r3<-r3[-0:-5000];
}
JaT <- vector(mode="numeric", length=0)
while (mean(r3[0:10000]) > 0.13 && length(r3) >= 10000)
{
  JaT<-rbind(JaT,data.matrix(r3[0:10000]));
  r3<-r3[-0:-10000];
}

while (mean(r3[0:5000]) < 0.13 && length(r3) >= 5000)
{
  r3<-r3[-0:-5000];
}
FrT <- vector(mode="numeric", length=0)
while (mean(r3[0:10000]) > 0.13 && length(r3) >= 10000)
{
  FrT<-rbind(FrT,data.matrix(r3[0:10000]));
  r3<-r3[-0:-10000];
}

### œrednie dla testowego

AgMT <- vector(mode="numeric", length=1000)
AgT <- AgT / max(AgT)
a<-0
for (a in 0:999)
{
  AgMT[a] <- mean(AgT[(a*length(AgT)/1000):((a+1)*length(AgT)/1000)])
}

DoMT <- vector(mode="numeric", length=1000)
DoT <- DoT / max(DoT)
a<-0
for (a in 0:999)
{
  DoMT[a] <- mean(DoT[(a*length(DoT)/1000):((a+1)*length(DoT)/1000)])
}

MaMT <- vector(mode="numeric", length=1000)
MaT <- MaT / max(MaT)
a<-0
for (a in 0:999)
{
  MaMT[a] <- mean(MaT[(a*length(MaT)/1000):((a+1)*length(MaT)/1000)])
}

SeMT <- vector(mode="numeric", length=1000)
SeT <- SeT / max(SeT)
a<-0
for (a in 0:999)
{
  SeMT[a] <- mean(SeT[(a*length(SeT)/1000):((a+1)*length(SeT)/1000)])
}

BaMT <- vector(mode="numeric", length=1000)
BaT <- BaT / max(BaT)
a<-0
for (a in 0:999)
{
  BaMT[a] <- mean(BaT[(a*length(BaT)/1000):((a+1)*length(BaT)/1000)])
}

KaMT <- vector(mode="numeric", length=1000)
KaT <- KaT / max(KaT)
a<-0
for (a in 0:999)
{
  KaMT[a] <- mean(KaT[(a*length(KaT)/1000):((a+1)*length(KaT)/1000)])
}

JaMT <- vector(mode="numeric", length=1000)
JaT <- JaT / max(JaT)
a<-0
for (a in 0:999)
{
  JaMT[a] <- mean(JaT[(a*length(JaT)/1000):((a+1)*length(JaT)/1000)])
}

PaMT <- vector(mode="numeric", length=1000)
PaT <- PaT / max(PaT)
a<-0
for (a in 0:999)
{
  PaMT[a] <- mean(PaT[(a*length(PaT)/1000):((a+1)*length(PaT)/1000)])
}

FrMT <- vector(mode="numeric", length=1000)
FrT <- FrT / max(FrT)
a<-0
for (a in 0:999)
{
  FrMT[a] <- mean(FrT[(a*length(FrT)/1000):((a+1)*length(FrT)/1000)])
}

TeM<-FrMT

Com <- vector(mode="numeric", length=9)
Com <- c(sum(abs(AgM-TeM)),sum(abs(DoM-TeM)),sum(abs(MaM-TeM)),sum(abs(SeM-TeM)),sum(abs(BaM-TeM)),sum(abs(KaM-TeM)),sum(abs(JaM-TeM)),sum(abs(PaM-TeM)),sum(abs(FrM-TeM)))
match(Com,min(Com))

plot(s6)
plot(Ag)

s5<-hilbert(s6)
s5<-Im(s5)
s5 <- s5 / max(s5)

while (mean(abs(s5[0:5000])) < 0.05 && length(s5) >= 5000)
{
  s5<-s5[-0:-5000];
}
Ag <- vector(mode="numeric", length=0)
while (mean(abs(s5[0:10000])) > 0.05 && length(s5) >= 10000)
{
  Ag<-rbind(Ag,data.matrix(s5[0:10000]));
  s5<-s5[-0:-10000];
}
while (mean(abs(s5[0:5000])) < 0.05 && length(s5) >= 5000)
{
  s5<-s5[-0:-5000];
}
Do <- vector(mode="numeric", length=0)
while (mean(abs(s5[0:10000])) > 0.05 && length(s5) >= 10000)
{
  Do<-rbind(Do,data.matrix(s5[0:10000]));
  s5<-s5[-0:-10000];
}


s4<-spectrum(s5)
s5<-channel(s6, which=c("left"))
class(s5)
lpc2cep(s6)
ts(s5,start=1,end=30000,frequency = 44100)

s6[0]>10
corenv(Ag,Ag,f=44100, envt="hil",msmooth = NULL, ksmooth = kernel("daniell",500), plot = FALSE, plotval = FALSE, method = "pearson")


## samog³oski trening
t6<-readWave("d:/hobby/DSP/samogloski03.wav")
t5<-hilbert(t6)
t5<-Im(t5)
t5 <- t5 / max(t5)
#t5 <- t5a
#plot(t5)
#plot(yy)
#t5<-t5[-0:-10000];


while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
aa <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  aa<-rbind(aa,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
ee <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  ee<-rbind(ee,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
ii <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  ii<-rbind(ii,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
oo <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  oo<-rbind(oo,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
uu <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  uu<-rbind(uu,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
yy <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  yy<-rbind(yy,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}


aas<-spec.pgram(aa,spans=c(400,200))
ees<-spec.pgram(ee,spans=c(400,200))
iis<-spec.pgram(ii,spans=c(400,200))
oos<-spec.pgram(oo,spans=c(400,200))
uus<-spec.pgram(uu,spans=c(400,200))
yys<-spec.pgram(yy,spans=c(400,200))
aas<-unlist(aas[2])
ees<-unlist(ees[2])
iis<-unlist(iis[2])
oos<-unlist(oos[2])
uus<-unlist(uus[2])
yys<-unlist(yys[2])
aaq<-aas[1:300]
eeq<-ees[1:300]
iiq<-iis[1:300]
ooq<-oos[1:300]
uuq<-uus[1:300]
yyq<-yys[1:300]

## samog³oski trening
t6<-readWave("d:/hobby/DSP/samogloski01.wav")
t5<-hilbert(t6)
t5<-Im(t5)
t5 <- t5 / max(t5)
#t5 <- t5a
#plot(t5)
#plot(yy)
#t5<-t5[-0:-10000];


while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
aa <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  aa<-rbind(aa,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
ee <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  ee<-rbind(ee,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
ii <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  ii<-rbind(ii,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
oo <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  oo<-rbind(oo,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
uu <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  uu<-rbind(uu,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
yy <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  yy<-rbind(yy,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}


aas<-spec.pgram(aa,spans=c(400,200))
ees<-spec.pgram(ee,spans=c(400,200))
iis<-spec.pgram(ii,spans=c(400,200))
oos<-spec.pgram(oo,spans=c(400,200))
uus<-spec.pgram(uu,spans=c(400,200))
yys<-spec.pgram(yy,spans=c(400,200))
aas<-unlist(aas[2])
ees<-unlist(ees[2])
iis<-unlist(iis[2])
oos<-unlist(oos[2])
uus<-unlist(uus[2])
yys<-unlist(yys[2])
aap<-aas[1:300]
eep<-ees[1:300]
iip<-iis[1:300]
oop<-oos[1:300]
uup<-uus[1:300]
yyp<-yys[1:300]


## samog³oski trening
t6<-readWave("d:/hobby/DSP/samogloski02.wav")
t5<-hilbert(t6)
t5<-Im(t5)
t5 <- t5 / max(t5)
#t5 <- t5a
#plot(t5)
#plot(yy)
#t5<-t5[-0:-10000];


while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
aa <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  aa<-rbind(aa,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
ee <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  ee<-rbind(ee,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
ii <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  ii<-rbind(ii,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
oo <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  oo<-rbind(oo,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
uu <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  uu<-rbind(uu,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
yy <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  yy<-rbind(yy,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}


aas<-spec.pgram(aa,spans=c(400,200))
ees<-spec.pgram(ee,spans=c(400,200))
iis<-spec.pgram(ii,spans=c(400,200))
oos<-spec.pgram(oo,spans=c(400,200))
uus<-spec.pgram(uu,spans=c(400,200))
yys<-spec.pgram(yy,spans=c(400,200))
aas<-unlist(aas[2])
ees<-unlist(ees[2])
iis<-unlist(iis[2])
oos<-unlist(oos[2])
uus<-unlist(uus[2])
yys<-unlist(yys[2])
aas<-aas[1:300]
ees<-ees[1:300]
iis<-iis[1:300]
oos<-oos[1:300]
uus<-uus[1:300]
yys<-yys[1:300]


#aas<-spectrum(aa)
#ees<-spectrum(ee)
#iis<-spectrum(ii)
#oos<-spectrum(oo)
#uus<-spectrum(uu)
#yys<-spectrum(yy)
#aat<-env(aat,f=10000,envt="hil",msmooth=NULL,ksmooth=NULL,ssmooth=500,norm=F,plot=T,k=1,j=1)
#
#aas1<-unlist(aas[1])
#aas2<-unlist(aas[2])
#aat<-c(aas1,aas2)
#ees1<-unlist(ees[1])
#ees2<-unlist(ees[2])
#eet<-c(ees1,ees2)
#plot(eet)
#plot(aas)
#plot(ees)



## samog³oski test
t6<-readWave("d:/hobby/DSP/samogloski04.wav")
t5<-hilbert(t6)
t5<-Im(t5)
t5 <- t5 / max(t5)
#t5 <- t5a
#plot(t5)
#plot(yy)
#t5<-t5[-0:-10000];


while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
aa <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  aa<-rbind(aa,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
ee <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  ee<-rbind(ee,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
ii <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  ii<-rbind(ii,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
oo <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  oo<-rbind(oo,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
uu <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  uu<-rbind(uu,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}
t5<-t5[-0:-10000];

while (mean(abs(t5[0:2000])) < 0.10 && length(t5) >= 2000)
{
  t5<-t5[-0:-2000];
}
yy <- vector(mode="numeric", length=0)
while (mean(abs(t5[0:2000])) > 0.10 && length(t5) >= 2000)
{
  yy<-rbind(yy,data.matrix(t5[0:2000]));
  t5<-t5[-0:-2000];
}

aat<-spec.pgram(aa,spans=c(400,200))
eet<-spec.pgram(ee,spans=c(400,200))
iit<-spec.pgram(ii,spans=c(400,200))
oot<-spec.pgram(oo,spans=c(400,200))
uut<-spec.pgram(uu,spans=c(400,200))
yyt<-spec.pgram(yy,spans=c(400,200))
aat<-unlist(aat[2])
eet<-unlist(eet[2])
iit<-unlist(iit[2])
oot<-unlist(oot[2])
uut<-unlist(uut[2])
yyt<-unlist(yyt[2])
aat<-aat[1:300]
eet<-eet[1:300]
iit<-iit[1:300]
oot<-oot[1:300]
uut<-uut[1:300]
yyt<-yyt[1:300]


A=c(min(sum(abs(aas-aat)),sum(abs(aap-aat)),sum(abs(aaq-aat))), min(sum(abs(ees-aat)),sum(abs(eep-aat)),sum(abs(eeq-aat))), min(sum(abs(iis-aat)),sum(abs(iip-aat)),sum(abs(iiq-aat))), min(sum(abs(oos-aat)),sum(abs(oop-aat)),sum(abs(ooq-aat))), min(sum(abs(uus-aat)),sum(abs(uup-aat)),sum(abs(uuq-aat))), min(sum(abs(yys-aat)),sum(abs(yyp-aat)),sum(abs(yyq-aat))))
B=c(min(sum(abs(aas-eet)),sum(abs(aap-eet)),sum(abs(aaq-eet))), min(sum(abs(ees-eet)),sum(abs(eep-eet)),sum(abs(eeq-eet))), min(sum(abs(iis-eet)),sum(abs(iip-eet)),sum(abs(iiq-eet))), min(sum(abs(oos-eet)),sum(abs(oop-eet)),sum(abs(ooq-eet))), min(sum(abs(uus-eet)),sum(abs(uup-eet)),sum(abs(uuq-eet))), min(sum(abs(yys-eet)),sum(abs(yyp-eet)),sum(abs(yyq-eet))))
C=c(min(sum(abs(aas-iit)),sum(abs(aap-iit)),sum(abs(aaq-iit))), min(sum(abs(ees-iit)),sum(abs(eep-iit)),sum(abs(eeq-iit))), min(sum(abs(iis-iit)),sum(abs(iip-iit)),sum(abs(iiq-iit))), min(sum(abs(oos-iit)),sum(abs(oop-iit)),sum(abs(ooq-iit))), min(sum(abs(uus-iit)),sum(abs(uup-iit)),sum(abs(uuq-iit))), min(sum(abs(yys-iit)),sum(abs(yyp-iit)),sum(abs(yyq-iit))))
D=c(min(sum(abs(aas-oot)),sum(abs(aap-oot)),sum(abs(aaq-oot))), min(sum(abs(ees-oot)),sum(abs(eep-oot)),sum(abs(eeq-oot))), min(sum(abs(iis-oot)),sum(abs(iip-oot)),sum(abs(iiq-oot))), min(sum(abs(oos-oot)),sum(abs(oop-oot)),sum(abs(ooq-oot))), min(sum(abs(uus-oot)),sum(abs(uup-oot)),sum(abs(uuq-oot))), min(sum(abs(yys-oot)),sum(abs(yyp-oot)),sum(abs(yyq-oot))))
E=c(min(sum(abs(aas-uut)),sum(abs(aap-uut)),sum(abs(aaq-uut))), min(sum(abs(ees-uut)),sum(abs(eep-uut)),sum(abs(eeq-uut))), min(sum(abs(iis-uut)),sum(abs(iip-uut)),sum(abs(iiq-uut))), min(sum(abs(oos-uut)),sum(abs(oop-uut)),sum(abs(ooq-uut))), min(sum(abs(uus-uut)),sum(abs(uup-uut)),sum(abs(uuq-uut))), min(sum(abs(yys-uut)),sum(abs(yyp-uut)),sum(abs(yyq-uut))))
F=c(min(sum(abs(aas-yyt)),sum(abs(aap-yyt)),sum(abs(aaq-yyt))), min(sum(abs(ees-yyt)),sum(abs(eep-yyt)),sum(abs(eeq-yyt))), min(sum(abs(iis-yyt)),sum(abs(iip-yyt)),sum(abs(iiq-yyt))), min(sum(abs(oos-yyt)),sum(abs(oop-yyt)),sum(abs(ooq-yyt))), min(sum(abs(uus-yyt)),sum(abs(uup-yyt)),sum(abs(uuq-yyt))), min(sum(abs(yys-yyt)),sum(abs(yyp-yyt)),sum(abs(yyq-yyt))))
A==min(A)
B==min(B)
C==min(C)
D==min(D)
E==min(E)
F==min(F)
A
B
C
D
E
F

plot(aas)
plot(aat)
plot(ees)
plot(eet)
plot(iis)
plot(iit)
plot(uus)
plot(uut)
plot(yys)
plot(yyt)
aat[2]

