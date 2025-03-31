#!/bin/sh

# Get the focused window's ID
focused_window=$(xdotool getwindowfocus)

# Get the PID of the focused terminal window (st)
terminal_pid=$(xdotool getwindowpid "$focused_window")

# Try to find the shell running inside st
shell_pid=$(pgrep -P "$terminal_pid" | head -n 1)

# If no shell is found, fall back to terminal_pid (less reliable)
if [ -z "$shell_pid" ]; then
    shell_pid="$terminal_pid"
fi

# Get the working directory of the shell process
if [ -d "/proc/$shell_pid/cwd" ]; then
    working_directory=$(readlink -f "/proc/$shell_pid/cwd")
else
    working_directory=$HOME
fi

# Launch st in the detected directory
(cd "$working_directory" && st)
