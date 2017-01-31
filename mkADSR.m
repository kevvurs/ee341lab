% kevin
function [adsr] = mkADSR(c, Fs)
    % ASDR's
    r_len = ((0.1*c)-1/Fs);
    r_amp = (10/c);
    d_len = ((0.5*c)-1/Fs);
    r = (0:1/Fs:r_len ) * (r_amp);
    d = ((0:1/Fs:d_len) * -4) + 1;
    a = ones(1,2400) * 0.8;
    s = ((0:1/Fs:0.5-1/Fs) * -24) + .8;
    adsr = [r,d_quart(1:400),a_quart,s_quart(1:400)];
    return;
end