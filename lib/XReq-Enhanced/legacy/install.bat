set /p variable=Rentrer le chemin absolue du dossier racine de Gnat : 
gprbuild -p -d -Pxreq.gpr -Xtype=static -Xmode=release
gprbuild -p -d -Pxreqlib.gpr -Xtype=static -Xmode=release
copy bin\xreq.rel.exe %variable%\bin\xreq.exe
mkdir %variable%\lib\xreqlib
copy lib\xreqlib %variable%\lib\xreqlib
mkdir %variable%\include\xreqlib
copy src\lib\*.ads %variable%\include\xreqlib\
copy src\lib\*.adb %variable%\include\xreqlib\
copy data\xreqlib.gpr %variable%\lib\gnat\xreqlib.gpr
copy data\gps-plug-in\* %variable%\share\gps\plug-ins\
pause