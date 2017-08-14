function [K,D] = ST_1(x,t)
c = yahoo;
s = fetch(c,x,'Close','01/01/15','01/01/16');
h_f = fetch(c,x,'High','01/01/15','01/01/16');
l_f = fetch(c,x,'Low','01/01/15','01/01/16');
a = s(:,2);
b = size(a);
%a_t = a(1:(b-t));
%
h = h_f(:,2);
%h_t = h(1:(b-t));
%
l = l_f(:,2);
%l_t = l(1:(b-t));
% ^--- so wie vorhin, daten von yahoo holen und in vectoren stecken
for ii = 1:(b-t)
K(ii) = ((a(ii) - min(l(ii:ii+t))) / (max(h(ii:ii+t)) - min(l(ii:ii+t)))) * 100; %Formel laut Folien, help min und help max wenn unklar
end
for jj = 1:(b-t-2)
D(jj) = sum(K(jj:jj+2)) / 3; %Formel laut Folien
end
p=length(D);
figure;plot(1:p, fliplr(K(1:(b-t-2))), 1:p, fliplr(D)),title('ST'); %In Grafik
end