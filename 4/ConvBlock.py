import numpy as np
import matplotlib.pyplot as plt

# Parameters
N = 1000    # Length of input signal
L = 10      # Length of each segment for block processing
p = 5       # Length of filter

# Input signal: an array of ones with length N
x = np.ones(N)
# Filter: an array of ones with length p
h = np.ones(p)
# Full convolution of x and h
y = np.convolve(x, h)

# Number of segments (or blocks) of length L
Ns = N // L
# Initialize an empty array to accumulate the filtered segments
yf = np.zeros(N + p - 1)  # This will hold the final output

# Loop through each segment
for j in range(Ns):
    # Extract the j-th segment (of length L) from x
    Xs = x[j*L : (j+1)*L]
    
    # Convolve the segment with the filter
    ys = np.convolve(Xs, h)
    
    # Place the convolved segment results into the cumulative array yf
    # starting at index j*L and extending by the length of ys (L + p - 1)
    yf[j*L : j*L + L + p - 1] += ys

# Plot the results for comparison with full convolution y
plt.stem(yf[:35], linefmt='b-', markerfmt='bo', label='Segmented Convolution')
plt.stem(y[:35], linefmt='r-', markerfmt='r*', label='Full Convolution')
plt.legend()
plt.xlabel('Sample Index')
plt.ylabel('Amplitude')
plt.title('Comparison of Full Convolution and Block Processing Convolution')
plt.show()
