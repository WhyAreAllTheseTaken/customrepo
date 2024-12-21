#!/usr/bin/bash

mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.why
if test -f /etc/lightdm/lightdm-gtk-greeter.conf.old; then
    mv /etc/lightdm/lightdm-gtk-greeter.conf.old /etc/lightdm/lightdm-gtk-greeter.conf
fi

