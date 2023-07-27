@echo off
title Projeto Jo-Ken-Po
mode 60,30
color 0A

:inicio
    echo.
    set /p user=Digite seu nome: 
    goto:menu
:menu
    cls
	echo.
    echo ------------------------------------
    echo     Seja Bem-Vindo(a), %user%!
    echo ------------------------------------
    echo [1] Iniciar o Jogo
    echo [2] Regras
    echo [3] Sair do Jogo
    echo ------------------------------------
    set /p op=Escolha uma Opcao: 
    if %op% == 1 (goto:game)
    if %op% == 2 (goto:regras)
    if %op% == 3 (exit) else (
        echo.
        echo --------------------
        echo   Opcao Invalida!
        echo --------------------
        pause > nul
        goto:menu)
    set /a empate = 0
    set /a derrota = 0
    set /a vitoria = 0
    set /a ponto = 1
:regras
    cls
    echo --------------------------------------------
    echo -         Regras do Jo-Ken-Po              -
    echo -                                          -
    echo -   Pedra:   Empata com Pedra;             -
    echo -            Ganha de Tesoura e Lagarto;   -
    echo -            Perde de Papel e Spock;       -
    echo -                                          -
    echo -   Papel:   Empata com Papel;             -
    echo -            Ganha de Pedra e Spock;       -
    echo -            Perde de Tesoura e Lagarto;   -
    echo -                                          -
    echo -   Tesoura: Empata com Tesoura;           -                       
    echo -            Ganha de Lagarto e Papel;     -
    echo -            Perde de Pedra e Spock;       -
    echo -                                          -
    echo -   Lagarto: Empata com Lagarto;           -
    echo -            Ganha de Papel e Spock;       -
    echo -            Perde de Pedra e Tesoura;     -
    echo -                                          -
    echo -   Spock:   Empata com Spock;             -
    echo -            Ganha de Pedra e Tesoura;     -
    echo -            Perde de Lagarto e Papel.     -
    echo --------------------------------------------
    echo [1] VOLTAR AO MENU PRINCIPAL
    echo [2] JOGAR
    echo.
    set /p regraop=Escolha uma Opcao: 
    echo.
    if %regraop% == 1 (goto:menu)
    if %regraop% == 2 (goto:game) else (
        echo.
        echo --------------------
        echo   Opcao Invalida!
        echo --------------------
        pause > nul
        goto:regras)
:game
    cls  
    echo.
    echo ------------------------------------
    echo  [1] Pedra
    echo  [2] Papel
    echo  [3] Tesoura
    echo  [4] Lagarto
    echo  [5] Spock
    echo  [V] VOLTAR AO MENU PRINCIPAL
    echo  [R] REGRAS
    echo  [S] SAIR
    echo ------------------------------------
    set /p opcaojogo=Escolha uma Opcao: 
    echo.
    if %opcaojogo% == 1 (goto:jogadasPedra)
    if %opcaojogo% == 2 (goto:jogadasPapel)
    if %opcaojogo% == 3 (goto:jogadasTesoura)
    if %opcaojogo% == 4 (goto:jogadasLagarto)
    if %opcaojogo% == 5 (goto:jogadasSpock)
    if /i %opcaojogo% == V (goto:menu)
    if /i %opcaojogo% == R (goto:regras)
    if /i %opcaojogo% == S (exit) else (     
        echo.
        echo --------------------
        echo   Opcao Invalida!
        echo --------------------
        pause > nul
        goto:game)   
:jogadasPedra
    set /a jogadaPC=(%random% %% 5) + 1
    if %jogadaPC% == 1 (
        echo                        %user%      Maquina 
        echo                        Pedra  x   Pedra
        echo.
        echo                        O jogo Empatou!! 
        set /a empate=%empate%+1      
    )
    if %jogadaPC% == 2 (
        echo                        %user%     Maquina 
        echo                        Pedra  x  Papel
        echo.
        echo                          Voce Perdeu!!
        set /a derrota=%derrota%+1
    )
    if %jogadaPC% == 3 (
        echo                        %user%      Maquina 
        echo                        Pedra  x  Tesoura
        echo.
        echo                          Voce Venceu!!
        set /a vitoria=%vitoria%+1
    )
    if %jogadaPC% == 4 (
        echo                       %user%      Maquina 
        echo                       Pedra  x  Lagarto
        echo.
        echo                         Voce Venceu!!
        set /a vitoria=%vitoria%+1
    )
    if %jogadaPC% == 5 (
        echo                        %user%     Maquina 
        echo                        Pedra  x  Spock
        echo.
        echo                         Voce Perdeu!!
        set /a derrota=%derrota%+1
    )
	goto:placar
