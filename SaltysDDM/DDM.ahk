;; Hey look at you! You're reading the file before running it like you should! There shouldnt be anything malicious, keep looking though.
;; btw this is by Salty, ASaltyAccount, asaltyacc, idrc what I'm called but I'm taking credit :D
;; feel free to edit this to do whatever else you want, I may add OCR later to be able to read numbers instead of just reseting at set levels (currently planned to be 50)
;; first making 2560x1440 then 1920x1080 then idk. They will be seperate files since I'm not making a bajillion variables.
;; wont be adding multi-acc functionality (alting isnt allowed, get over it or add it urself)


F1:: {
    mainLoop(false)
    return
}

F2:: {
    tooltip, "you hit F2 and now your lvl will be reset at 50. you have 5 seconds to stop this.", 1280, 720
    sleep, 5000
    tooltip
    mainLoop(true)
    return
}

F3:: {
    Reload
    return
}

F4:: {
    ExitApp
    return
}

;; main loop Stuff

    mainloop(resLvl) {
        loop {
            if(resLvl==true) {

            }
        }
        return
    }

;; menu-nav stuff (clicks)
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

    clickResetLvl() {
        click, 515, 1280
        sleep, 250
        return
    }

    clickResetYes() {
        click, 420, 710
        sleep, 250
        return
    }

    clickResetNo() {
        click, 660, 710
        sleep, 250
        return
    }

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

;; reset level stuff

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

    respawn() {
        clickPlay()
        exitSpawn()
        return
    }

    resetLvl() {
        checkMenu()
        clickSummonBoth()
        clickReset()
        clickResetYes()
        return
    }

;; attack loop stuff

atkLoop() {
    click
    return
}

;; checking stuff

checkRejoin() {
    click
    return
}

checkLevel() {
    click
    return
}

checkMenu() {
    loop, 2 {
        clickStorageorBack()
    }
    imagesearch,,, 925, 175, 1640, 280, %A_ScriptDir%\Images\EssenceStorage.png
    return
}

;; rejoin stuff