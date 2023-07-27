@echo off
title Sorteio
mode 60,30
color 0A
:inicio
set /a cont=0
set /a numero=(%random% %%49) + 1  
goto:menu
:menu
cls
set /a cont=%cont% + 1
echo.
echo ==========================================
echo  ADVINHE UM NUMERO SORTEADO ENTRE 01 E 50
echo ==========================================
echo       NUMERO DE TENTATIVAS: %cont%
echo ==========================================
echo.
set /p op=Digite o seu palpite:

if /i %numero% == %op% (goto:ganhou) else (goto:dica)

:ganhou
echo.
echo VOCE GANHOU!
echo Numero sorteado: %numero%
pause
goto:sair

:dica
if %numero% GTR %op% (
	echo.
	echo Digite um numero maior !!!
	pause
	goto:cont) else (
		echo.
		echo Digite um numero menor!
		pause
		goto:cont)

:cont
if %cont% == 5 (
echo.
echo VOCE PERDEU!
echo Numero sorteado: %numero%
goto:sair) else (goto:menu)

:sair
set/p sair=Deseja jogar novamente?[S/N]...
if /i %sair% == s (goto:inicio) else (exit)