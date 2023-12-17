# RapidRummage: Stupidly Simple, Stupidly Fast File Searching

RapidRummage is a shell script that uses macOS's Spotlight search utility to
deliver fast and efficient file searching that then excludes what we don't want
with grep. Yes, lol, stupid fast.

## Key Features

- 🔍 Utilizes macOS's Spotlight.
- 🚀 Quick; reach for a sip of coffee and it'll already be done. Compared to the
  find/grep equivalent where you've finished your coffee, cleaned the cat litter
  and forgotten that you were working.
- 🍏 For macOS users.

## Installation

To install RapidRummage, clone this repository and run the `install.sh` script.
Assuming `~/.local/bin` is in your PATH, this sets up the command `rummage`:

```bash
git clone https://github.com/webel/rapidrummage.git
cd rapidrummage
./install.sh
```

## Usage

Just type rummage followed by your search query:

```bash
rummage <search_term> [working_dir] [excluded_dirs]
```

- search_term: What you're looking for.
- working_dir: (Optional) Where to look. Defaults to the current directory.
- excluded_dirs: (Optional) Directories you'd rather not see the output from.

## Example

```bash
rummage somestring ~/dev/ "env venv repositories node_modules build dist .env .venv .git"
```
