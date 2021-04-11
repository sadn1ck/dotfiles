#!/usr/bin/bash

display() {
  echo
  echo "=> $*"
}

display "cpu boost disable"
if [ "$EUID" -ne 0 ]; then
  display "Please run as root"
  exit 1
fi

echo 'echo 0 > /sys/devices/system/cpu/cpufreq/boost'
echo 0 >/sys/devices/system/cpu/cpufreq/boost

display "charge control"

echo 'echo 75 > /sys/class/power_supply/BAT0/charge_control_end_threshold'
echo 75 >/sys/class/power_supply/BAT0/charge_control_end_threshold

display "dGPU power saving"
status=$(optimus-manager --status | grep Current | cut -c20-30)

gpu="echo 'auto' > '/sys/bus/pci/devices/0000:01:00.0/power/control'"

if [ $status = "integrated" ]; then
  echo $gpu
  bash -c "$gpu"
else
  display "dGPU in use"
fi
