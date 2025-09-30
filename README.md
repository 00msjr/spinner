<div align="center">

# Spinner

<img src="https://i.imgur.com/placeholder.png" width="128"/>

Elegant Terminal Spinners  
***For Your Command Line***

![Version](https://img.shields.io/badge/version-1.0.0-blue?style=for-the-badge) ![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)

[Installation](#installation) • [Examples](#example-usage) • [Configuration](#configuring)

![spinner_demo](https://github.com/placeholder/spinner-demo.gif)
</div>

## Installation

<details>
   <summary>Manual Installation</summary>

```sh
# Clone the repository
git clone https://github.com/yourusername/spinner
cd spinner

# Make the script executable
chmod +x spinner.sh

# Copy both required files to a directory in your PATH
sudo cp spinner.sh /usr/local/bin/spinner
sudo cp icons.sh /usr/local/bin/icons.sh
```
</details>

<details>
   <summary>Quick Install</summary>

```sh
# Download both required files
curl -o /usr/local/bin/spinner https://raw.githubusercontent.com/yourusername/spinner/main/spinner.sh
curl -o /usr/local/bin/icons.sh https://raw.githubusercontent.com/yourusername/spinner/main/icons.sh
chmod +x /usr/local/bin/spinner
```
</details>

## How it works

Spinner is a pure bash terminal loading animation tool that uses bash arrays for spinner configurations and displays them with various options for speed, color, and messaging. No external dependencies required beyond standard Unix utilities.

<details>
<summary>Advanced explanation</summary>

---

| Spinner Configurations |
|------------------------|

Spinners are defined in `icons.sh` as bash arrays with frame-based animations. Each spinner has:
- A unique name identifier
- An array of animation frames stored as `SPINNER_name`
- Configurable display intervals

| Customization Options |
|-----------------------|

The script supports multiple ways to customize the spinner experience:

**Speed Control**: Set animation speed from 0 (slow) to 2 (fast), with automatic interval calculation

**Color Options**: Choose from 8 terminal colors (black, red, green, yellow, blue, magenta, cyan, white)

**Message Display**: Add custom loading messages that appear alongside the spinner

**Duration Control**: Run spinners for a fixed time period or indefinitely

| Pipe Integration |
|------------------|

The spinner automatically detects when used in a pipeline:

```sh
./long-running-script.sh | spinner -s dots -m "Processing..."
```

The spinner will run until the piped command completes, providing visual feedback for any command-line operation.

---
</details>

## Example Usage

```sh
#------------------------#
#  Basic spinner usage   #
#------------------------#

spinner                                    # Run default spinner indefinitely
spinner -s dots                           # Use dots spinner
spinner -s aesthetic -c green             # Green aesthetic spinner
spinner -l                                # List all available spinners

#--------------------------#
#  Spinners with messages  #
#--------------------------#

spinner -m "Loading files..."             # Show message with spinner
spinner -s dots -c cyan -m "Installing packages..."
spinner -s aesthetic -c magenta -m "Building project..."

#--------------------#
#  Duration control  #
#--------------------#

spinner -d 5                              # Run for 5 seconds
spinner -s dots -d 10 -m "Waiting..."     # 10 second timer with message

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

npm install | spinner -s dots -m "Installing dependencies..."
./build.sh | spinner -s aesthetic -c blue -m "Building..."
docker-compose up | spinner -m "Starting containers..."

#--------------------------#
#  What I use it for       #
#--------------------------#

git clone large-repo | spinner -m "Cloning repository..."
tar -xzf archive.tar.gz | spinner -s dots -c green -m "Extracting..."
curl -O large-file.zip | spinner -s aesthetic -m "Downloading..."
```

## Dependencies

<details>
<summary><strong>Required (Built-in)</strong></summary>

---
- **bash** (version 4.0+) - for array support
- **awk** - for interval calculations
- **tput** - for terminal cursor control
- **sleep** - for timing control

All of these are standard Unix utilities available by default on virtually all systems.

**No external dependencies needed!** No jq, no Python, no Node.js - just pure bash.
---
</details>

<details>
<summary><strong>icons.sh file</strong></summary>

---
The script requires `icons.sh` in the same directory (or in your PATH). This file contains all spinner definitions as bash arrays:

```bash
declare -a SPINNER_dots=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
declare -a SPINNER_aesthetic=('▰▱▱▱▱▱▱' '▰▰▱▱▱▱▱' '▰▰▰▱▱▱▱' '▰▰▰▰▱▱▱' '▰▰▰▰▰▱▱' '▰▰▰▰▰▰▱' '▰▰▰▰▰▰▰' '▰▱▱▱▱▱▱')
# ... and many more
```

This file is included in the repository and automatically sourced by `spinner.sh`.
---
</details>

## Configuring

<details>
<summary><strong>Command-line Flags</strong></summary>

---
Main configuration flags:

- `-s, --spinner NAME` - Select spinner from icons.sh (default: aesthetic)
- `-i, --interval N` - Set speed 0=slow, 1=default, 2=fast (default: 1)
- `-c, --color COLOR` - Set spinner color (red, green, yellow, blue, magenta, cyan, white)
- `-d, --duration SECONDS` - Run for fixed duration then exit
- `-m, --message TEXT` - Display message alongside spinner
- `-l, --list` - List all available spinners
- `-h, --help` - Show help message

Run `spinner --help` for complete documentation.

---
</details>

<details>
<summary><strong>Creating Custom Spinners</strong></summary>

---
Add your own spinners to `icons.sh`:

```bash
declare -a SPINNER_myspinner=('frame1' 'frame2' 'frame3')
```

Then use it: `spinner -s myspinner`

The spinner will automatically be available in the list and ready to use.

---
</details>

## Available Spinners

Over 80 different spinner styles including:
- `aesthetic`, `dots`, `dots2-14`, `line`, `arrow`, `circle`, `moon`
- `bouncingBall`, `bouncingBar`, `weather`, `clock`, `earth`
- `hearts`, `smiley`, `monkey`, `runner`, `shark`
- `material`, `toggle`, `flip`, `pulse`, `mindblown`
- And many more! Use `spinner -l` to see them all with previews.

## Roadmap

- [ ] Support for gradient colors

## License

MIT License
