% kevin
% interpole with fac. 3 with center points.
function [img_intp] = imgInterp(img_filename)
    img = imread(img_filename);
    img_alt = double(img);
    img_up = repelem(img_alt,3,3);
    img_intp = uint8(img_up);
    return;
end