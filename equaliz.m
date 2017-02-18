% kevin
function [signal] = equaliz(input,G1,G2,G3,G4)
    % input is a loaded sound signal.
    EQ1 = butter(4,0.2,'low');
    EQ2 = butter(4,[0.2, 0.4],'bandpass');
    EQ3 = butter(4,0.4,'high');
    EQ4 = butter(4,0.66,'high');
    
    % part 2
    comp1 = filter(EQ1,1,input) .* (20 * log10(G1)); %OR: (10^(G1/20));
    comp2 = filter(EQ2,1,input) .* (20 * log10(G2)); %OR: (10^(G2/20));
    comp3 = filter(EQ3,1,input) .* (20 * log10(G3));%(10^(G3/20));
    comp4 = filter(EQ4,1,input) .* (20 * log10(G4));%(10^(G4/20));
    
    signal = comp1 + comp2 + comp3 + comp4;
end