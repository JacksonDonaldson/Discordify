set "PATH=%PATH%;%ProgramFiles%\discordify\"
for /f "usebackq tokens=*" %%a in (`ffprobe -v error -show_entries format^=duration -of default^=noprint_wrappers^=1:nokey^=1 %1`) do set length=%%a
set /a rate=54000/%length%
echo %rate%
ffmpeg -y -i %1 -c:v libx264 -b:v %rate%k -pass 1 -an -f null nul && ^ffmpeg -y -i %1 -c:v libx264 -b:v %rate%k -pass 2 -c:a aac -b:a %rate%k %1_discorded.mp4
del ffmpeg2pass-0.log
del ffmpeg2pass-0.log.mbtree