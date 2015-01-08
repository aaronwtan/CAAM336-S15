% A demo for recording the voice on a non-windows machine, 

sr = 44100;
ai = audiorecorder(sr,16,1);
input('Press any key to record')
record(ai)
input('Press any key to stop')
pause(ai);

y = getaudiodata(ai);
n = length(y);

figure(1)
t = (0:n-1)*sr;
plot(t,y)
xlabel('Time (s)')
ylabel('Amplitude');
title('Time domain')

figure(2)
f = (0:n-1)'/n*sr*2*pi;
Fy = fft(y)/sqrt(n);
semilogy(f,abs(Fy));
xlabel('Frequency (s^{-1})')
ylabel('Amplitude')
title('Frequency Domain')


figure(3)
[S,f,t] = spectrogram(y,5e3);

imagesc(t,f*sr,log10(abs(S)))
axis xy

xlabel('Time (s)')
ylabel('Frequency (s^{-1})');
title('Spectrogram')

%ylim([0,2e4])
