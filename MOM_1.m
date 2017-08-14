function [MOM_1] = MOM_1(x,t)
c = yahoo;
s = fetch(c,x,'Close','01/01/15','01/01/16');
a = s(:,2);
b=size(a);
for ii = 1:(b-t)
    MOM_1(ii)=a(ii)-a(ii+t); %laut Folien
end
figure;plot(fliplr(MOM_1)),title('MOM'); %Links rechts spiegeln
end

