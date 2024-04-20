;; Hey look at you! You're reading the file before running it like you should! There shouldnt be anything malicious, keep looking though.
#Persistent
#SingleInstance, force
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

;setting vars global
    ; reset level option
    global rl
    global searchingFor
    global opt
    ; imagepath
    global route
    ; click locations
    global ScreenMidX
    global ScreenTopY
    global MainPlayX
    global MainPlayY
    global MainSkipX
    global MainSkipY
    global PlayX
    global PlayY
    global SummonBothX
    global SummonBothY
    global SwitchX
    global SwitchY
    global InstantX
    global InstantY
    global ResetLvlX
    global ResetLvlY
    global ResetYesX
    global ResetYesY
    global ResetNoX
    global ResetNoY
    global ReplaceYesX
    global ReplaceYesY
    global ReplaceNoX
    global ReplaceNoY
    global StorageorBackX
    global StorageorBackY
    global XX
    global XY
    ; search locations
    global SearchMMX1
    global SearchMMX2
    global SearchMMY1
    global SearchMMY2
    global EssenceStorageX1
    global EssenceStorageX2
    global EssenceStorageY1
    global EssenceStorageY2
    global DisconnectedX1
    global DisconnectedX2
    global DisconnectedY1
    global DisconnectedY2
    global LevelsX1
    global LevelsX2
    global LevelsY1
    global LevelsY2
    global RollEssenceX1
    global RollEssenceX2
    global RollEssenceY1
    global RollEssenceY2
    global ReplaceEssenceX1
    global ReplaceEssenceX2
    global ReplaceEssenceY1
    global ReplaceEssenceY2
getMon()

Return

; gui
creategui() {
    gui, add, DDL, AltSubmit vopt ghighroll, Destruction|Arcane|Aether|Frost|Light|Darkness|Energy|Lightning|Poisonous|Water|Winds|Earth|Flames
    gui, show, AutoSize Center, Im feelin lucky
    return
}

highroll:
    gui, submit, nohide
    searchingFor := opt
    tooltip, option %searchingFor% selected
    sleep, 1000
    tooltip,
    gui, destroy
    gambling()
return

;; important stuff (monitor size and variables stuff)
getMon() {
    SysGet, mon, monitor
    if(monRight==2560)
        setVars(1)
    else if(monRight==1920)
        setVars(2)
    else
        setVars(3)
    return
}

