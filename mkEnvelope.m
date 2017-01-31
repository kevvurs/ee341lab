% kevin

% ADSR: Assimilate modulator for music notes.
function [adsr] = mkEnvelope(c, Fs)
    ERROR = 'mkEnvelope> Invalid input';
    % Only produce 1-4 count notes.
    if (c > 4 || c < 1)
        fprintf(ERROR);
        adsr = NaN;
        return;
    else
        % Attack, decay, sustain, recede.
        a = (0:1/Fs:(0.1*c)-1/Fs)*(10/c);
        d = ((0:1/Fs:(0.5*c)-1/Fs)*(-4/c))+1;
        s = ones(1,(1800*c))*0.8;
        r = ((0:1/Fs:(0.5*c)-1/Fs)*(-24/(6*c)))+.8;
        adsr = [a,d(1:400*c),s,r(1:1000*c)];
        return;
    end
end