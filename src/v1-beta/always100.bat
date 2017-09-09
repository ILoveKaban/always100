@echo off
cls
pushd %0\..
title always100 v1-β
rem 初期設定

rem ---------------------
rem always100 v1-β
rem Author: Tateshiki0529
rem at 2017/09/09
rem ---------------------

rem コンフィグ読み込み動作
if not exist always100.cfg (
	type always100.cfg > always100.cfg
	echo checkNum=100> always100.cfg
	echo createNum=10>> always100.cfg
	set checkNum=100
	set createNum=10
) else (
	for /f "delims== tokens=1,* eol=#" %%i in ('findstr /r "^[a-zA-Z0-9][a-zA-Z0-9]*=" "always100.cfg"') do set %%i=%%j
)

rem 作業開始
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
	echo このファイルはalways100の%nowCheckNum%.alwaysファイルだよ> %nowCheckNum%.always
	echo 残りおよそ %remainCheck% 秒待たないと終わらないよww>> %nowCheckNum%.always
) else (
	echo このファイルはalways100の%nowCheckNum%.alwaysファイルだよ> %nowCheckNum%.always
	echo 残りおよそ %remainCheck% 秒待たないと終わらないよww>> %nowCheckNum%.always
)
if %nowCheckNum% == %createNum% goto resetCheck
goto loop2

:resetCheck
set nowCheckNum=0
goto loop