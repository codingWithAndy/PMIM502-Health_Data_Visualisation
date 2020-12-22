This dataset was derived from data downloaded from a DTI website in ~2012 and is no longer available as far as I know. See their information below.

Processing steps:
1) convert from ascii text to binary
2) convert to Geotiff

Adrian Luckman, October 2016







DEPARTMENT OF TRADE AND INDUSTRY WIND SPEED DATABASE
==========
 
BACKGROUND
----------
 
The Department of Trade and Industry wind speed database contains estimates 
of the annual mean wind speed throughout the UK. The data
is the result of an air flow model that estimates the effect of topography on
wind speed.  There is no allowance for the effect of local thermally driven
winds such as sea breezes or mountain/valley breezes.  The model was applied
with 1km resolution and makes no allowance for topography on a small scale or
local surface roughness (such as tall crops, stone walls, or trees), both of
which may have a considerable effect on the wind speed.  The data can only be
used as a guide and should be followed by on-site measurements for a proper
assessment.
 
Each value stored in the database is the estimated average for a 1km square
at either 10m, 25m or 45m above ground level (agl).  The database uses the
Ordnance Survey grid systems for both Great Britain and Northern Ireland.
The grid references used describe the bottom left corner of each 1km square.
 
The DEPARTMENT OF TRADE AND INDUSTRY wind speed data is stored in ASCII (text) format.
 
DISCLAIMER
----------
 
The DEPARTMENT OF TRADE AND INDUSTRY wind speed data is provided free of charge and is not
warranted as suitable for any particular purpose or use. The User shall
assume full responsibility for his use of the data.
 
ASCII FILE CONTENTS
-------------------
 
There are two sets of data files.  One covers Great Britain and the other
covers Northern Ireland.  Each set comprises three files containing wind
speed data at one of three heights above ground level.
 
These files are:
 
Great Britain
 
  Speed10.asc   10 metres above ground level
  Speed25.asc   25 metres above ground level
  Speed45.asc   45 metres above ground level
 
Northern Ireland
 
  Speed10i.asc  10 metres above ground level
  Speed25i.asc  25 metres above ground level
  Speed45i.asc  45 metres above ground level
 
ASCII FILE STRUCTURE
--------------------
 
Each ASCII file has a header line with information about the source file,
file type etc.
 
Subsequent lines in the file have the appearance:
 
(Easting, Northing) speed; speed; speed; etc.
 
where
 
Easting    The East co-ordinate to the first value in the line
 
Northing   The North co-ordinate for that line
 
speed      Is the wind speed estimate for the kilometre square
           in m/s.
 
There are 100 wind speed estimates in each line of the ASCII file. East is
incremented by 1 for each new wind speed estimate. Each of the wind speed
estimates is delimited by the character ';' so that other software packages
may separate each of the wind speed estimates.  This is a fixed-width data
file.
 
README.TXT  Version 1  15/09/98
