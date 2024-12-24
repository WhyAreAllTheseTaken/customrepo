#!/usr/bin/bash

systemctl start why-cycle.service

systemctl enable why-cycle.timer
systemctl start why-cycle.timer

