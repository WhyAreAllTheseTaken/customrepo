#!/usr/bin/bash

systemctl daemon-reload
systemctl start why-cycle.service

systemctl enable why-cycle.timer
systemctl start why-cycle.timer

