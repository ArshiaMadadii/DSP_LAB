import numpy as np
import matplotlib.pyplot as plt

# Parameters
N = 50  # Length of FFT
L = 50  # Length of input signal
p = 50  # Length of filter

# Input signal: an array of ones with length L
x = np.ones(L)
# Filter: an array of ones with length p
h = np.ones(p)

# Compute the FFT of x and h
X = np.fft.fft(x, N)  # FFT of the input signal
H = np.fft.fft(h, N)  # FFT of the filter

# Element-wise multiplication in the frequency domain
yf = X * H

# Compute the inverse FFT to obtain the convolved signal in time domain
y = np.fft.ifft(yf, N)

# Plot the results
plt.stem(y.real, linefmt='b-', markerfmt='bo', label='FFT Convolution Result')
plt.stem(np.convolve(x, h)[:N], linefmt='r-', markerfmt='r*', label='Direct Convolution Result')
plt.legend()
plt.xlabel('Sample Index')
plt.ylabel('Amplitude')
plt.title('Comparison of FFT Convolution and Direct Convolution')
plt.show()
