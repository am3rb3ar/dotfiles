#!/usr/bin/env bash
#
# attach-toggle-terminal.sh

zellij attach special-terminal || zellij --session special-terminal options --pane-frames false --show-startup-tips false
