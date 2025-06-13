## Installation
The flytty script is posix compliant. Install it with
```
git clone https://github.com/olekawaii/flytty.git
cd flytty
# flytty.sh is the executable
```

## Usage
Run it with `./flytty.sh a b` where a is a file
in the colors/ directory and b is a file in the templates/ directory.

Example:
```
./flytty.sh colors/rose_pine_moon templates/freebsd_tty.conf.template
```

## Colorschemes
Here is the flexoki theme file. All colorschemes are made up of 9 colors: 
```
100f0f -- dark black / background
d14d41 -- red
879a39 -- green
d0a215 -- yellow
4385be -- blue
ce5d97 -- magenta
3aa99f -- cyan
cecdc3 -- white / text / cursor
878580 -- bright black / dim text
```

## Templates
Templates reference these colors through `!X` where `X` is the index of the
color in the theme (starting from 0).

You can get the name of the theme with `!name`

The templates should also add comments of how to use the theme

Terminal themes should set dark black to the 0th color instead of 8

# Why
These themes are easy to parse and work with

The standard terminal colorscheme uses at least 16 colors. These are used to 
define different brightness versions of red-cyan and the greys used for 
fg/cursor/bg/dimfg/brightfg/etc. However, in a terminal setting you only need 9 
colors to have a fully functional theme, as is the case in the tty. 

Having multiple grey colours is meaningless because there's no consensus on
what the differences between them are. 
- Is white brighter than text? 
- Is bright black brighter than dim text? 
- Is black the same as the background? 
Who knows, but I do know how all the colors would look in the tty.

The red-cyan colors in this format are also missing a bright/dark variant.
This is for several reasons:
- It looks better with fewer colors
- most popular themes only have one variant of their colors
- People love to ruin good themes trying to have dark and bright variants:
  - The Solarized theme doesn't have dark/light variants of its colors. How 
    would you defive the dark/bright colors for it? The author hod a genious 
    idea: use the 6 red-cyan colors for the dark variant, orange for bright 
    red, violot for bright magenta, and different shades of grey for the rest.
  - The flexoki theme has lighter colors for dark theme and darker colors for 
    light theme. However, if you look through its dark themed terminal ports, 
    you see people using the dark colors as the base colors and bright colors 
    for the bright colors, making normal dark colors (inteded for the light 
    theme) barely visible against the background.
