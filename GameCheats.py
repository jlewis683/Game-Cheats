import ctypes
import os
import pyautogui
import pynput
import pyperclip
import pythoncom
import pywinctl
import random
import time
import uiautomation
import win32api
import win32con

from PyCommon.Common import *
from PyGameCheats.HS_Common import *

from PyGameCheats.HS_Fishing import *

pyautogui.PAUSE = 0.1

#	Jacobstyle
#	Piggy314
#	Littleman
#	Agranthane
#	Emptymaterialism 


def on_press(key):
    pythoncom.CoInitialize()
    try:
        match key:
            case pynput.keyboard.Key.f13:
                HS_Orient()
            case pynput.keyboard.Key.f19:
                pyautogui.typewrite("pyautogui.click(" + pyperclip.paste() + ")\n")
            case pynput.keyboard.Key.f20:
                x, y = pyautogui.position()
                pyperclip.copy(str(x) + ", " + str(y))
            case pynput.keyboard.Key.f21:
                print("test")
            case pynput.keyboard.Key.f22:
                #test button
                #HS_Middlefern_Fishing()
                #myDict = {"a": "b"}
                #print(len(myDict))
                if WaitForLoad(1621, 515, 0x0c1014, 5):
                    print("WaitForLoad() has succeeded")
                else:
                    print("WaitForLoad() has failed")
            case pynput.keyboard.Key.f23:
                # exit program
                # save script if open and active
                if ".py - Notepad++" in pywinctl.getActiveWindowTitle():
                    pyautogui.hotkey("ctrl", "s")
                WinActivate("Command Prompt - ")
                return False
            case pynput.keyboard.Key.f24:
                pyautogui.click()
    except AttributeError:
        pass



def main():
    print("script running")
    with pynput.keyboard.Listener(on_press = on_press) as listener:
        listener.join()

if __name__ == "__main__":
    main()
