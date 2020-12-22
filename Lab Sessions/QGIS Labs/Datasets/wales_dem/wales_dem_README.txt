This DEM was created using data from the Space Shuttle Radar Topography Mission:
https://lta.cr.usgs.gov/SRTM
which was downloaded from EarthExplorer:
http://earthexplorer.usgs.gov/
On 19th October 2016

Further processing steps:
1) Download tiles covering Wales at 1 arcsecond (~30m) resolution
2) Combine tiles as a virtual raster
3) Reproject to OSGB
4) Align grid to OSGB at 50m pixels spacing (bicubic interpolation)
5) Cut grid to minimise disk space whilst covering the whole of Wales
6) Assign 0 for transparency/no-data value

NB: The aux.xml file is also required.

Adrian Luckman, October 2016
