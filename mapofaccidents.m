filename = 'Accidentdata.csv' ;
opts = detectImportOptions(filename) ;

Accidents = readtable('Accidentdata.csv',opts) ; 
longlat = table(Accidents.Longitude,...
                Accidents.Latitude) ; 
longlat.Properties.VariableNames = {'Longitude'...
                                    'Latitude'} ;
worldmap([49 59],[-12 4]) ; 
geoshow('landareas.shp'); 
geoshow(longlat.Latitude,longlat.Longitude,...
        'DisplayType', 'Point', 'Marker', '+', 'Color', 'red') ;
    
    