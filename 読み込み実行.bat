@echo off
set path=%path%;F:\app\sqlite\sqlite3
del tmp\aaa.csv
del tmp\new.csv
del result.csv
set /p name=ダウンロードフォルダのファイル名(拡張子不要):
rem set name=realized_pl(US)_20230212_182401
set /p mon=対象月(02):
copy /Y "%USERPROFILE%\Downloads\%name%.csv" "F:\app\sqlite\tmp\aaa.csv"

powershell -command "Get-Content tmp\aaa.csv | Select-Object -Skip 1 | Select-Object -SkipLast 2 | Out-File tmp\new.csv -Encoding utf8"

sqlite3 soneki.db "drop table soneki"
sqlite3 soneki.db < tmp\soneki.sql

sqlite3 soneki.db ".header on" ".mode csv" ".output result.csv" "SELECT ticker, name, SUM(kai*num) as 買い, SUM(uri*num) as 売り, SUM(soneki) AS 損益 FROM soneki WHERE substr(y_bi, 1, 7) = '2023/%mon%' GROUP BY ticker"

rem call DB_Browser.bat