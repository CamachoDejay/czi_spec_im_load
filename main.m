% clear all
clc;
clear;
close all;


%% Light microscopy data
% load full data set using bioformats
data_folder = 'W:\Image Processing Projects\Wojciech\data\20191002 - Data transfer + scripts\191002_3DFusion\Hyperspectral';
czi_name = 'G1_6_bottom.czi';
czi_path = [data_folder filesep czi_name];
data = bfopen(czi_path);

% check for the number of sets, this program is made to work with data that
% only has 1
nSets = size(data,1);
fprintf('Number of data sets in file: %.0f \n', nSets);
assert(nSets == 1, 'at the moment we work with only 1 set data. However, this can be changed');
set_i = 1;
fprintf('Looking into set: %.0f \n', set_i);
set_data = data{set_i, 1};

%% check for number of planes, z dim x spectral dim
nPlanes = size(set_data,1);
fprintf('Number of planes in set_%.0f: %.0f \n', set_i, nPlanes);
fprintf('When working with spectral imaging with Z-stack, each plane is for a given combination of z-plane and SpecChannel\n');

%% load full spectral data, with visual 
z_request = 1;
plane_i = 1;
im_str = set_data{plane_i,2};
[~, ~, nChannels] = load.czi.getInfo.channel(im_str);
[z_info, ~, ~] = load.czi.getInfo.zpos(im_str);

[out_data] = load.czi.getImage.channel_zpos(set_data, 1, z_request);
im = out_data{1,1};
LM_data = zeros(size(im,1), size(im,2), nChannels, 'like', im);
LM_data(:,:,1) = im;

for ch_request = 2:nChannels
    [out_data] = load.czi.getImage.channel_zpos(set_data, ch_request, z_request);
    im = out_data{1,1};
    LM_data(:,:,ch_request) = im;
    figure(1)
    imagesc(im);
    axis image
    title(['Channel: ' num2str(ch_request)]);
    pause(.1)
end

%
ave_spec = mean(mean(LM_data,2),1);
ave_spec = permute(ave_spec,[3,1,2]);
figure(2)
xvals = 1:nChannels;
plot(xvals, ave_spec)
xlim([1 nChannels])
shg
title('Average emission spectra')
%%
figure(10)
LM_IM = median(LM_data,3);
imagesc(LM_IM)
axis image
title('Median image')
shg