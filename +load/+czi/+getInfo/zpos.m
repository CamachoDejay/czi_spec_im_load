function [z_info, currentZ, totalZ] = zpos(im_str)
%ZPOS Summary of this function goes here
%   Detailed explanation goes here
    idx_1 = strfind(im_str,'Z=');
    
    if isempty(idx_1)
        warning('No Z information available, assuming 1 Z plane');
        z_info = "Z=1/1";
        currentZ = uint16(1);
        totalZ = uint16(1);
        return
    end
    
    idx_2 = strfind(im_str,';');

    test = idx_2 > idx_1;
    
    if any(test)
        V1 = find(test, true, 'first');
        idx_2 = idx_2(V1)-1;
    else
        idx_2 = length(im_str);
    end
    
    z_info = im_str(idx_1: idx_2);

    idx_1 = strfind(z_info,'=');
    idx_2 = strfind(z_info,'/');

    currentZ = z_info(idx_1+1 : idx_2-1);
    currentZ = uint16(str2double(currentZ));

    totalZ = z_info(idx_2+1 : end);
    totalZ = uint16(str2double(totalZ));
end

