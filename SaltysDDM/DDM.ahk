#Persistent
#SingleInstance, force
CoordMode, Tooltip, Screen
CoordMode, Pixel, Client
CoordMode, Mouse, Client
;; Hey look at you! You're reading the file before running it like you should! There shouldnt be anything malicious, keep looking though.
;; btw this is by Salty, ASaltyAccount, asaltyacc, idrc what I'm called but I'm taking credit :D
;; feel free to edit this to do whatever else you want, I may add OCR later to be able to read numbers instead of just reseting at set levels (currently planned to be 6, 12, or 20)
;; first making 2560x1440 then 1920x1080 then idk. They will (PROBABLY) be seperate files since I'm not making a bajillion variables.
;; wont be adding multi-acc functionality (alting isnt allowed, get over it or add it urself)

;; variable declaration hell function
rt := 0
rl := 0

;; really simple gui stuff to select the lvl, maybe even just a msgbox tbh
;; do this later also make it take the var selLvl (select Level)

F1::
    mainLoop(0)
return

F2::
    tooltip, You hit F2 and now your lvl will be occassionally reset. You have 5 seconds to press F3, 1280, 720
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
        rt := 0
        rl := resLvl
        ;tooltip, rl: %rl%
        checkRoblox()
        selectRoblox()
        if(checkMenu()==1)
            resetChar()
        loop {
            rt++
            ;tooltip, It's the final countdown! %rt%/5(Till u reset/reset ur lvl), 1280, 20
            checkRoblox()
            if(checkMenu()==0) {
                clickX()
                respawn()
            }
            tooltip, rl: %rl%
            if(rt>=5) {
                rt := 0
                if(rl==1) {
                    tooltip, entered the cool reset thingy
                    resetLvl()
                    respawn()
                }
                else
                    resetChar()
                respawn()
            }
            loop, 10 {
                useAbilities()
            }
            /*
            if(rl==true)
                checkLvl()
            */
        }
        return
    }

;; menu-nav stuff (clicks)

    ; starting-menu
    clickMainPlay() {
        click, 1280, 750
        sleep, 750
        return
    }

    clickSkip() {
        click, 1280, 1280
        sleep, 10000
        return
    }

    ; play
    clickPlay() {
        click, 1285, 1135
        sleep, 750
        return
    }

    ; summon
    clickSummonBoth() {
        click, 1285, 1200
        sleep, 750
        return
    }

    /*
    clickSwitch() {
        click, 535, 1070
        sleep, 750
        return
    }

    clickInstant() {
        click, 625, 1210
        sleep, 750
        return
    }
    */

    clickResetLvl() {
        click, 515, 1280
        sleep, 2500
        return
    }

    clickResetYes() {
        click, 420, 710
        sleep, 750
        return
    }

    /*
    clickResetNo() {
        click, 660, 710
        sleep, 750
        return
    }
    */

    ; storage
    clickStorageorBack() {
        click, 1285, 1265
        sleep, 750
        return
    }

    clickX() {
        click, 2120, 225
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
        sleep, 60000
        selectRoblox()
        clickSkip()
        clickMainPlay()
        return
    }

    selectRoblox() {
        ifwinexist, Roblox,, Roblox Account Manager
            winactivate, Roblox,, Roblox Account Manager
        sleep, 750
        click, 1280, 720
        sleep, 750
        return
    }

    closeRoblox() {
        loop, 2 {
            ifwinexist, Roblox,, Roblox Account Manager
                winclose, Roblox,,, Roblox Account Manager
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
            imagesearch,,, 1190, 560, 1365, 615, %A_ScriptDir%\Images\Disconnected.png
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

    /*
    checkLvl() {
        ;; do some ocr magic here later
        ;; not currently doing shitttt
        click
        return
    }
    */

    checkMenu() {
        loop, 2 {
            clickStorageorBack()
        }
        sleep, 750
        imagesearch,,, 400, 170, 950, 280, %A_ScriptDir%\Images\EssenceStorage.png
        return ErrorLevel
    }