:jogadasPapel
    set /a jogadaPC=(%random% %% 5) + 1

    if %jogadaPC% == 1 (
        echo                        %user%    Maquina 
        echo                        Papel  x   Pedra
        echo.
        echo                          Voce Venceu!!
        set /a vitoria = %vitoria%+1
    )
    if %jogadaPC% == 2 (
        echo                       %user%     Maquina 
        echo                       Papel  x   Papel
        echo.
        echo                       O jogo Empatou!! 
        set /a empate = %empate%+1
    )
    if %jogadaPC% == 3 (
        echo                      %user%      Maquina 
        echo                      Papel  x  Tesoura
        echo.
        echo                        Voce Perdeu!!
        set /a derrota = %derrota%+1
    )
    if %jogadaPC% == 4 (
        echo                      %user%      Maquina 
        echo                      Papel  x  Lagarto
        echo.
        echo                        Voce Perdeu!!
        set /a derrota = %derrota%+1
    )
    if %jogadaPC% == 5 (
        echo                      %user%      Maquina 
        echo                      Papel  x   Spock
        echo.
        echo                        Voce Venceu!!
        set /a vitoria = %vitoria%+1
    )
	goto:placar
:jogadasTesoura
    set /a jogadaPC=(%random% %% 5) + 1

    if %jogadaPC% == 1 (
        echo                       %user%     Maquina 
        echo                       Tesoura  x  Pedra
        echo.
        echo                          Voce Perdeu!!
        set /a derrota = %derrota%+1
    )
    if %jogadaPC% == 2 (
        echo                       %user%       Maquina 
        echo                      Tesoura  x   Papel
        echo.
        echo                         Voce Venceu!!
        set /a vitoria = %vitoria%+1
    )
    if %jogadaPC% == 3 (
        echo                       %user%       Maquina 
        echo                      Tesoura  x  Tesoura
        echo.
        echo                       O jogo Empatou!!
        set /a empate = %empate%+1
    )
    if %jogadaPC% == 4 (
        echo                     %user%       Maquina 
        echo                    Tesoura  x  Lagarto
        echo.
        echo                       Voce Venceu!!
        set /a vitoria = %vitoria%+1
    )
    if %jogadaPC% == 5 (
        echo                     %user%      Maquina 
        echo                    Tesoura  x  Spock
        echo.
        echo                      Voce Perdeu!!
        set /a derrota = %derrota%+1
    )
	goto:placar
:jogadasLagarto
    set /a jogadaPC=(%random% %% 5) + 1

    if %jogadaPC% == 1 (
        echo                         %user%     Maquina 
        echo                        Lagarto  x  Pedra
        echo.
        echo                           Voce Perdeu!!
        set /a derrota = %derrota%+1
    )
    if %jogadaPC% == 2 (
        echo                        %user%      Maquina 
        echo                       Lagarto  x  Papel
        echo.
        echo                          Voce Venceu!!
        set /a vitoria = %vitoria%+1
    )
    if %jogadaPC% == 3 (
        echo                       %user%       Maquina 
        echo                      Lagarto  x  Tesoura
        echo.
        echo                         Voce Perdeu!!
        set /a derrota = %derrota%+1
    )
    if %jogadaPC% == 4 (
        echo                      %user%       Maquina 
        echo                     Lagarto  x  Lagarto
        echo.
        echo                       O Jogo Empatou!!
        set /a empate = %empate%+1
    )
    if %jogadaPC% == 5 (
        echo                      %user%       Maquina 
        echo                     Lagarto  x   Spock
        echo.
        echo                        Voce Venceu!!
        set /a vitoria = %vitoria%+1
    )
	goto:placar
:jogadasSpock
    set /a jogadaPC=(%random% %% 5) + 1

    if %jogadaPC% == 1 (
        echo                       %user%     Maquina 
        echo                       Spock  x  Pedra
        echo.
        echo                         Voce Venceu!!
        set /a vitoria = %vitoria%+1
    )
    if %jogadaPC% == 2 (
        echo                       %user%     Maquina 
        echo                       Spock  x  Papel
        echo.
        echo                        Voce Perdeu!!
        set /a derrota = %derrota%+1
    )
    if %jogadaPC% == 3 (
        echo                       %user%      Maquina 
        echo                       Spock  x  Tesoura
        echo.
        echo                         Voce Venceu!!
        set /a vitoria = %vitoria%+1
    )
    if %jogadaPC% == 4 (
        echo                       %user%      Maquina 
        echo                       Spock  x  Lagarto
        echo.
        echo                         Voce Perdeu!!
        set /a derrota = %derrota%+1
    )
    if %jogadaPC% == 5 (
        echo                        %user%     Maquina 
        echo                        Spock  x  Spock
        echo.
        echo                        O Jogo Empatou!!
        set /a empate = %empate%+1
    )
	goto:placar
:placar
    echo.
    echo ---------- Placar do Jogo de %user% ----------
    echo VITORIAS: %vitoria%
    echo DERROTAS: %derrota%
    echo EMPATES: %empate%
    echo.
    set /p again=Deseja jogar novamente? (S/N) : 
    if /i %again% == s (goto:game)
    if /i %again% == n (goto:menu) else (
    echo.
    echo =========================================
    echo             OPCAO INVALIDA
    echo =========================================
    pause > nul
    goto:game)