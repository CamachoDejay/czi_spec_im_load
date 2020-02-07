function [out_data] = channel_zpos(data, ch_request, z_request)
%CHANNEL_ZPOS extracts the image from the data structure "data" for a 
%particular channel "ch_request" and z-plane "z_request". data structure 
%is that comming from bioformats

    im_info_list = data(:,2);
    tmp = cellfun(@(x)  isRightZ(x, z_request),im_info_list);
    z_data = data(tmp,:);

    im_info_list = z_data(:,2);
    tmp = cellfun(@(x)  isRightC(x, ch_request),im_info_list);
    out_data = z_data(tmp,:);
    
end