setVars(selected) {
    if(selected==1) {
        ; imagepath
        route := "\Images\2560x1440p"
        ; click locations
        ScreenMidX := 1280
        ScreenTopY := 50
        MainPlayX := 1280
        MainPlayY := 750
        MainSkipX := 1280
        MainSkipY := 1280
        PlayX := 1285
        PlayY := 1135
        SummonBothX := 1285
        SummonBothY := 1200
        SwitchX := 535
        SwitchY := 1070
        InstantX := 625
        InstantY := 1210
        ResetLvlX:= 515
        ResetLvlY:= 1280
        ResetYesX := 420
        ResetYesY := 710
        ResetNoX := 660
        ResetNoY := 710
        ReplaceYesX := 1110
        ReplaceYesY := 890
        ReplaceNoX := 1470
        ReplaceNoY := 890
        StorageorBackX := 1285
        StorageorBackY := 1265
        XX := 2120
        XY := 225
        ; search locations
        SearchMMX1 := 1040
        SearchMMX2 := 1560
        SearchMMY1 := 650
        SearchMMY2 := 1440
        EssenceStorageX1 := 375
        EssenceStorageX2 := 960
        EssenceStorageY1 := 160
        EssenceStorageY2 := 315
        DisconnectedX1 := 1070
        DisconnectedX2 := 1490
        DisconnectedY1 := 550
        DisconnectedY2 := 850
        LevelsX1 := 5
        LevelsX2 := 225
        LevelsY1 := 1155
        LevelsY2 := 1385
        RollEssenceX1 := 290
        RollEssenceX2 := 730
        RollEssenceY1 := 850
        RollEssenceY2 := 1240
        ReplaceEssenceX1 := 800
        ReplaceEssenceX2 := 1800
        ReplaceEssenceY1 := 440
        ReplaceEssenceY2 := 1050
    }
    else if(selected==2) {
        ; imagepath
        route := "\Images\1920x1080p"
        ; click locations
        ScreenMidX := 960
        ScreenTopY := 50
        MainPlayX := 960
        MainPlayY := 570
        MainSkipX := 960
        MainSkipY := 960
        PlayX := 960
        PlayY := 855
        SummonBothX := 960
        SummonBothY := 915
        SwitchX := 390
        SwitchY := 810
        InstantX := 460
        InstantY := 915
        ResetLvlX:= 390
        ResetLvlY:= 960
        ResetYesX := 300
        ResetYesY := 555
        ResetNoX := 490
        ResetNoY := 555
        ReplaceYesX := 830
        ReplaceYesY := 670
        ReplaceNoX := 1095
        ReplaceNoY := 670
        StorageorBackX := 960
        StorageorBackY := 955
        XX := 1585
        XY := 195
        ; search locations
        SearchMMX1 := 790
        SearchMMX2 := 1140
        SearchMMY1 := 520
        SearchMMY2 := 1080
        EssenceStorageX1 := 270
        EssenceStorageX2 := 710
        EssenceStorageY1 := 125
        EssenceStorageY2 := 250
        DisconnectedX1 := 745
        DisconnectedX2 := 1165
        DisconnectedY1 := 380
        DisconnectedY2 := 695
        LevelsX1 := 5
        LevelsX2 := 150
        LevelsY1 := 820
        LevelsY2 := 1020
        RollEssenceX1 := 170
        RollEssenceX2 := 730
        RollEssenceY1 := 550
        RollEssenceY2 := 930
        ReplaceEssenceX1 := 585
        ReplaceEssenceX2 := 1335
        ReplaceEssenceY1 := 330
        ReplaceEssenceY2 := 760
    }
    else {
        tooltip, Your monitor size is not supported by this macro`nExiting
        sleep, 5000
        ExitApp
    }
    return
}

;other stuff starts now
F1::
    mainLoop(0)
return

F2::
    tooltip, You hit F2 and now your lvl will be occassionally reset. You have 5 seconds to press F3 or F4, 1280, 720
    sleep, 5000
    tooltip
    sleep, 500
    mainLoop(1)
return

F3::
    ;creategui()
    tooltip, autoroll is disabled for testing and may not be released due to issues
    sleep, 3500
    tooltip,
return


F4::Run % """roblox://placeID=14112387344" (linkcode ? ("&linkCode=" linkcode) : "") """"

F5::Reload

F6::ExitApp

;; main loop Stuff
    mainLoop(resLvl) {
        rl := resLvl
        ;tooltip, rl: %rl%
        selectRoblox()
        checkRoblox()
        clickMainSkip()
        if(rl!=1) {
            if(checkMenu()==1)
                resetChar()
            else
                clickX()
        }
        loop {
            checkRoblox()
            if(checkMenu()==0) {
                clickX()
                if(rl==1) {
                    resetLvl(0)
                }
                respawn()
            }
            if(rl==1) {
                ;checkLvl(5)==0 || checkLvl(6)==0 || checkLvl(7)==0 || checkLvl(8)==0 || 
                if(checkLvl(9)==0 || checkLvl(10)==0) {
                    resetChar()
                    resetLvl(0)
                    respawn()
                }
                else {
                    loop, 10 {
                        useAbilities()
                    }
                }
            }
            else {
                loop, 50 {
                    useAbilities()
                }
            }
            
        }
        return
    }

;; gambling central!
    gambling() {
        selectRoblox()
        if(CheckEssence==1) {
            tooltip, you already have that essence
            mousemove, %ScreenMidX%, %ScreenTopY%
            Reload
        }
        loop {
            
            clickSummonBoth()
            if(checkEssence()==1) {
                mousemove, %ScreenMidX%, %ScreenTopY%
                Reload
            }
        }
        return
    }

;; menu-nav stuff (clicks)

    ; starting-menu
    clickMainPlay() {
        click, %MainPlayX%, %MainPlayY%
        sleep, 2500
        return
    }

    clickMainSkip() {
        click, %MainSkipX%, %MainSkipY%
        sleep, 5000
        clickMainPlay()
        return
    }

    ; play
    clickPlay() {
        click, %PlayX%, %PlayY%
        sleep, 750
        return
    }

    ; summon
    clickSummonBoth() {
        click, %SummonBothX%, %SummonBothY%
        sleep, 750
        return
    }

    /*
    clickSwitch() {
        click, %SwitchX%, %SwitchY%
        sleep, 750
        return
    }

    clickInstant() {
        click, %InstantX%, %InstantY%
        sleep, 750
        return
    }
    */

    clickResetLvl() {
        click, %ResetLvlX%, %ResetLvlY%
        sleep, 750
        return
    }

    clickResetYes() {
        click, %ResetYesX%, %ResetYesY%
        sleep, 1500
        return
    }

    /*
    clickResetNo() {
        click, %ResetNoX%, %ResetNoY%
        sleep, 750
        return
    }
    */
    
    clickReplaceYes() {
        click, %ReplaceYesX%, %ReplaceYesY%
        sleep, 750
        return
    }
    
    clickReplaceNo() {
        click, %ReplaceNoX%, %ReplaceNoY%
        sleep, 750
        return
    }

    ; storage
    clickStorageorBack() {
        click, %StorageorBackX%, %StorageorBackY%
        sleep, 750
        return
    }

    clickX() {
        click, %XX%, %XY%
        sleep, 750
        return
    }    

;; reseting/rejoining stuff

    resetChar() {
        send, {esc}
        sleep, 100
        send, r
        sleep, 100
        send {enter}
        sleep, 7500
        return
    }

    exitSpawn() {
        send {Ctrl}
        send {Space down}
        send {w down}
        send {d down}
        sleep, 10000
        send {Space up}
        send {w up}
        send {d up}
        sleep, 250
        return
    }

    openRoblox() {
        tooltip, opening roblox
        Run % """roblox://placeID=14112387344" (linkcode ? ("&linkCode=" linkcode) : "") """"
        loop {
            sleep, 1000
            ifwinexist, Roblox,, Roblox Account Manager
            {
                clickMainSkip()
                if(checkMenu()==0) {
                    break
                }
            }
        }
        selectRoblox()
        clickMainSkip()
        return
    }

    selectRoblox() {
        ifwinexist, Roblox,, Roblox Account Manager
            winactivate, Roblox,, Roblox Account Manager
        sleep, 750
        click, %ScreenMidX%, %ScreenTopY%
        sleep, 1500
        return
    }

    closeRoblox() {
        loop, 5 {
            ifwinexist, Roblox,, Roblox Account Manager
            {
                tooltip, closing roblox
                winclose, Roblox,,, Roblox Account Manager
                sleep, 500
            }
        }
        sleep, 15000
        return
    }

    respawn() {
        clickPlay()
        exitSpawn()
        return
    }

    resetLvl(check) {
        if(check==1) {
            loop, 2 {
                if(checkMenu()==0) {
                    clickX()
                    break
                }
                else
                    resetChar()
            }
        }
        clickSummonBoth()
        clickResetLvl()
        clickResetYes()
        return
    }

;; ability stuff

    useAbilities() {
        send, e
        send, r
        send, f
        send, 2
        send, e
        send, r
        send, f
        send, 1
        return
    }

;; checking stuff
    checkRoblox() {
        ifwinexist, Roblox,, Roblox Account Manager
        {
            imagesearch,,, %DisconnectedX1%, %DisconnectedY1%, %DisconnectedX2%, %DisconnectedY2%,*10 %A_ScriptDir%%route%\Disconnected.png
            if(ErrorLevel==0) {
                tooltip, found
                closeRoblox()
                openRoblox()
            }
        }
        ifwinnotexist, Roblox,, Roblox Account Manager
        {
            openRoblox()
        }
        return
    }

    checkLvl(level) {
        imagesearch,,, %LevelsX1%, %LevelsY1%, %LevelsX2%, %LevelsY2%,*20 %A_ScriptDir%%route%\Levels\%level%.png
        return ErrorLevel
    }
    
    checkMenu() {
        loop, 2 {
            clickStorageorBack()
        }
        sleep, 750
        imagesearch,,, %EssenceStorageX1%, %EssenceStorageY1%, %EssenceStorageX2%, %EssenceStorageY2%, %A_ScriptDir%%route%\EssenceStorage.png
        return ErrorLevel
    }

    checkEssence() {
        found := 0
        imagesearch,,, %ReplaceEssenceX1%, %ReplaceEssenceY1%, %ReplaceEssenceX2%, %ReplaceEssenceY2%,*25 %A_ScriptDir%%route%\Essences\YSY.png
        if(ErrorLevel==0)
            clickReplaceYes()
        loop {
            tooltip, you are in the loop
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*25 %A_ScriptDir%%route%\Essences\SwitchEss.png
            if(ErrorLevel==0)
                break
            else
                sleep, 50
        }
        tooltip, you are checking for elements now
        if(searchingFor==1) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Destruction.png
            if(ErrorLevel==0)
                found := 1
                return 1
        }
        else if(searchingFor==2) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Arcane.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==3) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Aether.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==4) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Frost.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==5) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Light.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==6) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Darkness.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==7) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Energy.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==8) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Lightning.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==9) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Poisonous.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==10) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Water.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==11) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Winds.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==12) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Earth.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else if(searchingFor==13) {
            imagesearch,,, %RollEssenceX1%, %RollEssenceY1%, %RollEssenceX2%, %RollEssenceY2%,*10 %A_ScriptDir%%route%\Essences\Flames.png
            if(ErrorLevel==0)
                found := 2
                return 1
        }
        else
            return 0
    }

    /*
    CheckMainMenu() {
        ;tooltip, maincheck %route%
        ;sleep, 1000
        imagesearch,,, %SearchMMX1%, %SearchMMY1%, %SearchMMX2%, %SearchMMY2%,*15 %A_ScriptDir%%route%\SkipMM.png
        if(ErrorLevel==0) {
            tooltip, mainskip
            sleep, 1000
            clickMainSkip()
            return true
        }
        else {
            imagesearch,,, %SearchMMX1%, %SearchMMY1%, %SearchMMX2%, %SearchMMY2%,*15 %A_ScriptDir%%route%\PlayMM.png
            if(ErrorLevel==0) {
                tooltip, mainplay
                sleep, 1000
                clickMainPlay()
                return true
            }
        }
        return
    }
    */