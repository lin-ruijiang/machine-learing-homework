% Anil K.Jain提出的基于YCbCr颜色空间的肤色模型  
% 根据当前点的Cb Cr值判断是否为肤色  
function result = skin(Y,Cb,Cr)  
% 参数  
a = 25.39;  
b = 14.03;  
ecx = 1.60;  
ecy = 2.41;  
sita = 2.53;  
cx = 109.38;  
cy = 152.02;  
xishu = [cos(sita) sin(sita);-sin(sita) cos(sita)];  
% 如果亮度大于230，则将长短轴同时扩大为原来的1.1倍  
if(Y > 230)  
    a = 1.1*a;  
    b = 1.1*b;  
end  
% 根据公式进行计算  
Cb = double(Cb);  
Cr = double(Cr);  
t = [(Cb-cx);(Cr-cy)];  
temp = xishu*t;  
value = (temp(1) - ecx)^2/a^2 + (temp(2) - ecy)^2/b^2;  
% 大于1则不是肤色，返回0；否则为肤色，返回1  
if value > 1  
    result = 0;  
else  
    result = 1;  
end   