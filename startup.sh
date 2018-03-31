#!bin/bash

export DISPLAY=:0
sleep 15

unclutter -idle 0 & #hide mouse

#Start chromium into campaign url
campaign_url="http://jupiter.signage.me/WebService/SignagePlayerApp.html?eri=f7bee07a7e79c8f1d7951b4d24de4713c22f16&playerParams=14789f72800b050f9ab8a92fedd219788cccdf44"
chromium-browser --kiosk --incognito "$campaign_url" &