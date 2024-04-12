select * from Students


select substring([Email],charindex('@',[Email])+1,len([Email])) from Students



select substring([Email],1,charindex('@',[Email])-1) from Students