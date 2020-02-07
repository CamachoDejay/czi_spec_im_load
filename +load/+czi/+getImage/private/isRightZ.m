function [out] = isRightZ(im_str, z_request)
%ISRIGHTZ Summary of this function goes here
%   Detailed explanation goes here

    z_request = uint16(z_request);
    [~, z_current, ~] = load.czi.getInfo.zpos(im_str);
    out = z_current == z_request;
    
end

