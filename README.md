# Simple Bash-Based Web & Data Server

This is a Bash script that provides a minimalistic web server and a basic menu-driven interface for storing, sending, receiving, and clearing user data using TCP connections (via `nc` - Netcat). It can be useful for basic testing, learning networking concepts, or simple data handling tasks.

## Features

- **Web Server**: Serves the contents of `data.txt` over HTTP on port `8080`.
- **Data Entry**: Allows users to enter personal information (name, surname, email, password), which is stored in `data.txt`.
- **Send Data**: Send custom messages to a remote server via Netcat.
- **Receive Data**: Listen on a port and log incoming messages.
- **Clear Data**: Clears all data stored in `data.txt`.

## Requirements

- Unix-based system (Linux/macOS)
- `nc` (Netcat)
- Bash shell
