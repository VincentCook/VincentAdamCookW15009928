%read in files
filename = 'randomdateandroad.csv' ;
opts = detectImportOptions(filename) ;

randomdatandroad = readtable(filename,opts) ; 

randomdatandroad.Properties.VariableNames = {'DateTime',...
                                               'index',...
                                               'RoadClass',...
                                               'RoadNumber'} ;

days = table(datestr(datenum(randomdatandroad.DateTime),'dddd')) ; 
days.index = (1:height(days)).' ; 

days.Properties.VariableNames = {'Day',...
                                 'index'} ;

randomdatandroad = join(randomdatandroad,days) ; 

writetable(randomdatandroad,...
           "randomdateroadday.csv");   