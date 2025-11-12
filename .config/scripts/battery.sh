#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
charging=$(cat /sys/class/power_supply/BAT0/status)

if [ "$charging" == "Charging" ]; then
  echo "󰂄 $capacity%"
elif (("$capacity" >= 95)); then
  echo "󰁹 $capacity%"
elif (("$capacity" >= 90)); then
  echo "󰂂 $capacity%"
elif (("$capacity" >= 80)); then
  echo "󰂁 $capacity%"
elif (("$capacity" >= 70)); then
  echo "󰂀 $capacity%"
elif (("$capacity" >= 60)); then
  echo "󰁿 $capacity%"
elif (("$capacity" >= 50)); then
  echo "󰁾 $capacity%"
elif (("$capacity" >= 40)); then
  echo "󰁽 $capacity%"
elif (("$capacity" >= 20)); then
  echo "󰁼 $capacity%"
elif (("$capacity" >= 10)); then
  echo "󰁻 $capacity%"
elif (("$capacity" >= 0)); then
  echo "󰁺 $capacity%"
else
  echo "BatteryModuleNotWorking"
fi

