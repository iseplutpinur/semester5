@echo off
title Backup database
echo Backup database. Tugas Mata kuliah Database Manajemen Sistem Lanjut
echo Isep Lutpi Nur 2113191079

:: Set dir variables. Use ~1 format in win2k
set basedir=C:\BACKUP~1
set workdir=c:\TEMP
set mysqldir=C:\xampp\mysql\bin
set gzipdir=c:\PROGRA~1\GnuWin32\bin
set mysqlpassword=1008
set mysqluser=iseplutpi

:: Change to mysqldir
cd %mysqldir%

:: dump database. This is all one line
mysqldump -u %mysqluser% -p%mysqlpassword% --all-databases >%workdir%\backup.sql

:: Change to workdir
cd %workdir%

:: Zip up database
:: %gzipdir%\gzip.exe backup.sql

:: Move to random file name
MOVE backup.sql.gz backup.%random%.gz

:: FTP file to repository
ftp -n -s:%basedir%\ftp-commands.txt

:: Remove old backup files
del backup.sql
del backup.*.gz

:: Change back to base dir
cd %basedir%

:: ----------------------------------------------------------------------------
:: END simple



:: ----------------------------------------------------------------------------
:: START advanced
:: ----------------------------------------------------------------------------

@echo off
color 0E
title MySQL backup.

:: Set some variables
set bkupdir=E:\MySQL\backup
set mysqldir=E:\MySQL
set datadir=E:\MySQL\data
set logdir=E:\MySQL\logs
set dbuser=username
set dbpass=password
set zip=C:\GZip\bin\gzip.exe
set endtime=0

:GETTIME

:: get the date and then parse it into variables
for /F "tokens=2-4 delims=/ " %%i in ('date /t') do (
  set mm=%%i
  set dd=%%j
  set yy=%%k
)

:: get the time and then parse it into variables
for /F "tokens=5-8 delims=:. " %%i in ('echo.^| time ^| find "current" ') do (
  set hh=%%i
  set ii=%%j
  set ss=%%k
)

:: If this is the second time through then go to the end of the file
if "%endtime%"=="1" goto END

:: Create the filename suffix
set fn=_%yy%%mm%%dd%_%hh%%mm%%ss%

:: Switch to the data directory to enumerate the folders
pushd %datadir%

:: Write to the log file
echo Beginning MySQLDump Process > %logdir%\LOG%fn%.txt
echo Start Time = %yy%-%mm%-%dd% %hh%:%ii%:%ss% >> %logdir%\LOG%fn%.txt
echo --------------------------- >> %logdir%\LOG%fn%.txt
echo. >> %logdir%\LOG%fn%.txt

:: Loop through the data structure in the data dir to get the database names
for /d %%f in (*) do (

  :: Create the backup sub-directory is it does not exist
  if not exist %bkupdir%\%%f\ (
    echo Making Directory %%f
    echo Making Directory %%f >> %logdir%\LOG%fn%.txt
    mkdir %bkupdir%\%%f
  ) else (
    echo Directory %%f Exists
    echo Directory %%f Exists >> %logdir%\LOG%fn%.txt
  )

  :: Run mysqldump on each database and compress the data by piping through gZip
  echo Backing up database %%f%fn%.sql.gz
  echo Backing up database %%f%fn%.sql.gz >> %logdir%\LOG%fn%.txt
  %mysqldir%\bin\mysqldump --user=%dbuser% --password=%dbpass% --databases %%f --opt --quote-names --allow-keywords --complete-insert | %zip% > %bkupdir%\%%f\%%f%fn%.sql.gz

  echo Done.
  echo Done. >> %logdir%\LOG%fn%.txt
)

:: Go back and get the end time for the script
set endtime=1
goto :GETTIME

:END
:: Write to the log file
echo. >> %logdir%\LOG%fn%.txt
echo --------------------------- >> %logdir%\LOG%fn%.txt
echo MySQLDump Process Finished >> %logdir%\LOG%fn%.txt
echo End Time = %yy%-%mm%-%dd% %hh%:%ii%:%ss% >> %logdir%\LOG%fn%.txt
echo. >> %logdir%\LOG%fn%.txt

:: Return to the scripts dir
popd

:: Send the log file in an e-mail
c:\commail\commail -host=smtp.yourcompany.com -from="server <server@yourcompany.com>" -to=serveradmins@yourcompany.com -subject="MySQL Backup" -msg=%logdir%\LOG%fn%.txt