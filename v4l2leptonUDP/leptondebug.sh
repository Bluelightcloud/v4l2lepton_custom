#!/bin/bash

sudo modprobe v4l2loopback
cd /home/pi/Downloads/LeptonModule-master/software/v4l2lepton
./v4l2lepton -v /dev/video2 -d /dev/spidev0.0 & gst-launch-1.0 -v v4l2src device=/dev/video0 ! videoscale ! video/x-raw,width=320,height=240 ! videoconvert ! x264enc ! rtph264pay ! udpsink host=192.168.3.12 port=5005


