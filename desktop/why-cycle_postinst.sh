#!/usr/bin/bash

systemctl daemon-reload
systemctl --global start why-cycle.service

systemctl --global enable why-cycle.timer
systemctl --global start why-cycle.timer

