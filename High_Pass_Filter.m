% For HIGHPASS FILTER
clc;
clear all;
close all;
Freqpass=input('enter the pass band frequency:');
Freqstop=input('enter the stop band frequency:');
Ap=input('enter the pass band ripple:');
As=input('enter the stop band ripple:');
fs=input('enter the sampling frequency:');
fc = input ('Enter the value of cutoff frequency:');
beta=input (' Enter beta value:');
% Normalizing Frequencies
wp=2*(Freqpass/fs);
ws=2*(Freqstop/fs);
% to find order
num=abs(-20*log10(sqrt(Ap*As))-13);
den=14.6*((Freqpass-Freqstop)/fs);
N=ceil(num/den); % round off order
%n=abs(n);
if(rem(N,2)~=0)
n=N;
n=N-1;
else
n=N+1;
end
% Rectangular Window 
y=rectwin(n);
b=fir1(N,wp,'high',y);
w=0:0.01:pi;
[h,om]=freqz(b,1,w);
m=20*log10(abs(h)); % magnitude response of rectangular window
an=angle(h);
subplot(3,4,1);
plot(om/pi,m);
xlabel('normalized frequency');
ylabel('gain in db');
grid;
title('magnitude response using rectangular window');
subplot(3,4,2);
plot(om/pi,an); % phase response of Rectangular Window 
xlabel('normalized frequency');
ylabel('phase in rad');
grid;
title('phase response using rectangular window');
% Hanning Window 
y=hanning(n);
b=fir1(N,wp,'high',y);
w=0:0.01:pi;
[h,om]=freqz(b,1,w);

plot(om/pi,an); % phase response of Hanning window
xlabel('normalized frequency');
ylabel('phase in rad');
grid;
title('phase response using hanning window');
% Hamming Window 
y=hamming(n);
b=fir1(N,wp,'high',y);
w=0:0.01:pi;
[h,om]=freqz(b,1,w);
m=20*log10(abs(h)); % magnitude response of Hamming Window 
an=angle(h);
subplot(3,4,7);
plot(om/pi,m); 
xlabel('normalized frequency');
ylabel('gain in db');
grid;
title('magnitude response using hamming window');
subplot(3,4,8);
plot(om/pi,an); % phase response of Hamming Window 
xlabel('normalized frequency');
ylabel('phase in rad');
grid;
title('phase response using hamming window');
% Blackman Window 
y=blackman(n);
b=fir1(N,wp,'high',y);
w=0:0.01:pi;
[h,om]=freqz(b,1,w);
m=20*log10(abs(h));  % magnitude response of Blackman Window
an=angle(h);
subplot(3,4,9);
plot(om/pi,m);
xlabel('normalized frequency');
ylabel('gain in db');
grid;
title('magnitude response using blackman window');
subplot(3,4,10);
plot(om/pi,an); % Phase response of Blackman Window 
xlabel('normalized frequency');
ylabel('phase in rad');
grid;
title('phase response using blackman window');
%Kaiser Window
y=kaiser(N,beta)
b=fir1(N-1,wp,'high',y);
w=0:0.01:pi;
[h,om]=freqz(b,1,w);
m=20*log10(abs(h));  % magnitude response of kaiser Window
an=angle(h);
subplot(3,4,11);
plot(om/pi,m);
xlabel('normalized frequency');
ylabel('gain in db');
grid;
title('magnitude response using kaiser window');
subplot(3,4,12);
plot(om/pi,an); % Phase response of Kaiser Window 
xlabel('normalized frequency');
ylabel('phase in rad');
grid;
title('phase response using kaiser window')