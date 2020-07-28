%read in files
filename = 'processingstep2.csv' ;
opts = detectImportOptions(filename) ;

dataneeded = readtable(filename,opts) ; 

NoJunc = varfun(@NotAtJunction,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
NoJunc = removevars(NoJunc,...
                    {'GroupCount'}) ;
RoundJunc = varfun(@Rondabout,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
RoundJunc = removevars(RoundJunc,...
                    {'GroupCount'}) ;
MiniJunc = varfun(@MiniRoundabout,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
MiniJunc = removevars(MiniJunc,...
                    {'GroupCount'}) ;
TJunc = varfun(@Tjunction,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
TJunc = removevars(TJunc,...
                    {'GroupCount'}) ;
SlipJunc = varfun(@SlipRoad,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
SlipJunc = removevars(SlipJunc,...
                    {'GroupCount'}) ;
CrossJunc = varfun(@CrossRoad,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
CrossJunc = removevars(CrossJunc,...
                    {'GroupCount'}) ;
More4Junc = varfun(@MoreThan4Arms,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
More4Junc = removevars(More4Junc,...
                    {'GroupCount'}) ;
PrivJunc = varfun(@privateDrive,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
PrivJunc = removevars(PrivJunc,...
                    {'GroupCount'}) ;
OtherJunc = varfun(@OtherJunction,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
OtherJunc = removevars(OtherJunc,...
                    {'GroupCount'}) ;
MissJunc = varfun(@MissingData,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Junction_Detail') ;
MissJunc = removevars(MissJunc,...
                    {'GroupCount'}) ;

dataneeded = join(dataneeded,NoJunc) ; 
dataneeded = join(dataneeded,RoundJunc) ;
dataneeded = join(dataneeded,MiniJunc) ; 
dataneeded = join(dataneeded,TJunc) ; 
dataneeded = join(dataneeded,SlipJunc) ; 
dataneeded = join(dataneeded,CrossJunc) ; 
dataneeded = join(dataneeded,More4Junc) ; 
dataneeded = join(dataneeded,PrivJunc) ;   
dataneeded = join(dataneeded,OtherJunc) ; 
dataneeded = join(dataneeded,MissJunc) ;

vars = {'NoJunc','RoundJunc','MiniJunc',...
        'TJunc','SlipJunc',...
        'CrossJunc','More4Junc','PrivJunc','OtherJunc','MissJunc'} ;
clear(vars{:}) ; 

dataneeded = removevars(dataneeded,...
                       {'Junction_Detail'});
                   
DrySurface = varfun(@Dry,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Road_Surface_Conditions') ;
DrySurface = removevars(DrySurface,...
                    {'GroupCount'}) ;
WetSurface = varfun(@Wet,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Road_Surface_Conditions') ;
WetSurface = removevars(WetSurface,...
                    {'GroupCount'}) ;
SnowSurface = varfun(@Snow,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Road_Surface_Conditions') ;
SnowSurface = removevars(SnowSurface,...
                    {'GroupCount'}) ;
IceSurface = varfun(@Ice,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Road_Surface_Conditions') ;
IceSurface = removevars(IceSurface,...
                    {'GroupCount'}) ;
FloodSurface = varfun(@Flooded,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Road_Surface_Conditions') ;
FloodSurface = removevars(FloodSurface,...
                    {'GroupCount'}) ;
OilSurface = varfun(@Oil,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Road_Surface_Conditions') ;
OilSurface = removevars(OilSurface,...
                    {'GroupCount'}) ;
MudSurface = varfun(@Mud,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Road_Surface_Conditions') ;
MudSurface = removevars(MudSurface,...
                    {'GroupCount'}) ;
NoDataSurface = varfun(@SurfaceDataMissing,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Road_Surface_Conditions') ;
NoDataSurface = removevars(NoDataSurface,...
                    {'GroupCount'}) ;
                
dataneeded = removevars(dataneeded,...
                       {'Road_Surface_Conditions'});

dataneeded = join(dataneeded,DrySurface) ; 
dataneeded = join(dataneeded,WetSurface) ;
dataneeded = join(dataneeded,SnowSurface) ; 
dataneeded = join(dataneeded,IceSurface) ; 
dataneeded = join(dataneeded,FloodSurface) ; 
dataneeded = join(dataneeded,OilSurface) ; 
dataneeded = join(dataneeded,MudSurface) ; 
dataneeded = join(dataneeded,NoDataSurface) ;   

vars = {'DrySurface','WetSurface','SnowSurface',...
        'IceSurface','FloodSurface',...
        'OilSurface','MudSurface','NoDataSurface'} ;
clear(vars{:}) ; 

UrbanArea = varfun(@Urban,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Urban_or_Rural_Area') ;
UrbanArea = removevars(UrbanArea,...
                    {'GroupCount'}) ;
RuralArea = varfun(@Rural,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Urban_or_Rural_Area') ;
RuralArea = removevars(RuralArea,...
                    {'GroupCount'}) ;
UnalloArea = varfun(@Unallocated,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'Urban_or_Rural_Area') ;
UnalloArea = removevars(UnalloArea,...
                    {'GroupCount'}) ;
dataneeded = removevars(dataneeded,...
                       {'Urban_or_Rural_Area'});
dataneeded = join(dataneeded,UrbanArea) ; 
dataneeded = join(dataneeded,RuralArea) ; 
dataneeded = join(dataneeded,UnalloArea) ;   

vars = {'UrbanArea','RuralArea','UnalloArea'} ;
clear(vars{:}) ;            

isJan = varfun(@January,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isJan = removevars(isJan,...
                    {'GroupCount'}) ;
isFeb = varfun(@Febuary,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isFeb = removevars(isFeb,...
                    {'GroupCount'}) ;
isMarch = varfun(@March,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isMarch = removevars(isMarch,...
                    {'GroupCount'}) ;
isApril = varfun(@April,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isApril = removevars(isApril,...
                    {'GroupCount'}) ;
isMay = varfun(@May,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isMay = removevars(isMay,...
                    {'GroupCount'}) ;
isJune = varfun(@June,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isJune = removevars(isJune,...
                    {'GroupCount'}) ;
isJul = varfun(@July,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isJul = removevars(isJul,...
                    {'GroupCount'}) ;
isAug = varfun(@August,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isAug = removevars(isAug,...
                    {'GroupCount'}) ;
isSep = varfun(@September,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isSep = removevars(isSep,...
                    {'GroupCount'}) ;
isOct = varfun(@October,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isOct = removevars(isOct,...
                    {'GroupCount'}) ;
isNov = varfun(@November,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isNov = removevars(isNov,...
                    {'GroupCount'}) ;
isDec = varfun(@December,...
                dataneeded,...
                'GroupingVariables',...
                'index',...
                'InputVariables',...
                'DateTime') ;
isDec = removevars(isDec,...
                    {'GroupCount'}) ;
dataneeded = join(dataneeded,isJan) ; 
dataneeded = join(dataneeded,isFeb) ; 
dataneeded = join(dataneeded,isMarch) ; 
dataneeded = join(dataneeded,isApril) ; 
dataneeded = join(dataneeded,isMay) ; 
dataneeded = join(dataneeded,isJune) ; 
dataneeded = join(dataneeded,isJul) ; 
dataneeded = join(dataneeded,isAug) ; 
dataneeded = join(dataneeded,isSep) ; 
dataneeded = join(dataneeded,isOct) ; 
dataneeded = join(dataneeded,isNov) ; 
dataneeded = join(dataneeded,isDec) ; 

vars = {'isJan','isFeb','isMarch','isApril','isMay',...
        'isJune','isJul','isAug','isSep','isOct','isNov','isDec'} ;
clear(vars{:}) ;  

dataneeded = dataneeded(randperm(size(dataneeded,1)),:) ; 

%write table to file
writetable(dataneeded,...
           "processingstep3.csv");    


function x = January(y) 
    if month(y) == 1
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = Febuary(y) 
    if month(y) == 2
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = March(y) 
    if month(y) == 3
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = April(y) 
    if month(y) == 4
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = May(y) 
    if month(y) == 5
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = June(y) 
    if month(y) == 6
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = July(y) 
    if month(y) == 7
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = August(y) 
    if month(y) == 8
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = September(y) 
    if month(y) == 9
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = October(y) 
    if month(y) == 10
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = November(y) 
    if month(y) == 11
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = December(y) 
    if month(y) == 12
        x = 1 ; 
    else
        x = 0 ;
    end 
end


function x = Urban(y) 
    if y == 1
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = Rural(y) 
    if y == 2
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = Unallocated(y) 
    if y == 3
        x = 1 ; 
    else
        x = 0 ;
    end 
end


function x = Dry(y) 
    if y == 1
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = Wet(y) 
    if y == 2
        x = 1 ; 
    else
        x = 0 ;
    end 
end                   
function x = Snow(y) 
    if y == 3
        x = 1 ; 
    else
        x = 0 ;
    end 
end                   
function x = Ice(y) 
    if y == 4
        x = 1 ; 
    else
        x = 0 ;
    end 
end                   
function x = Flooded(y) 
    if y == 5
        x = 1 ; 
    else
        x = 0 ;
    end 
end                   
function x = Oil(y) 
    if y == 6
        x = 1 ; 
    else
        x = 0 ;
    end 
end                   
function x = Mud(y) 
    if y == 7
        x = 1 ; 
    else
        x = 0 ;
    end 
end                   
function x = SurfaceDataMissing(y) 
    if y == -1
        x = 0 ; 
    else
        x = 0 ;
    end 
end                   


function x = NotAtJunction(y) 
    if y == 0
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = Rondabout(y) 
    if y == 1
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = MiniRoundabout(y) 
    if y == 2
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = Tjunction(y) 
    if y == 3
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = SlipRoad(y) 
    if y == 5
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = CrossRoad(y) 
    if y == 6
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = MoreThan4Arms(y) 
    if y == 7
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = privateDrive(y) 
    if y == 8
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = OtherJunction(y) 
    if y == 9
        x = 1 ; 
    else
        x = 0 ;
    end 
end
function x = MissingData(y) 
    if y == -1
        x = 0 ; 
    else
        x = 0 ;
    end 
end
