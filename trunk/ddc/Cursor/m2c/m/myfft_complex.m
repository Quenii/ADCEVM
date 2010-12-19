function ret = myfft_complex(r, i, n)    
    r = r .* hamming(n);
    i = i .* hamming(n);
    x = r + j * i;
    d = 20*log10(abs(fft(x, n)));
    ret = d - max(d(3 : n / 2));    