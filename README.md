# Delete_older_than_x-Minutes
Batch File to delete Files in the folder which are older than 5 minutes
# On Line 2 replace the Directory path where you need to delete files.

# On Line 12 relace the minutes whatever you need
if %MinsOld% gtr %Min% del %file%
