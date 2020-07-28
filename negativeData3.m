%read in files
filename = 'randomdateroaddayMod.csv' ;
opts = detectImportOptions(filename) ;

RandomData = readtable(filename,opts) ; 
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
                       'Date',...
                       'Time',...
                       'Pedestrian_Crossing_Human_Control',...
                       'Pedestrian_Crossing_Physical_Facilities',...
                       'Special_Conditions_at_Site',...
                       'Carriageway_Hazards',...
                       'Accident_Severity',...
                       'Number_of_Vehicles',...
                       'Number_of_Casualties'...
                       'Day_of_Week'...
                       'DateTime'
                       });

[T,ia] = unique(Accidents(:,1:2),'rows') ; 
uniqueaccidents = Accidents(ia,:);

allrandom = outerjoin(RandomData,uniqueaccidents,'MergeKeys',true) ; 

allrandom = allrandom(find(~isnan(allrandom.Junction_Detail)),:) ;
allrandom.IsAccident(:) = 0 ;

allrandom = removevars(allrandom,...
                      {'index'}) ;

writetable(allrandom,...
           "NegativeData.csv");   