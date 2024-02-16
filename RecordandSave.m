%% ECE2312
%%Project 1
%%William Gerlach & Yonik Rasamat

%%This program is segmented. 
% The user should Run "Part 1" to initialize the variables
% 
% The user should then run part 2, recording their audio signal. 
% 
% Following this, the user can utilize "Part 3" to plot their audio data
% in the time domain.
%
% Part 4 sets the parameters for the spectrogram, and creates one based on
% the audio data created by the user. 
%
% Part 5 saves to a .wav file, and Part 6 stores the value of that .wav
% file as a variable to then be iterated upon in part 4.


%% PART 1



%define sampling rate (frequency in Hz): sr
% and 
% duration (time in seconds): duration

sr= 44100;
duration=5;
disp('variables initialized')
%% Part 2 : RECORDING

%Create audio recorder with sampling rate sr, bitsize 8, 1 channel, and the
%corresponding input channel for my computer's built in microphone (1)

    recorder = audiorecorder(sr,8,1,1);

%record audio for the given duration
    disp("Start of recording");
    recordblocking(recorder, duration);
    disp("End of recording")

%store recorded audio data
%QBF as placeholder for user input

    audioDataQBF=getaudiodata(recorder)/sr;
   

%Increases energy of audio sample to a listenable level
    audioDataQBF=audioDataQBF/max(abs(audioDataQBF));
    %Switch out variable name and iterate for each 
%% %Part 3: create a plot of the information in the time domain
%create vector for time based on sampling rate and length of audioData
%again, update variable per each recording


t= linspace(0,duration, length(audioDataQBF));
plot(t, audioDataQBF);
xlabel('Time (s)');
ylabel('Amplitude');
title('QBF');
%% Part 4: Creating the spectrogram

%set parameters for the spectrogram
windowSize = 128; % Window size in samples
overlapRatio = 0.4; % Overlap ratio
NFFT = 8192; % FFT length
disp('spectrogram params initialized') 

% Compute the spectrogram of the audio data
[spectrogramData, frequencies, times] = spectrogram(audioDataQBF, windowSize, round(overlapRatio * windowSize), NFFT, 44100);
% 'round' ensures an integer value for number of overlapping samples
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


%iterate with audioDataQBF
%iterate with audioDataPromptlyJudged
%iterate with audioDataCrazyFredrick

%save .wav files via Part 5
%upload .wav files via Part 6

%iterate with qbfWAV
%iterate with promptlyWAV
%iterate with crazyWAV
%% Part 5: Save Recorded speech signals to WAV file

%before these lines of code can be run, one must ensure the variable names
%have stored audio sample data values. Otherwise, they will throw an error

wavQBF = 'quick_brown_fox.wav';
audiowrite(wavQBF, audioDataQBF, sr);
disp("saved1")

wavPromptlyJudged = 'promptly_judged.wav';
audiowrite(wavPromptlyJudged, audioDataPromptlyJudged, sr);
disp("saved2")

wavCrazyFredrick = 'crazy_fredrick.wav';
audiowrite(wavCrazyFredrick, audioDataCrazyFredrick, sr);
disp("saved3")

%% Part 6: read .wav file to variable

qbfWAV = audioread('quick_brown_fox.wav');
disp("file 'qbf' success")

promptlyWAV = audioread('promptly_judged.wav');
disp("file 'promptly' success")

crazyWAV = audioread('crazy_fredrick.wav');
disp("file 'crazy' success")



