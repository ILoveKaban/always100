@echo off
cls
pushd %0\..
title always100 v1-��
rem �����ݒ�

rem ---------------------
rem always100 v1-��
rem Author: Tateshiki0529
rem at 2017/09/09
rem ---------------------

rem �R���t�B�O�ǂݍ��ݓ���
if not exist always100.cfg (
	type always100.cfg > always100.cfg
	echo checkNum=100> always100.cfg
	echo createNum=10>> always100.cfg
	set checkNum=100
	set createNum=10
) else (
	for /f "delims== tokens=1,* eol=#" %%i in ('findstr /r "^[a-zA-Z0-9][a-zA-Z0-9]*=" "always100.cfg"') do set %%i=%%j
)

rem ��ƊJ�n
set nowCountNum=0
set nowCheckNum=0
set /a stopCountNum=%checkNum%+1
:loop
set /a nowCountNum+=1
if %nowCountNum% == %stopCountNum% (
	del *.always
	exit /b
)
:loop2
set /a nowCheckNum+=1
set /a remainCheck=%checkNum%-%nowCountNum%
if not exist %nowCheckNum%.always (
	type %nowCheckNum%.always > %nowCheckNum%.always
	echo ���̃t�@�C����always100��%nowCheckNum%.always�t�@�C������> %nowCheckNum%.always
	echo �c�肨�悻 %remainCheck% �b�҂��Ȃ��ƏI���Ȃ���ww>> %nowCheckNum%.always
) else (
	echo ���̃t�@�C����always100��%nowCheckNum%.always�t�@�C������> %nowCheckNum%.always
	echo �c�肨�悻 %remainCheck% �b�҂��Ȃ��ƏI���Ȃ���ww>> %nowCheckNum%.always
)
if %nowCheckNum% == %createNum% goto resetCheck
goto loop2

:resetCheck
set nowCheckNum=0
goto loop