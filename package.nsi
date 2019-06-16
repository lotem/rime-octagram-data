; octagram data for weasel installation script
!include FileFunc.nsh
!include LogicLib.nsh
!include MUI2.nsh
!include x64.nsh

Unicode true

; 數據包標識
!define PACKAGE_ID "octagram-data"

; 數據包版本
!ifndef PACKAGE_VERSION
!define PACKAGE_VERSION 1.0.0
!endif
!ifndef PACKAGE_BUILD
!define PACKAGE_BUILD 0
!endif

; 擴展包名稱
!define PACKAGE_NAME "八股文語法數據包"

; The name of the installer
Name "${PACKAGE_NAME} ${PACKAGE_VERSION}"

; The file to write
OutFile "${PACKAGE_ID}-${PACKAGE_VERSION}.${PACKAGE_BUILD}.exe"

VIProductVersion "${PACKAGE_VERSION}.${PACKAGE_BUILD}"
VIAddVersionKey /LANG=2052 "ProductName" "${PACKAGE_NAME}"
VIAddVersionKey /LANG=2052 "Comments" "Powered by RIME | 中州韻輸入法引擎"
VIAddVersionKey /LANG=2052 "CompanyName" "式恕堂"
VIAddVersionKey /LANG=2052 "LegalCopyright" "Copyleft RIME Developers"
VIAddVersionKey /LANG=2052 "FileDescription" "${PACKAGE_NAME}"
VIAddVersionKey /LANG=2052 "FileVersion" "${PACKAGE_VERSION}"

SetCompressor /SOLID lzma

; The default installation directory
InstallDir $PROGRAMFILES\Rime

; Registry key to check for directory (so if you install again, it will
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\Rime\Weasel" "InstallDir"

; Request application privileges for Windows Vista
RequestExecutionLevel admin

;--------------------------------

; Pages

!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

;--------------------------------

; Languages

!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "TradChinese"

;--------------------------------

Function .onInit
  ; 讀取小狼毫安裝目錄
  ReadRegStr $R0 HKLM SOFTWARE\Rime\Weasel "WeaselRoot"
  StrCmp $R0 "" 0 done

  ; 找不到小狼毫安裝目錄，只好放這裏了
  StrCpy $R0 "$INSTDIR\${PACKAGE_ID}-${PACKAGE_VERSION}"

  MessageBox MB_OKCANCEL|MB_ICONINFORMATION \
  "找不到【小狼毫】安裝在哪裏。$\n$\n還要繼續安裝「${PACKAGE_NAME}」嗎？" \
  IDOK done
  Abort

done:
  ; Set INSTDIR to the root directory of existing weasel installation
  StrCpy $INSTDIR $R0
FunctionEnd

; The stuff to install
Section "Package"

  SectionIn RO

  ; stop weasel server
  IfFileExists "$INSTDIR\WeaselServer.exe" 0 +2
  ExecWait '"$INSTDIR\WeaselServer.exe" /quit'

  SetOverwrite try
  ; Set output path to data directory in weasel installation.
  SetOutPath $INSTDIR\data

  File grammar.yaml
  File zh-hant-t-essay-bgw.gram
  File zh-hant-t-essay-bgc.gram
  File zh-hans-t-essay-bgw.gram
  File zh-hans-t-essay-bgc.gram

  ; restart weasel server
  IfFileExists "$INSTDIR\WeaselServer.exe" 0 +2
  Exec '"$INSTDIR\WeaselServer.exe"'

SectionEnd

;--------------------------------
