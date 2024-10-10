import numpy as np
import matplotlib.pyplot as plt

# Parameters
q = 4
f0 = 1000
fs = 10000
t = np.arange(0, 100 / f0, 1 / fs)

# Generate the signal
X = np.real(np.exp(1j * 2 * np.pi * f0 * t))

# Quantization
mysigq = np.zeros(len(X))
for i in range(len(X)):
    sig = X[i]
    if 0 < sig < 2 / q:
        sigq = 1 / q
    elif sig > 2 / q:
        sigq = 3 / q
    elif -2 / q < sig < 0:
        sigq = -1 / q
    elif sig < -2 / q:
        sigq = -3 / q
    else:
        sigq = 0  # Handling case where sig is 0
    mysigq[i] = sigq

# Frequency domain representation
N = len(X)
f = np.arange(0, N) * fs / N

# Plotting
plt.figure(figsize=(10, 6))
plt.plot(f, np.abs(np.fft.fft(mysigq)), label='quantized')
plt.plot(f, np.abs(np.fft.fft(X)), 'r', label='True')
plt.legend()
plt.xlabel('Frequency (Hz)')
plt.ylabel('Magnitude')
plt.title('Quantized Signal vs True Signal')
plt.grid()
plt.show()
