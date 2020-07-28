filename = 'Accidentdata.csv' ;
opts = detectImportOptions(filename) ;

Accidents = readtable('Accidentdata.csv',opts) ; 

longlatSeverity = table(Accidents.Longitude,...
                Accidents.Latitude,...
                Accidents.Accident_Severity) ; 
longlatSeverity.Properties.VariableNames = {'Longitude'...
                                            'Latitude'...
                                            'Severity'} ;
longlatSeverity(ismember(longlatSeverity.Severity,3),:)=[];                                        

longlatSeverity.Severity = categorical(longlatSeverity.Severity);

gb = geobubble(longlatSeverity,'Latitude','Longitude') ;
gb.SourceTable.Severity = (longlatSeverity.Severity) ;
gb.ColorVariable = 'Severity';
neworder = {'2','1'};
gb.SourceTable.Severity = reordercats(gb.SourceTable.Severity,neworder);