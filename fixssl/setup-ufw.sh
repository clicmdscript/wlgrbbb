#!/bin/bash

apt-get install -y ufw

ufw default deny incoming
ufw default allow outgoing

ufw allow 22/tcp
ufw allow 443/tcp
ufw allow 80/tcp
ufw allow 7443

ufw --force enable

ufw status verbose
