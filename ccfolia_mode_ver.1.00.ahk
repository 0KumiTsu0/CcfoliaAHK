SendMode("Input")
SetWorkingDir(A_ScriptDir)

; ===============================
; NumLock状態通知
; ===============================
global NumLockPrev := GetKeyState("NumLock", "T")
SetTimer(CheckNumLock, 100)

CheckNumLock() {
    global NumLockPrev
    NumLockCurr := GetKeyState("NumLock", "T")
    if (NumLockCurr != NumLockPrev) {
        NumLockPrev := NumLockCurr
        if (!NumLockCurr) {
            ShowNotification("ココフォリアモードに切り替えました")
        } else {
            ShowNotification("数字入力モードに切り替えました")
        }
    }
}

; ===============================
; 2秒だけ表示する通知関数（操作を止めない）
; ===============================
ShowNotification(text) {
    ToolTip(text)
    Sleep(2000)
    ToolTip()
}

; ===============================
; NumLock OFF のときのみテンキーリマップ
; ===============================
#HotIf !GetKeyState("NumLock", "T")  ; NumLock OFF

; -------------------------------
; Numpadキー割り当て
; -------------------------------

; Numpad1
sc04F:: Send("^z") 

; Numpad2
sc050:: Send("^y")

; Numpad3
sc051:: Send("^v")

; Numpad4 - Shift押しながらR
sc04B:: {
    Send("{Shift down}")
    Sleep(100)
    Send("R")
    Send("{Shift up}")
}

; Numpad5
sc04C:: Send("e")

; Numpad6
sc04D:: Send("r")

; Numpad7
sc047:: Send("s")

; Numpad8
sc048:: Send("l")

; Numpad9
sc049:: Send("w")

; Numpad0
sc052:: Send("o")

; NumpadAdd - Ctrl押しながらD
sc04E:: {
    Send("{Ctrl down}")
    Sleep(100)
    Send("d")
    Send("{Ctrl up}")
}

; NumpadSub - Ctrl押しながらBackspace
sc04A:: {
    Send("{Ctrl down}")
    Sleep(100)
    Send("{Backspace}")
    Send("{Ctrl up}")
}

; NumpadEnter
sc05C:: Send("e")

#HotIf