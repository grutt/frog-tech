#!/usr/bin/env python3
import numpy as np
from scipy.io import wavfile
import wave


def rms(data):
    '''
    root mean square of a set of data. @WARNING does not take complex numbers.
    @paramaters:
        data - a numpy array of values
    @returns:
        a scalar value which is the RMS of the array values
    @ref:
        http://stackoverflow.com/questions/5613244/
    '''
    # @TODO{vital} windowize
    # @TODO{Optimization} rolling RMS
    return np.sqrt(np.mean(np.square(data)))


def splitOnScilence(original, threshold=None):
    '''
    splitter method
    '''
    return 0


# [START run_application]
if __name__ == '__main__':
    audioFile = "./resources/artificial0.wav"
    # audioFile = "english.wav"
    sr, data = wavfile.read(audioFile)
    # w = wave.open(audioFile)
    print(data)
