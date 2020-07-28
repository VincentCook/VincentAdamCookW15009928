
NUMBEROFTIMES = 129982*3;
SECONDSPERDAY = 24*60*60;
STARTDATE = '2017-01-01';
ENDDATE   = '2017-10-31';

startDate = datenum(STARTDATE,'yyyy-mm-dd');
endDate   = datenum(ENDDATE,  'yyyy-mm-dd');
days = endDate - startDate;
seconds = SECONDSPERDAY*days;
randomSeconds = randi(seconds,NUMBEROFTIMES,1);
randomDate = startDate + randomSeconds/SECONDSPERDAY;
randomDates = table(datestr(randomDate));

%read in files
filename = 'justroads.csv' ;
opts = detectImportOptions(filename) ;
roadnumbers = readtable(filename,opts) ; 

idx = randperm(size(roadnumbers,1),1) ;
RandomRoads = roadnumbers(idx(1),:);

for i=1:NUMBEROFTIMES -1
    idx = randperm(size(roadnumbers,1),1) ;
    T = roadnumbers(idx(1),:);
    RandomRoads = [T;RandomRoads] ; 
end

RandomRoads.index = (1:height(RandomRoads)).' ; 
randomDates.index = (1:height(randomDates)).' ; 

randomData = join(randomDates,RandomRoads) ; 

writetable(randomData,...
           "randomdateandroad.csv");   