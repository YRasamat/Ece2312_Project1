%%Run part 1 first, then part 2, check that it saves with part 3, and then
%%you can use part 5 to convert to .wav



%%PART 1








%define sampling rate (frequency in Hz): sr
% and 
% duration (time in seconds): duration

sr= 44100;
duration=5;
disp('variables initialized')
%% Part 2 : RECORDING

%Create audio recorder with sampling rate sr, bitsize 8, 1 channel, and the
%corresponding input channel for my computer's built in microphone

    recorder = audiorecorder(sr,8,1,1);

%record audio for the given duration
    disp("Start of recording");
    recordblocking(recorder, duration);
    disp("End of recording")

%store recorded audio data

    audioDataQBF=getaudiodata(recorder)/sr;
    




%% %Part 3: create a plot of the information in the time domain
%create vector for time based on sampling rate and length of audioData
%-1 for proper indexing

%%%%%NEW UPDATED LINE%%%%%
audioDataQBF=audioDataQBF/max(abs(audioDataQBF));
t= linspace(0,duration, length(audioDataQBF));
plot(t, audioDataQBF);
xlabel('Time (s)');
ylabel('Amplitude');
title('QBF');
%% Part 4: Set spectrogram params


%specTest=spectrogram(audioDataQuickBrownFox);

%imagesc(abs(specTest));
%title('Test Spectrogram')
%colorbar;

windowSize = 128; % Window size in samples
overlapRatio = 0.4; % Overlap ratio
NFFT = 8192; % FFT length

%iterate with audioDataQBF
%iterate with audioDataPromptlyJudged
%iterate with audioDataCrazyFredrick

%save .wav files
%upload .wav files

%iterate with qbfWAV
%iterate with promptlyWAV
%iterate with crazyWAV




% Compute the spectrogram of the audio data
[spectrogramData, frequencies, times] = spectrogram(audioDataQBF, windowSize, round(overlapRatio * windowSize), NFFT, 44100);

% Plot the spectrogram
figure;
imagesc(times, frequencies, (abs(spectrogramData)));
axis xy; % Flip the y-axis direction
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Spectrogram of crazyWAV');
colorbar; % Add color bar for intensity scale
%sets displayed frequency limit to 8kHz
ylim([0, 8000]);

%% Part 5: Save Recorded speech signals to WAV file

wavQBF = 'quick_brown_fox.wav';
audiowrite(wavQBF, audioDataQBF, sr);
disp("saved1")

wavPromptlyJudged = 'promptly_judged.wav';
audiowrite(wavPromptlyJudged, audioDataPromptlyJudged, sr);
disp("saved2")

wavCrazyFredrick = 'crazy_fredrick.wav';
audiowrite(wavCrazyFredrick, audioDataCrazy, sr);
disp("saved3")

%% read .wav file to variable

qbfWAV = audioread('quick_brown_fox.wav');
disp("file 'qbf' success")

promptlyWAV = audioread('promptly_judged.wav');
disp("file 'promptly' success")

crazyWAV = audioread('crazy_fredrick.wav');
disp("file 'crazy' success")



