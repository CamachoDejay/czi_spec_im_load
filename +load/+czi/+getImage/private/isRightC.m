function [out] = isRightC(im_str, c_request)
%ISRIGHTC Summary of this function goes here
%   Detailed explanation goes here
    c_request = uint16(c_request);
    [~, c_current, ~] = load.czi.getInfo.channel(im_str);
    out = c_current == c_request;
end

