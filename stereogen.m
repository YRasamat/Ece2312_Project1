%Generate a stereo file from our given mono file
outputFile = 'qbf-stereosoundfile-0ms.wav'
data = audioread('quick_brown_fox.wav')
data(:,2) = data(:,1);
audiowrite(outputFile, data, fs)