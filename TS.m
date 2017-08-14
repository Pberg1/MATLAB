EC = 1000; % Start "Kapital"
%c = yahoo;
%s = fetch(c,x,'Close','01/01/15','01/01/16');
a = s(:,2);
b = size(a);
% SMA BERECHNUNG
y = 14; % SMA1
z = 26; % SMA2
for ii = 1:100
    SMA1(ii) = sum(a(ii:ii+y-1)) / y; % zB 14
    SMA2(ii) = sum(a(ii:ii+z-1)) / z; % zB 26
end
%
% RSI BERECHNUNG
for vv = 1:(b-t-2)
    for gg = 1:(t)
       d(gg)= a(gg+vv)-a(gg+vv+1); %Formel aus Folien
    end
    dp(vv)=sum(d(d>0)); %alle positiven werte in dp
    dn(vv)=sum(d(d<0)); %alle negativen werte in dn
    avg_dp(vv) = dp(vv)/t; %durchschnitt pos werte
    avg_dn(vv) = (abs(dn(vv))/t); %durchschnitt neg. werte
    %d
    clear d %d wieder löschen. d wird in jeder neuen runde in der schleife neu deffiniert
RS(vv) = avg_dp(vv)/avg_dn(vv); %RS laut Folien
RSI_1(vv)=100-(100/(1+RS(vv))); % RSI laut Folien
end
%
%
%
% NEU
P = 0; %Position 0 -> nicht am Markt
L = 0;
S = 0;
for jj = 1:100
  
if SMA1(jj)>SMA2(jj) && RSI_1(jj)<30 
P = 1; % 1 = buy

elseif SMA1(jj)<SMA2(jj) && RSI_1(jj)>70;
P = 2; % 2 = sell

else 
    P = 0;
end

if P == 1 && L == 0% Wenn P = 1 nehmen wir den heutigen Aktienwert in L, aber nur wenn noch kein Wert in L steht
        L = a(jj);
elseif P == 2 && S == 0 % Wenn P = 2 nehmen wir den heutigen Wert in S, aber nur wenn noch kein Wert in S steht
        S = a(jj);
end
    if L ~= 0 && S ~= 0 % Wenn wir sowohl Long als auch short waren errechnen wir den Gewinn bzw Verlust
        GuV = S - L; % Gewinn / Verlust aus Position
        L = 0; % Alles Resetten für den nächsten Durchlauf
        S = 0;
        P = 0;
    end
    if GuV ~= 0 % Wenn GuV einen Wert hat, in die EquityCurve einbeziehen: Alter wert + Veränderung = Neuer wert
    for kk = 1 : 100
    EC(kk) = EC (kk-1) + GuV;
    GuV = 0;
    end
    end
end

