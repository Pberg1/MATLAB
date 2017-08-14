function [MACD_1, a] = MACD_1 (x,N1,N2)
%[MACD_1] = MACD_1 ('MSFT',14,26)
%c = yahoo; %c=content, contentprovider = yahoo
s = fetch(c,x,'Close','01/01/15','01/01/16'); %Close Kurse von 2015 - 2016 holen
a = s(:,2); %a = nur die 2. spalte von yahoo(1. spalte daten, 2.spalte Kurse)
a = flipud(a); %flip vector up down
b = size(a); %größe von a = anzahl der Kurse von '15-'16
for jj = 1:(b-1) %Schleife von 1 bis b-1 /// ii und jj als zähler verwenden (NICHT i nehmen)
for ii = 1:(b-1)
         M1 = 2/(N1+1);
        M2 = 2/(N2+1);
        EMA1(1)= a(1);
        EMA2(1)= a(1);
        EMA1(ii+1)=(a(ii+1)-EMA1(ii))*M1+EMA1(ii);
        EMA2(ii+1)=(a(ii+1)-EMA2(ii))*M2+EMA2(ii);
        %Formeln laut Folien
        
MACD_1(jj) = EMA1(jj)-EMA2(jj);
end
end

[MACD_1] = MACD_1;figure,plot(MACD_1),title('MACD');
end
