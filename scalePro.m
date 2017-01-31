% kevin
% scale with averages points.
function [img_min] = scalePro(img_filename, S)
    img = imread(img_filename);
    img_alt = double(img);
    for i = 1:size(img_alt,1)
        if (25)
            sigma = 0;
       for j = 1:size(img_alt,2)
           
       end
    end
    img_min = uint8(img_alt(round(S/2):S:end, round(S/2):S:end));
    return;
end