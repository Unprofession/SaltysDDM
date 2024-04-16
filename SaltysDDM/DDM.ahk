#Persistent
#SingleInstance, force
;; Hey look at you! You're reading the file before running it like you should! There shouldnt be anything malicious, keep looking though.
;; btw this is by Salty, ASaltyAccount, asaltyacc, idrc what I'm called but I'm taking credit :D
;; feel free to edit this to do whatever else you want, I may add OCR later to be able to read numbers instead of just reseting at set levels (currently planned to be 50)
;; first making 2560x1440 then 1920x1080 then idk. They will (PROBABLY) be seperate files since I'm not making a bajillion variables.
;; wont be adding multi-acc functionality (alting isnt allowed, get over it or add it urself)


;; really simple gui stuff to select the lvl, maybe even just a msgbox tbh
;; do this later also make it take the var selLvl (select Level)

F1::
    resLvl = false
    mainLoop()
return

F2::
    resLvl = true
    tooltip, "you hit F2 and now your lvl will be reset at 50. you have 5 seconds to stop this.", 1280, 720
    sleep, 5000
    tooltip
    mainLoop()
return

F3::Reload

F4::ExitApp

;; main loop Stuff

    mainLoop() {
        rt = 0
        checkRoblox()
        selectRoblox()
        loop {
            rt++
            checkRoblox()
            if(checkMenu()==0) {
                clickX()
                respawn()
                rt = 0
            }
            if(rt==100) {
                resetChar()
                if(resLvl==true) {
                    resetLvl()
                    respawn()
                }
                respawn()
            }
            loop, 100 {
                useAbilities()
            }
            /*
            if(resLvl==true)
                checkLvl()
            */
        }
        return
    }

;; menu-nav stuff (clicks)

    ; starting-menu
    clickMainPlay() {
        click, 1280, 750
        sleep, 250
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
        sleep, 250
        return
    }

    ; summon
    clickSummonBoth() {
        click, 1285, 1200
        sleep, 250
        return
    }

    /*
    clickSwitch() {
        click, 535, 1070
        sleep, 250
        return
    }

    clickInstant() {
        click, 625, 1210
        sleep, 250
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
        sleep, 250
        return
    }

    /*
    clickResetNo() {
        click, 660, 710
        sleep, 250
        return
    }
    */

    ; storage
    clickStorageorBack() {
        click, 1285, 1265
        sleep, 250
        return
    }

    clickX() {
        click, 2120, 225
        sleep, 250
        return
    }    

;; reseting/rejoining stuff

    resetChar() {
        send, {esc}
        sleep, 100
        send, r
        sleep, 100
        send {enter}
        sleep, 5000
        return
    }

    exitSpawn() {
        send, {ctrl}
        send, {space Down}
        send, {w Down}
        send, {d Down}
        sleep, 10000
        send, {space Up}
        send, {w Up}
        send, {d Up}
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
        sleep, 250
        click, 1280, 720
        sleep, 250
        return
    }

    closeRoblox() {
        loop, 2 {
            ifwinexist, Roblox,, Roblox Account Manager
                winclose, Roblox,,, Roblox Account Manager
            sleep, 250
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
        if(checkMenu()==0)
            clickX()
        else
            resetChar()
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
        imagesearch,,, 925, 175, 1640, 280, %A_ScriptDir%\Images\EssenceStorage.png
        return ErrorLevel
    }