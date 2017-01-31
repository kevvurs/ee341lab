% kevin
% note: 0, 1, 2... etc. -> A, A#, B, C, C#... etc.
% len: time vector for not length.
function [signal] = mkNote(note, len)
    ERROR = 'mkNote> Invalid input';
    if (length(note) > 1)
        fprintf(ERROR);
        signal = NaN;
        return;
    else
        freq = 220 .* (2 ^ (note / 12));
        signal = 100*cos(2*pi*freq*len);
        return;
    end
end