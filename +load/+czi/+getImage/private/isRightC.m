function [out] = isRightC(im_str, c_request)
%ISRIGHTC helper function, is the requested channel in the image string?

    c_request = uint16(c_request);
    [~, c_current, ~] = load.czi.getInfo.channel(im_str);
    out = c_current == c_request;
end

