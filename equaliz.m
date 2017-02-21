% kevin
function [signal] = equaliz(input,G1,G2,G3,G4)
    % input is a loaded sound signal.
    EQ1 = butter(4,0.2,'low');
    EQ2 = fir1(4,[0.2, 0.4],'bandpass');
    EQ3 = fir1(4,[0.4, 0.66],'bandpass');
    EQ4 = butter(4,0.66,'high');

    % part 2
    % GAIN EQN's 10^(gain/20), 20*log10(gain)
    comp1 = filter(EQ1,1,input) .* 10^((G1)/20);
    comp2 = filter(EQ2,1,input) .* 10^((G2)/20); 
    comp3 = filter(EQ3,1,input) .* 10^((G3)/20);
    comp4 = filter(EQ4,1,input) .* 10^((G4)/20);
    signal = comp1 + comp2 + comp3 + comp4;
    
    % render
    % figure,freqz(EQ1,1),title('1: IIR LPF');
    % figure,freqz(EQ2,1),title('2: FIR BPF');
    % figure,freqz(EQ3,1),title('3: FIR BPF');
    % figure,freqz(EQ4,1),title('4: IIR HPF');
    return;
end