#!/bin/bash

# تحديث النظام
sudo apt update && sudo apt upgrade -y

# تثبيت Java 17
sudo apt install openjdk-17-jdk -y

# إنشاء مجلد للسيرفر
mkdir -p ~/minecraft/server
cd ~/minecraft/server

# تحميل أحدث إصدار من PaperMC (1.21)
LATEST_BUILD=$(curl -s https://api.papermc.io/v2/projects/paper/versions/1.21 | grep latest | cut -d '"' -f4)
curl -o paper.jar https://api.papermc.io/v2/projects/paper/versions/1.21/builds/$LATEST_BUILD/downloads/paper-1.21-$LATEST_BUILD.jar

# الموافقة على EULA
echo "eula=true" > eula.txt

# تشغيل السيرفر باستخدام screen
sudo apt install screen -y
screen -dmS minecraft java -Xms4G -Xmx16G -jar paper.jar nogui

echo "✅ تم تشغيل السيرفر داخل شاشة screen باسم 'minecraft'."
echo "🧠 للدخول على السيرفر: screen -r minecraft"
