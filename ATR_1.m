function [ATR] = ATR_1(x,t)
c = yahoo;
s = fetch(c,x,'Close','01/01/15','01/01/16');
a = s(:,2);
b = size(a);
h_f = fetch(c,x,'High','01/01/15','01/01/16');
h = h_f(:,2);
l_f = fetch(c,x,'Low','01/01/15','01/01/16');
l = l_f(:,2);
a = flipud(a);
h = flipud(h);
l = flipud(l);
% Gleich wie vorher, aber umgekehrt in vectoren (flip up down) (von yahoo
% ist der neuste preis in zeile 1, wir brauchen aber den ersten
% wert(01-01-2015) in zeile 1
for ii = 1:(b-10)
TR1(ii+1) = h(ii+1)-l(ii+1);
TR2(ii+1) = h(ii+1)-a(ii);
TR3(ii+1) = l(ii+1)-a(ii);
% TR laut Folien -> in 3 neue Vectoren stecken
TRX = h(1)-l(1); %Wir brauchen einen ersten Wert (gleich wie bei MACD)
TR(ii+1) = max([TR1(ii+1);TR2(ii+1);TR3(ii+1)]); % Von TR1 bis TR3 den max wert finden


ATR(1) =  TRX; % hier den ersten wert einfügen
ATR(ii+1) = ((t-1) * ATR(ii) + TR(ii+1))/t; %TR laut folien ausrechnen
end
figure;plot(ATR),title('ATR');
end

