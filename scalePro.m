% kevin
% scale with averages points.
function [img_min] = scalePro(img_filename, S)
    img = imread(img_filename);
    img_alt = double(img);
    v_ub = floor(size(img_alt,1)/S);
    h_ub = floor(size(img_alt,2)/S);
    placeholder = zeros(v_ub, h_ub);
    for i = 0:v_ub
        start0 = (S * i) + 1;
        end0 = min(start0 + S - 1,size(img_alt,1));
        for j = 0:h_ub
           start1 = (j * S) + 1;
           end1 = min(start1 + S - 1,size(img_alt,2));
           placeholder(i+1,j+1) = mean(mean(img_alt(start0:end0, start1:end1)));
        end
    end
    img_min = uint8(placeholder);
    return;
end