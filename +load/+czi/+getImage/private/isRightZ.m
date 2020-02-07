function [out] = isRightZ(im_str, z_request)
%ISRIGHTZ  helper function, is the requested z-plane in the image string?

    z_request = uint16(z_request);
    [~, z_current, ~] = load.czi.getInfo.zpos(im_str);
    out = z_current == z_request;
    
end