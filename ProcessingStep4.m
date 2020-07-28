filename = 'processingstep3.csv' ;
opts = detectImportOptions(filename) ;

dataneeded = readtable(filename,opts) ; 

dataneeded = removevars(dataneeded,...
                      {
                       'index'
                       });
                   
%write table to file
writetable(dataneeded,...
           "processingstep3.csv");    