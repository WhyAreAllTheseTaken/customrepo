#!/usr/bin/bash

dpkg-divert ---package why-desktop --add --rename --divert /etc/lightdm/lightdm-gtk-greeter.conf.old /etc/lightdm/lightdm-gtk-greeter
