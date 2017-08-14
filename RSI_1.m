function [RSI_1] = RSI_1 (x,t)
% x = ticker, t = time
%
c = yahoo;
s = fetch(c,x,'Close','01/01/15','01/01/16');
a = s(:,2);
b = size(a);
for jj = 1:(b-t-2)
    for ii = 1:(t)
       d(ii)= a(ii+jj)-a(ii+jj+1); %Formel aus Folien
    end
    dp(jj)=sum(d(d>0)); %alle positiven werte in dp
    dn(jj)=sum(d(d<0)); %alle negativen werte in dn
    avg_dp(jj) = dp(jj)/t; %durchschnitt pos werte
    avg_dn(jj) = (abs(dn(jj))/t); %durchschnitt neg. werte
    %d
    clear d %d wieder löschen. d wird in jeder neuen runde in der schleife neu deffiniert
RS(jj) = avg_dp(jj)/avg_dn(jj); %RS laut Folien
RSI_1(jj)=100-(100/(1+RS(jj))); % RSI laut Folien
end
[RSI_1] = RSI_1;figure,plot(RSI_1),title('RSI'); %RSI in grafik darstellen
end