import numpy as np
import matplotlib.pyplot as plt

# Parameters
N = 500  # Length of the input signal
L = 25   # Length of each segment
p = 10   # Length of the filter

# Input signal: an array of ones with length N
x = np.ones(N)
# Filter: an array of ones with length p
h = np.ones(p)

# Create an extended version of x for convolution
x1 = np.zeros(N + p - 1)  # Zero-padding to accommodate the filter
x1[p-1:] = x  # Shift x by p-1 to the right

# Number of segments
Ns = N // L
# Initialize output array for cumulative results
yf = np.zeros((L - p + 1) * Ns)

# Loop through each segment
for j in range(Ns):
    # Extract the j-th segment of length L from x1
    Xs = x1[j * (L - p + 1): j * (L - p + 1) + L]
    
    # Compute the FFT of the segment and the filter
    xf = np.fft.fft(Xs, L)  # FFT of the segment
    hf = np.fft.fft(h, L)   # FFT of the filter
    
    # Perform element-wise multiplication in the frequency domain
    Yf = xf * hf
    
    # Compute the inverse FFT to get the convolved result
    ys = np.fft.ifft(Yf, L)
    
    # Store the relevant part of the convolved signal in the output array
    Yc = ys[p-1:]  # Take the last L-p+1 samples
    yf[j * (L - p + 1): j * (L - p + 1) + len(Yc)] = Yc.real  # Store the real part

# Plot the results
plt.stem(yf[:50], linefmt='b-', markerfmt='bo', label='Segmented Convolution Result')
plt.xlabel('Sample Index')
plt.ylabel('Amplitude')
plt.title('Segmented Convolution Result using FFT')
plt.legend()
plt.show()
