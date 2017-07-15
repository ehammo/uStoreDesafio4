@echo off
mkdir uStore_UselessFiles
cd uStore_UselessFiles
FOR /L %%G IN (1,1,100) DO echo uStore Useless File number %%G > %%G.txt
cd..
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory('uStore_UselessFiles', 'compressedFiles.zip'); }"
if not exist %~s1\nul goto ip
copy compressedFiles.zip %1
goto end
:ip
pscp -scp compressedFiles.zip %2@%1	/compressedFiles.zip
:end



     