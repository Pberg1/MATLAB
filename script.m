[MACD_1,a] = MACD_1 ('MSFT',14,26);
[RSI_1] = RSI_1 ('MSFT',14);
[SMA,UB,LB] = BB_1('MSFT',20,14,2);
[MOM_1] = MOM_1('MSFT',14);
[K,D] = ST_1('MSFT',14);
[ATR] = ATR_1('MSFT',14);

figure;
subplot(7,1,1);
plot(a);
title('MSFT');

subplot(7,1,2);
plot(MACD_1);
title('MACD');

subplot(7,1,3);
plot(RSI_1);
title('RSI');

subplot(7,1,4);
p=length(SMA);
plot(1:p, fliplr(UB),'o-', 1:p, fliplr(LB), 'o-',1:p, fliplr(SMA),'-');
title('BB');

subplot(7,1,5);
plot(fliplr(MOM_1));
title('MOM');

subplot(7,1,6);
r=length(D);
plot(1:r, fliplr(K(1:(252-14-2))), 1:r, fliplr(D));
title('ST');

subplot(7,1,7);
plot(ATR);
title('ATR');