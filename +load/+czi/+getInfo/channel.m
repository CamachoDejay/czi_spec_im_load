function [c_info, currentC, totalC] = channel(im_str)
%CHANNEL gets channel information from the image string of bioformats

    idx_1 = strfind(im_str,'C=');
    
    if isempty(idx_1)
        warning('No channel information available, assuming 1 color image');
        c_info = "C=1/1";
        currentC = uint16(1);
        totalC = uint16(1);
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

    c_info = im_str(idx_1: idx_2);

    idx_1 = strfind(c_info,'=');
    idx_2 = strfind(c_info,'/');

    currentC = c_info(idx_1+1 : idx_2-1);
    currentC = uint16(str2double(currentC));

    totalC = c_info(idx_2+1 : end);
    totalC = uint16(str2double(totalC));
end

