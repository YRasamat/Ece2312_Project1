fs = 44100;
% Load the mono audio file 
[audioData, fs] = audioread('quick_brown_fox.wav');

%calculations for avghead file
avgHeadSamples=24;
delayAvgHead=avgHeadSamples/fs;

% Define the delays
delays = [delayAvgHead 1 10 100]; % delays in ms
delaysSamples = [24, 44, 441, 4410]; % delays - in samples
    


for i = 1:length(delaysSamples)
    
    % Create a stereo version of the audio with the delay
   
    % Circshift shifts the data by the number of samples necessary for each
    %delay (in ms)
    stereoData = [audioData, circshift(audioData, [delaysSamples(i), 0])];
    
    % Defines the name for the output file based on the delays vector
    % If index of delays is less than 1(ms) the file is named avghead
    % (because the only delay less than 1ms is the head delay)
    if delays(i) < 1
        outputFile = sprintf('qbf-stereosoundfile-avghead.wav', delays(i));
    else
        outputFile = sprintf('qbf-stereosoundfile-%dms.wav', delays(i));
    end
    % Write the stereo audio file to disk
    audiowrite(outputFile, stereoData, fs);
end
