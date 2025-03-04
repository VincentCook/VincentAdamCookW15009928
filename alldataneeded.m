%read in files
filename = 'Accidentdata.csv' ;
opts = detectImportOptions(filename) ;

Accidents = readtable(filename,opts) ; 


Accidents = removevars(Accidents,...
                      {'Accident_Index',...
                       'Location_Easting_OSGR',...
                       'Location_Northing_OSGR',...
                       'Longitude',...
                       'Latitude',...
                       'Police_Force',...
                       'Local_Authority__District_',...
                       'Local_Authority__Highway_',...
                       'Junction_Control',...
                       'x2nd_Road_Class',...
                       'x2nd_Road_Number',...
                       'Did_Police_Officer_Attend_Scene_of_Accident',...
                       'LSOA_of_Accident_Location',...
                       'Time'
                       });
                   
writetable(Accidents,...
           "alldataneeded.csv");   