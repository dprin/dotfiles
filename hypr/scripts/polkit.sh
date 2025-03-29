#!/usr/bin/env sh

/nix/store/$(ls -la /nix/store | grep 'gnome_polkit' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-gnone-authentication-agent-1 & 

