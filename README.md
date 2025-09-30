<div align="center">

# Spinner

***A simple, configurable, multi-platform terminal spinner.***

[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![GitHub version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/00msjr/spinner)
[![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux-orange.svg)]()
[![Built With](https://img.shields.io/badge/Built%20With-Bash-404040.svg)](https://www.gnu.org/software/bash/)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/00msjr/spinner/issues)

[Installation](#installation) • [Examples](#example-usage) • [Configuration](#configuring)

![spinner\_demo](https://github.com/00msjr/spinner/demo.gif)

</div>

## About

**Spinner** is a powerful yet tiny tool that provides elegant, animated loading feedback for your command-line operations. Built entirely in **Pure Bash** with zero external dependencies (it only uses standard utilities like `tput` and `awk`), it’s fast, lightweight, and highly portable across Linux and macOS systems.

### Key Features

* **Single-File Simplicity:** The entire library is contained within `spinner.sh`.
* **Zero Dependencies:** Relies only on standard utilities (`bash`, `tput`, `awk`, `sleep`).
* **Customization:** Full control over spinner style, speed, color, and accompanying messages.
* **Pipe Integration:** Automatically runs until a piped command is complete.
* **Cross-Platform:** Works reliably on most modern Linux and macOS environments.

---

## Installation

Since the script is a single file, installation is quick and simple.

<details>
<summary>Quick Install</summary>

```sh
# 1. Download the script and name it 'spinner'
sudo curl -o /usr/local/bin/spinner https://raw.githubusercontent.com/00msjr/spinner/main/spinner.sh

# 2. Make it executable
sudo chmod +x /usr/local/bin/spinner
```

</details>

<details>
<summary>Manual Installation</summary>

```sh
# Clone the repository
git clone https://github.com/00msjr/spinner
cd spinner

# Make the script executable
chmod +x spinner.sh

# Copy the file to a directory in your PATH (e.g., /usr/local/bin)
sudo cp spinner.sh /usr/local/bin/spinner
```

</details>

### How it works

Spinner uses a bash array embedded within the script for frame-based animations. It leverages `tput civis` to hide the cursor, prints frames using `printf \r`, and restores the cursor with `tput cnorm` upon exit (including graceful handling of Ctrl+C).

<details>
<summary>Advanced explanation</summary>

#### Spinner Configurations

Spinners are defined internally as bash arrays with frame-based animations. Each spinner has:

* A unique name identifier (e.g., `aesthetic`)
* An array of animation frames stored as `SPINNER_name`
* Configurable display intervals

#### Customization Options

* **Speed Control:** Set animation speed from 0 (slow) to 2 (fast), with automatic interval calculation.
* **Color Options:** Choose from 8 standard terminal colors (black, red, green, yellow, blue, magenta, cyan, white).
* **Message Display:** Add custom loading messages that appear alongside the spinner.
* **Duration Control:** Run spinners for a fixed time period or indefinitely.

#### Pipe Integration

The spinner automatically detects when its standard input is being used in a pipeline:

```sh
./long-running-script.sh | spinner -s dots -m "Processing..."
```

The spinner will run in the background until the piped command completes, providing clear visual feedback.

</details>

## Example Usage

```sh
#------------------------#
#  Basic spinner usage   #
#------------------------#
spinner                                    # Run default spinner indefinitely
spinner -s dots5                           # Use dots5 spinner
spinner -s aesthetic -c green             # Green aesthetic spinner
spinner -l                                # List all available spinners

#--------------------------#
#  Spinners with messages  #
#--------------------------#
spinner -m "Loading files..."             # Show message with spinner
spinner -s dots6 -c cyan -m "Installing packages..."
spinner -s aesthetic -c magenta -m "Building project..."

#--------------------#
#  Duration control  #
#--------------------#
spinner -d 5                              # Run for 5 seconds
spinner -s dots7 -d 10 -m "Waiting..."    # 10 second timer with message

#---------------------#
#  Speed adjustments  #
#---------------------#
spinner -i 0                              # Slow spinner
spinner -i 1                              # Normal speed (default)
spinner -i 2                              # Fast spinner
spinner -s aesthetic -i 0.5 -c yellow     # Custom speed

#--------------------------#
#  Use with pipes          #
#--------------------------#
npm install | spinner -s dots7 -m "Installing dependencies..."
./build.sh | spinner -s aesthetic -c blue -m "Building..."
docker-compose up | spinner -m "Starting containers..."
```

## Configuring

<details>
<summary><strong>Command-line Flags</strong></summary>

Main configuration flags:

* `-s, --spinner NAME` - Select spinner from the list (default: aesthetic)
* `-i, --interval N` - Set speed 0=slow, 1=default, 2=fast (default: 1)
* `-c, --color COLOR` - Set spinner color (red, green, yellow, blue, magenta, cyan, white)
* `-d, --duration SECONDS` - Run for fixed duration then exit
* `-m, --message TEXT` - Display message alongside spinner
* `-l, --list` - List all available spinners
* `-h, --help` - Show help message

Run `spinner --help` for complete documentation.

</details>

<details>
<summary><strong>Creating Custom Spinners</strong></summary>

To create custom spinners, edit the `spinner.sh` file and add your array directly near the other `declare -a SPINNER_...` definitions:

```sh
declare -a SPINNER_myspinner=('frame1' 'frame2' 'frame3')
```

Then use it: `spinner -s myspinner`

The new spinner will automatically be available in the list and ready to use.

</details>

## Available Spinners

Over 80 different spinner styles (full list available in the script source). Use `spinner -l` to see them all with previews.

## License

MIT License
