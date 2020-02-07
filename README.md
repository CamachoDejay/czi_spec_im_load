# CZI spectral imaging: loading into MATLAB
Loading and handling of spectral imaging data from CZI format using bioformats.

Project developed for user support at the [Centre for Cellular Imaging](https://cf.gu.se/english/centre_for_cellular_imaging) of [Gothenburg university](https://www.gu.se/english). 

# What is in the project

_main_ script to load and manipulate .CZI images adquired in the LSM780. Particular focus in handling data sets with spectral imaging and z stacks

# How do I get set up

You must install [bioformats](https://docs.openmicroscopy.org/bio-formats/6.1.0/users/matlab/index.html). Please follow instructions in the link and __make sure bioformats is added to your MATLAB path__. If this is not done properly the instruction on line 10 of main "bfopen" will not work.



