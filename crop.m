% kevin
% crop to size
function img_min = crop(img_alt, dim0, dim1)
    img_min = uint8(img_alt(1:dim0, 1:dim1));
    return;
end