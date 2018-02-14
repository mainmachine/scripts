#!/bin/sh

distro="$(lsb_release -d | awk '{print $2,$3,$4,$5,$6,$7,$8}')"
kernel="$(uname -r)"
cinvers="$(cinnamon --version | awk '{print $2}')"
gpu="$(sudo lshw -c display | awk -F: '/product/{print $2}')"
gpualt="$(lspci -nn | grep -i vga)"
glxnfo="$(DISPLAY=:0 glxinfo | awk '/OpenGL vendor string/{print $4}')"
screensleep="$(dconf read /org/cinnamon/settings-daemon/plugins/power/sleep-display-ac)"

if [ "$screensleep" = 0 ]; then
  sleepstate="disabled"
else
  sleepstate="enabled"
fi

echo "distro: ${distro}"
echo ""
echo "kernel: ${kernel}"
echo ""
echo "cinnamon version: ${cinvers}"
echo ""
echo "gpu: ${gpu}"
echo "  ...or..."
echo "gpu alternate string: ${gpualt}"
echo ""
echo "OpenGL vendor: ${glxnfo}"
echo ""
echo "screen blanking: ${sleepstate}"
echo ""

