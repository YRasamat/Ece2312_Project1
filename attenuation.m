%Applying attenuation to our 0 ms or Avghead file

%Name our output file, load our source file, and define our desired gain
outputFile = 'qbf-stereosoundfile-0ms-1.5db.wav';
data = audioread('qbf-stereosoundfile-0ms.wav');
dbGain = -1.5;

%Convert the decibel gain to a magnitude gain and apply gain to column 2
magGain=db2mag(dbGain*2);
data(:,2) = data(:,2)*magGain;
%Output our soundfile
audiowrite(outputFile, data, fs)
