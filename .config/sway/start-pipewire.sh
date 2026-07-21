#!/bin/bash

# Устанавливаем переменную окружения
export XDG_RUNTIME_DIR=/run/user/$(id -u)

# Убиваем старые процессы (если есть)
pkill pipewire 
pkill wireplumber

# Удаляем старый сокет PulseAudio (если есть)
rm -rf /run/user/1000/pulse/ 2>/dev/null

# Ждём, пока освободятся ресурсы
sleep 1

# Запускаем PipeWire
pipewire &
sleep 2

# Запускаем эмуляцию PulseAudio
pipewire -c pipewire-pulse.conf &
sleep 2

# Запускаем WirePlumber
wireplumber &

# Лог для проверки
echo "$(date): PipeWire and WirePlumber started" >> /tmp/pipewire-start.log
