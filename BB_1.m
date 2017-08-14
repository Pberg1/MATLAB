function [SMA,UB,LB] = BB_1(x,y,t,NRSD)
% x = ticker, NRSD = Nr of SD you want, y = SMA, t=time
% [SMA,UB,LB] = BB_1('MSFT',20,14,2)
c = yahoo;
s = fetch(c,x,'Close','01/01/15','01/01/16');
a = s(:,2);
b = size(a);
for ii=[1:(b-y)]
SMA(ii) = sum(a(ii:ii+y-1)) / y; %MA laut Angabe oben(normalerweise SMA20)
SDC(ii) = std (a(ii:ii+y-1)); %Standardabweichung berechnen 
UB(ii) = SMA(ii) + NRSD * SDC(ii); %Upperband
LB(ii) = SMA(ii) - NRSD * SDC(ii); %Lowerband
end
% Werte für richtigen Plot (eigentlich egal)
oo = fliplr(SMA);
qq = fliplr(UB);
cc = fliplr(LB);
SMA(b-20:b) = oo(1);
UB(b-20:b) = qq(1);
LB(b-20:b)= cc(1);
%
p=length(SMA); %x-Achse der Grafik deffinieren
figure;plot(1:p, fliplr(UB),'o-', 1:p, fliplr(LB), 'o-',1:p, fliplr(SMA),'-'),title('BB'); %UB LB und SMA in grafik, vector von links nach rechts spiegeln
end
