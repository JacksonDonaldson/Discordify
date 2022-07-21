Name "Discordify Installer"
OutFile "installDiscordify.exe"
InstallDir "$PROGRAMFILES64\Discordify"
   
Section "Install"
 
  ;Add files
  SetOutPath "$INSTDIR"
   
  File "discordify.cmd"
  File "readme.txt"
  File "ffmpeg.exe"
  File "ffprobe.exe"

  ;CONTEXT REGISTRY COMMANDS
  Var /GLOBAL extPath
  
  
  StrCpy $extPath "SystemFileAssociations\.mp4"
  
  WriteRegStr HKEY_CLASSES_ROOT "$extPath\shell\Discordify" "" "Discordify"
  WriteRegStr HKEY_CLASSES_ROOT "$extPath\shell\Discordify\command" "" '"$INSTDIR\discordify.cmd" "%1"'

  WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Discordify" "DisplayName" "Discordify"
  WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Discordify" "UninstallString" "$INSTDIR\Uninstall.exe"
  
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

Section "Uninstall"
  RMDir /r "$INSTDIR\*.*"
  RMDir "$INSTDIR"
  
  Var /GLOBAL crVar
  StrCpy $crVar "SystemFileAssociations\.mp4"
  DeleteRegKey HKEY_CLASSES_ROOT "$crVar\shell\Discordify"
  
  DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Discordify"
  DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Discordify"
SectionEnd