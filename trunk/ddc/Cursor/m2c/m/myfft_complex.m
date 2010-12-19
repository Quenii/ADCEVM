function ret = myfft_complex(r, i, n)
    x = r + j * i;
    ret = myfft(x, n)
    