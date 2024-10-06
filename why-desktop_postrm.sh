#!/usr/bin/bash

dpkg-divert --package why-desktop --remove --rename --divert /etc/lightdm/lightdm-gtk-greeter.conf.old /etc/lightdm/lightdm-gtk-greeter.conf

