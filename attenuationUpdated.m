fs = 44100;

% Load the stereo audio files
data_0ms = audioread('qbf-stereosoundfile-0ms.wav');
data_avghead = audioread('qbf-stereosoundfile-avghead.wav');

% Define the attenuation levels in dB
attenuations_dB = [-1.5, -3, -6];

for i = 1:length(attenuations_dB)
    % Apply attenuation to both channels of the 0ms delay file
    attenuation = 10^(attenuations_dB(i)/20); % Converts dB to magnitude
    attenuated_data_0ms = data_0ms * attenuation;
    
    % Apply attenuation to both channels of the average head delay file
    attenuated_data_avghead = data_avghead * attenuation;
    
    % Define the output file names using sprintf 
    outputFile_0ms = sprintf('Will&Yonik-stereosoundfile-0ms-%ddB.wav', abs(attenuations_dB(i)));
    outputFile_avghead = sprintf('Will&Yonik-stereosoundfile-avghead-%ddB.wav', abs(attenuations_dB(i)));
    
    % Write the attenuated stereo audio files
    audiowrite(outputFile_0ms, attenuated_data_0ms, fs);
    audiowrite(outputFile_avghead, attenuated_data_avghead, fs);
end