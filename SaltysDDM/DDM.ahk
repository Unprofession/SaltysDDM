;; Hey look at you! You're reading the file before running it like you should! There shouldnt be anything malicious, keep looking though.
#Persistent
#SingleInstance, force
CoordMode, Tooltip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
getMon()
;setting vars global
    ; reset level option
    global rl
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

Return

;; important stuff (monitor size and variables stuff)
getMon() {
    SysGet, mon, monitor
    if(monRight==2560)
        setVars(1)
    else if(monRight==1920)
        setVars(2)
    else
        setVars(3)
}

setVars(selected) {
    if(selected==1) {
        ; imagepath
        route := "2560x1440p"
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
        DisconnectedX1 := 1060
        DisconnectedX2 := 1490
        DisconnectedY1 := 565
        DisconnectedY2 := 850
        LevelsX1 := 5
        LevelsX2 := 225
        LevelsY1 := 1155
        LevelsY2 := 1385
    }

    else if(selected==2) {
        ; imagepath
        route := "1920x1080p"
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
    }
    else {
        tooltip, looks like you selected other`nThat means I dont support that monitor size`nThis will now be closed out of
        sleep, 5000
        ExitApp
    }
    tooltip, selected %route%
    sleep, 1500
    tooltip
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

F3::Reload

F4::ExitApp

F5::Run % """roblox://placeID=14112387344" (linkcode ? ("&linkCode=" linkcode) : "") """"

;; main loop Stuff
    mainLoop(resLvl) {
        rl := resLvl
        ;tooltip, rl: %rl%
        checkRoblox()
        selectRoblox()
        clickMainSkip()
        clickMainPlay()
        if(rl==1)
            resetLvl()
        else {
            
            if(checkMenu()==1)
                resetChar()
            else
                clickX()
        }
        loop {
            if(checkMenu()==0) {
                clickX()
                respawn()
            }
            if(rl==1) {
                if(checkLvl(5)==0 || checkLvl(6)==0 || checkLvl(7)==0 || checkLvl(8)==0 || checkLvl(9)==0 || checkLvl(10)==0) {
                    resetChar()
                    resetLvl()
                    respawn()
                }
                else {
                    loop, 10 {
                        useAbilities()
                    }
                }
            }
            else {
                loop, 100 {
                    useAbilities()
                }
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
        Run % """roblox://placeID=14112387344" (linkcode ? ("&linkCode=" linkcode) : "") """"
        loop {
            sleep, 1000
            ifwinexist, Roblox,, Roblox Account Manager
            {
                clickMainPlay()
                if(checkMenu()==0) {
                    break
                }
            }
        }
        selectRoblox()
        clickMainSkip()
        clickMainPlay()
        return
    }

    selectRoblox() {
        ifwinexist, Roblox,, Roblox Account Manager
            winactivate, Roblox,, Roblox Account Manager
        sleep, 750
        click, %ScreenMidX%, %ScreenTopY%
        sleep, 750
        return
    }

    closeRoblox() {
        loop, 2 {
            ifwinexist, Roblox,, Roblox Account Manager
            {
                winclose, Roblox,,, Roblox Account Manager
            }
            sleep, 750
        }
        sleep, 15000
        return
    }

    respawn() {
        clickPlay()
        exitSpawn()
        return
    }

    resetLvl() {
        loop, 2 {
            if(checkMenu()==0)
                clickX()
            else
                resetChar()
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
            imagesearch,,, 1190, 560, 1365, 615,*10 %A_ScriptDir%\Images\%route%\Disconnected.png
            if(ErrorLevel==0) {
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
        imagesearch,,, %LevelsX1%, %LevelsY1%, %LevelsX2%, %LevelsY2%,*20 %A_ScriptDir%\Images\%route%\Levels\%level%.png
        return ErrorLevel
    }
    
    checkMenu() {
        loop, 2 {
            clickStorageorBack()
        }
        sleep, 750
        imagesearch,,, %EssenceStorageX1%, %EssenceStorageY1%, %EssenceStorageX2%, %EssenceStorageY2%, %A_ScriptDir%\Images\%route%\EssenceStorage.png
        return ErrorLevel
    }

    CheckMainMenu() {
        ;tooltip, maincheck %route%
        ;sleep, 1000
        /*
        imagesearch,,, %SearchMMX1%, %SearchMMY1%, %SearchMMX2%, %SearchMMY2%,*15 %A_ScriptDir%\Images\%route%\SkipMM.png
        if(ErrorLevel==0) {
            tooltip, mainskip
            sleep, 1000
            clickMainSkip()
            return true
        }
        else {
            imagesearch,,, %SearchMMX1%, %SearchMMY1%, %SearchMMX2%, %SearchMMY2%,*15 %A_ScriptDir%\Images\%route%\PlayMM.png
            if(ErrorLevel==0) {
                tooltip, mainplay
                sleep, 1000
                clickMainPlay()
                return true
            }
        }
        */
        return
    }