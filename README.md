# 🖥️ My Custom Terminal Configuration

This repository houses my personalized terminal setup, encompassing Zsh shell configurations, Kitty terminal emulator settings, Neofetch system information display customizations, and a bespoke Oh My Posh theme. The objective is to achieve a harmonious blend of aesthetics, functionality, and performance for an optimized terminal experience

---

## 🎯 Why Zsh?

[Zsh](https://www.zsh.org/) (Z shell) is a powerful and highly customizable Unix shell that offers advanced features such as:

- Command auto-completion
- Syntax highlighting
- History search
- Enhanced scripting capabilities

I chose Zsh for its flexibility and modern features, making it an excellent choice for developers and power users.

---

## 🚀 Journey to the Current Setup

### Initial Setup: Oh My Zsh

Initially, I used [Oh My Zsh](https://ohmyz.sh/), a popular open-source framework for managing Zsh configurations. Oh My Zsh provides a wide array of themes and plugins that enhance the terminal experience. Some key benefits of Oh My Zsh:

- Easy installation and management of plugins
- A large community with extensive resources
- Pre-configured themes for aesthetics and productivity

#### Why I Removed Oh My Zsh

While Oh My Zsh is great, I found it to be **too heavy** for my needs. Specifically:

1. **Slow Terminal Startup**: Oh My Zsh added noticeable delays to the terminal startup time.
2. **Redundant Features**: Many of its features were overkill for my use case, and I wanted a leaner setup.

---

### Extracting Essential Plugins

Before removing Oh My Zsh, I identified certain plugins that were invaluable for my workflow. For example:

- **`copyfile`**: A plugin for quickly copying file paths to the clipboard.
- **`copypath`**: A plugin for copying directory paths to the clipboard.

I manually copied these plugins into my custom plugins folder (`~/.zsh/plugins/`) and ensured they worked independently.

---

### Current Setup: Lean and Fast

After removing Oh My Zsh, I designed my `.zshrc` to include only the necessary plugins and features:

- Direct sourcing of plugins from a custom `~/.zsh/plugins/` directory
- Optimized aliases for frequently used commands
- Integration with tools like `fzf`, `neofetch`, and `oh-my-posh`

The result? **A terminal that is significantly faster without compromising on functionality.**

---

### 🛠️ Features

#### Plugins

1. **Syntax Highlighting**:

   - Provides real-time syntax highlighting for commands.
   - Plugin location: `~/.zsh/plugins/zsh-syntax-highlighting`
2. **Autosuggestions**:

   - Suggests commands as you type based on your history.
   - Plugin location: `~/.zsh/plugins/zsh-autosuggestions`
3. **Copy File and Path**:

   - `copyfile`: Copies file contents to the clipboard.
   - `copypath`: Copies paths to the clipboard.
4. **History Substring Search**:

   - Allows searching through command history using substrings.
   - Plugin location: `~/.zsh/plugins/zsh-history-substring-search`

#### Aliases

- `c`: Clears the terminal.
- `n`: Runs `neofetch` to display system information.
- `fzf`: A powerful fuzzy finder with a preview feature (`bat`).
- `python` → `python3` and `pip` → `pip3`.

## 🔧 Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/zsh-config.git
   cd zsh-config
   ```
2. Back up your existing `.zshrc`:

   ```bash
   mv ~/.zshrc ~/.zshrc.backup
   ```
3. Link the custom `.zshrc`:

   ```bash
   ln -s $(pwd)/.zshrc ~/.zshrc
   ```
4. (Optional) Customize the `ZDOTDIR` if you want to store the configuration in a custom directory:

   ```bash
   export ZDOTDIR=/path/to/this/repo
   ```
5. Restart Zsh or source the `.zshrc`:

   ```bash
   source ~/.zshrc
   ```

---

### ⚙️ Key Variables

#### Environment

- `HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND`: Customizes the highlight color for history substring matches.

## What is `.zprofile`?

The `.zprofile` file is executed during the **login** phase of a Zsh shell session. This makes it ideal for setting environment variables and configurations that need to be available globally, even when scripts or non-interactive shell sessions run.

In contrast to `.zshrc`, which is executed for **interactive** shells, `.zprofile` is best suited for login-specific setups.

#### How I Use `.zprofile`

In this configuration, `.zprofile` is used to set:

- **Environment Variables**: Global paths and variables that need to be consistent across sessions.
- **Initialization Commands**: Commands that should run only once when the shell starts as a login shell.
- **Custom `ZDOTDIR`**: Redirects Zsh to use a custom directory for its configuration files.

#### Example `.zprofile`:

```zsh
# Set ZDOTDIR to use a custom configuration directory
export ZDOTDIR="$HOME/.config/zsh"

# Add custom paths
export PATH="$HOME/bin:$PATH"

# Initialize environment variables for tools like Homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set default editor
export EDITOR="nvim"

# Load the .zshrc explicitly
source "$ZDOTDIR/.zshrc"
```

#### Why Use `.zprofile`?

1. **Environment Setup**: Variables like `PATH`, `EDITOR`, or `LANG` are set once and globally.
2. **Compatibility**: Ensures non-interactive or script sessions also have the necessary environment variables.
3. **Separation of Concerns**: Keeps login-related configurations distinct from interactive shell settings.

#### Why Separate `.zprofile` and `.zshrc`?

Keeping `.zprofile` and `.zshrc` separate allows for cleaner and more maintainable configurations:

- **`.zprofile`**: Global setup for login shells, environment variables, and system-wide commands.
- **`.zshrc`**: Interactive shell configurations, such as aliases, functions, and prompts.

This separation ensures that login-only settings do not clutter the interactive session configuration and vice versa.

## **Oh My Posh**

[Oh My Posh](https://ohmyposh.dev/) is a powerful and highly customizable prompt theme engine that works with various shells, including Zsh, Bash, and PowerShell. It enables you to create stunning and functional terminal prompts, incorporating useful information like Git status, system stats, virtual environments, and more.

#### Why I Chose Oh My Posh

- **Customizability**: Oh My Posh allows you to design a prompt that suits your workflow and aesthetic preferences.
- **Lightweight**: Unlike Oh My Zsh, which can slow down terminal performance, Oh My Posh is focused solely on prompt customization.
- **Cross-Shell Support**: The same theme can be used across different shells, ensuring consistency in appearance.

---

#### Features of My Oh My Posh Theme (`kushal.omp.json`)

1. **Transient Prompt**:

   - Displays a minimal secondary prompt after command execution.
   - Reduces clutter in the terminal.
   - My transient prompt is set to `\ue780`, a clean and modern arrow-like icon.
2. **Primary Prompt**:

   - Includes system and contextual information such as:
     - **OS Icon**: Dynamically shows the operating system (e.g., macOS, Linux).
     - **Git Status**: Displays branch name, changes, and sync status.
     - **Execution Time**: Highlights long-running commands with a stopwatch icon (`\uf252`).
     - **Python Virtual Environments**: Shows the active virtual environment.
   - Designed with distinct colors and symbols for each segment to improve readability.
3. **Visual Design**:

   - Powerline-style segments with vibrant colors and icons.
   - Uses `MesloLGS NF` font for compatibility with Nerd Fonts icons.
   - Custom icons for programming languages (e.g., Python, Go, Rust).

---

#### How to Install Oh My Posh

1. **Install Oh My Posh**:

   - **macOS**:
     ```bash
     brew install oh-my-posh
     ```
   - **Linux**:
     ```bash
     sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
     sudo chmod +x /usr/local/bin/oh-my-posh
     ```
   - **Windows**:
     Follow the [Windows installation guide](https://ohmyposh.dev/docs/installation/windows).
2. **Configure the Theme**:

   - Place the `kushal.omp.json` theme file in the Oh My Posh themes directory:
     ```bash
     mkdir -p ~/.poshthemes
     cp kushal.omp.json ~/.poshthemes/
     ```
3. **Set Up Zsh Integration**:
   Add the following line to your `.zshrc` file:

   ```zsh
   eval "$(oh-my-posh init zsh --config ~/.poshthemes/kushal.omp.json)"
   ```
4. **Reload the Shell**:

   ```bash
   source ~/.zshrc
   ```

---

#### Key Benefits of My Theme:

- **Visual Clarity**: Each segment is distinctly colored for easy identification.
- **Informative**: Includes Git status, Python environments, execution time, and more at a glance.
- **Minimalistic Transient Prompt**: Keeps the terminal clean and focused after commands.

#### Documentation:

- Official Documentation: [Oh My Posh Docs](https://ohmyposh.dev/docs/)
- Theme Customization Guide: [Custom Themes](https://ohmyposh.dev/docs/themes)

## **Kitty Terminal**

[Kitty](https://sw.kovidgoyal.net/kitty/) is a fast, feature-rich, GPU-accelerated terminal emulator that excels in speed, customization, and advanced features. Its design focuses on reducing latency and maximizing usability for developers and power users.

#### Why I Chose Kitty

- **GPU Acceleration**: Offloads rendering to the GPU, making it faster than most terminal emulators.
- **Advanced Features**: Supports multiple layouts, tabs, and split windows.
- **Customization**: Offers extensive theming and font configuration options.
- **Cross-Platform**: Available for macOS, Linux, and more.

---

#### Features of My `kitty.conf`

1. **Font Customizations**:

   - Font: `MesloLGS NF`, optimized for compatibility with Nerd Fonts icons.
   - Font size: `12.0`.
   - Adjusted cell height (`135%`) for better line spacing.
   - Enabled bold, italic, and bold-italic font styles for improved readability.
2. **Scrollback History**:

   - Increased scrollback buffer to `12,000` lines, allowing extensive history review.
3. **URL Handling**:

   - Highlighted URLs in `#0087bd` with a curly underline for easy identification.
   - Configured URLs to open with the default browser.
4. **Window Layouts and Margins**:

   - Predefined layouts: `Horizontal`, `Vertical`, `Grid`.
   - Zero window borders with `10px` padding for a cleaner look.
   - Placement strategy: `center`, ensuring a visually appealing terminal alignment.
5. **Keyboard Shortcuts**:

   - `Cmd+C`: Copy to clipboard.
   - `Cmd+V`: Paste from clipboard.
   - `Cmd+K`: Clear terminal up to the cursor.
   - `Cmd+M`: Minimize window (macOS).
6. **Additional Enhancements**:

   - Enabled `copy_on_select` for easier text copying.
   - Preserved window size across sessions with `remember_window_size`.

---

#### Installation

1. **Install Kitty**:

   - **macOS**:
     ```bash
     brew install --cask kitty
     ```
   - **Linux**:
     ```bash
     sudo apt install kitty
     ```
   - For other platforms, refer to the [official installation guide](https://sw.kovidgoyal.net/kitty/binary/).
2. **Configure Kitty**:

   - Create a configuration directory:
     ```bash
     mkdir -p ~/.config/kitty
     ```
   - Copy the `kitty.conf` file to the configuration directory:
     ```bash
     cp kitty.conf ~/.config/kitty/kitty.conf
     ```
3. **Reload Configuration**:

   - Apply changes without restarting Kitty by pressing:
     - `Ctrl+Shift+F5` (or `⌘+Shift+R` on macOS).
4. **Verify Configuration**:

   - Open Kitty and check if the font, scrollback, and layout customizations are applied.

---

#### Documentation and References

- [Kitty Official Documentation](https://sw.kovidgoyal.net/kitty/)
- [Kitty Configuration Guide](https://sw.kovidgoyal.net/kitty/conf/)
- [Key Bindings in Kitty](https://sw.kovidgoyal.net/kitty/keyboard-shortcuts/)

## **Neofetch**

[Neofetch](https://github.com/dylanaraps/neofetch) is a highly configurable system information tool written in Bash. It displays essential system details alongside a custom logo or ASCII art, making it an aesthetic and informative addition to your terminal.

---

#### Why I Chose Neofetch

- **Minimal Resource Usage**: Lightweight and fast, written purely in Bash.
- **Customizability**: Allows tweaking the displayed system information, formatting, and color schemes.
- **Aesthetic Appeal**: Provides a sleek overview of system stats combined with ASCII art or logos.
- **Motivational Start**: Seeing an attractive display of system details enhances the terminal experience.

---

#### Features of My `neofetch.conf`

1. **Custom Info Sections**:

   - Displayed in a structured and visually pleasing format with separators (`` icons).
   - Sections include:
     - **Distro**: Operating system details.
     - **Memory**: Usage in percentage and in GiB.
     - **Shell**: The currently active shell.
     - **Battery**: Current charge percentage and status.
     - **CPU**: Model, speed, core count, and temperature.
     - **Uptime**: Total system uptime in a shorthand format.
2. **Visual Enhancements**:

   - Enabled bold fonts and underlining for better readability.
   - Used color blocks and bars to represent system metrics like memory and disk usage.
   - Included a custom ASCII logo for macOS (`ascii_distro="macos_small"`).
3. **Progress Bars**:

   - Disk and memory usage bars:
     - `=` for total.
     - `-` for used portions.
   - Configured bar length (`15`) and dynamic coloring (`bar_color_elapsed="distro"`).
4. **ASCII Art and Color Blocks**:

   - Displayed alongside system info for visual appeal.
   - Color-coded sections with distinct hues for different metrics.
5. **Optimizations**:

   - Enabled only the most relevant details to keep the display clean.
   - Removed unnecessary information like `kernel_shorthand` and `os_arch` to reduce clutter.

---

#### Installation

1. **Install Neofetch**:

   - **macOS**:
     ```bash
     brew install neofetch
     ```
   - **Linux** (Ubuntu/Debian):
     ```bash
     sudo apt install neofetch
     ```
2. **Configure Neofetch**:

   - Create a configuration directory:
     ```bash
     mkdir -p ~/.config/neofetch
     ```
   - Copy the `neofetch.conf` file:
     ```bash
     cp neofetch.conf ~/.config/neofetch/config.conf
     ```
3. **Run Neofetch**:

   ```bash
   neofetch
   ```

---

#### Key Customization Options

- **`ascii_distro`**: Displays an ASCII logo based on the operating system. In my setup, it uses `macos_small` for a clean macOS logo.
- **`info` Sections**: Configured to display only essential system details in a visually organized format.
- **Progress Bars**: Added color and formatted to show elapsed vs. total usage in disk and memory metrics.
- **Colors**: Tweaked to align with the terminal’s overall aesthetic.

---

#### Documentation and References

- [Neofetch GitHub Repository](https://github.com/dylanaraps/neofetch)
- [Customization Guide](https://github.com/dylanaraps/neofetch/wiki/Customizing-Info)

---

#### Why Use Neofetch?

Neofetch provides a quick snapshot of your system's essential metrics, making it a great addition to your terminal setup. Combined with ASCII art and progress bars, it adds a professional and stylish touch to your terminal environment.
