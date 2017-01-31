% kevin
% scale with center points.
function [img_min] = scale(img_filename, S)
    img = imread(img_filename);
    img_alt = double(img);
    img_min = uint8(img_alt(round(S/2):S:end, round(S/2):S:end));
    return;
end