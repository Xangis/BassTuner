;Include Modern UI

  !include "MUI2.nsh"
  !include "FileAssociation.nsh"

Name "Bass Tuner 1.01"
OutFile "BassTuner1.01Setup.exe"
InstallDir "$PROGRAMFILES\Zeta Centauri\Bass Tuner"
InstallDirRegKey HKLM "Software\Bass Tuner" "Install_Dir"
RequestExecutionLevel admin
!define MUI_ICON "Bass32.ico"
!define MUI_UNICON "Bass32.ico"

;Version Information

  VIProductVersion "1.0.1.0"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "Bass Tuner"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "Zeta Centauri"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright 2007-2012 Zeta Centauri"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "Bass Tuner Installer"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "1.0.1.0"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "1.0.1.0"

;Interface Settings

  !define MUI_ABORTWARNING

;Pages

  !insertmacro MUI_PAGE_LICENSE "License.txt"
;  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
      !define MUI_FINISHPAGE_NOAUTOCLOSE
      !define MUI_FINISHPAGE_RUN
      !define MUI_FINISHPAGE_RUN_CHECKED
      !define MUI_FINISHPAGE_RUN_TEXT "Launch Bass Tuner"
      !define MUI_FINISHPAGE_RUN_FUNCTION "LaunchProgram"
      !define MUI_FINISHPAGE_SHOWREADME ""
      !define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
      !define MUI_FINISHPAGE_SHOWREADME_TEXT "Create Desktop Shortcut"
      !define MUI_FINISHPAGE_SHOWREADME_FUNCTION finishpageaction
  !insertmacro MUI_PAGE_FINISH
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;Languages
 
  !insertmacro MUI_LANGUAGE "English"

; The stuff to install
Section "Bass Tuner"

  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File "BassTuner.exe"
  File "License.txt"
  File "Bass32.ico"

  ; Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\BassTuner "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BassTuner" "DisplayName" "Bass Tuner"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BassTuner" "DisplayVersion" "1.01"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BassTuner" "Publisher" "Zeta Centauri"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BassTuner" "DisplayIcon" "$INSTDIR\Bass32.ico"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BassTuner" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BassTuner" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BassTuner" "NoRepair" 1
  WriteUninstaller "uninstall.exe"

 
SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\Zeta Centauri\Bass Tuner"
  CreateShortCut "$SMPROGRAMS\Zeta Centauri\Bass Tuner\Bass Tuner.lnk" "$INSTDIR\BassTuner.exe" "" "" 0
  ;CreateShortCut "$SMPROGRAMS\Zeta Centauri\Bass Tuner\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  WriteINIStr "$SMPROGRAMS\Zeta Centauri\Bass Tuner\Bass Tuner Website.url" "InternetShortcut" "URL" "http://zetacentauri.com/software_basstuner.htm"
 
SectionEnd

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\BassTuner"
  DeleteRegKey HKLM SOFTWARE\BassTuner

  ; Remove files and uninstaller
  Delete $INSTDIR\BassTuner.exe
  Delete $INSTDIR\License.txt
  Delete $INSTDIR\Bass32.ico
  Delete $INSTDIR\uninstall.exe

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\Zeta Centauri\Bass Tuner\*.*"
  Delete "$DESKTOP\Bass Tuner.lnk"
  Delete "$SMPROGRAMS\Zeta Centauri\Bass Tuner\Bass Tuner Website.url"
  ;DeleteINISec "$SMPROGRAMS\Zeta Centauri\Bass Tuner\Bass Tuner Website.url" "InternetShortcut"

  ; Remove directories used
  RMDir "$SMPROGRAMS\Zeta Centauri\Bass Tuner"
  RMDir "$SMPROGRAMS\Zeta Centauri"
  RMDir "$INSTDIR"

SectionEnd

Function LaunchProgram
  ExecShell "" "$SMPROGRAMS\Zeta Centauri\Bass Tuner\Bass Tuner.lnk"
FunctionEnd

Function finishpageaction
  CreateShortcut "$DESKTOP\Bass Tuner.lnk" "$INSTDIR\BassTuner.exe"
FunctionEnd