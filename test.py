import pyautogui
import time
import os
import subprocess

# Get ENVs
width = os.environ.get('WIDTH')
height = os.environ.get('HEIGHT')
url = os.environ.get('URL')

# Start Firefox with the environment variables passed as arguments
subprocess.Popen(['firefox', '--no-sandbox', f'--width={width}', f'--height={height}'])

# Wait for Firefox to start, then make it fullscreen
time.sleep(2)
pyautogui.press('f11')
time.sleep(1)


# Type the URL and press Enter
pyautogui.hotkey('ctrl', 'l')
pyautogui.typewrite(f'{url}\n', interval=0.1)

# Wait for the page to load
time.sleep(15)

# Take a screenshot
screenshot = pyautogui.screenshot()

# Save the screenshot
screenshot.save("/output/screenshot.png")

print("Screenshot taken and saved as screenshot.png")
