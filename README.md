# Dotfiles

First things first, install [Xcode](https://developer.apple.com/xcode/) and open it. Also if you're not me, please do not install dotfiles verbatim from this repo.

## Inital Setup
Setting up a new machine should be easy:

```
sh setup.sh
```

This installs [Homebrew](http://brew.sh/) & [Cask](http://caskroom.io/) and executes a bunch of `brew install` commands to go and setup iTerm2, Vundle, a collection of awesome utility apps, MongoDB, Node.js (this is my preferred method of installing Node it normally prevents you from having to run `sudo` all the time).


## Config
Then run the config:

```
sh config.sh
```

The config script sets up Vim and copies all my preferences for Vim, OhMyZSH, Hammerspoon, and puts them in their proper places. Plus exports [Solarized](http://ethanschoonover.com/solarized) color palettes from Github and drops the ones for iTerm2 in `~/Downloads/`.

## Projects
Copy down all my projects from Github:

```
sh repo.sh
```

This uses the great [`hub`](https://hub.github.com/) command line utility to install all my current public projects on Github.

## Contributing

First off, you're awesome for wanting to contribute. Second, please take a second to go over a few things to make this process simpler for everyone. Third, you're awesome.

### Pull Requests
- [Fork](https://github.com/charlespeters/thunder#fork-destination-box) this repo.
- Push to your fork and submit a pull request.
- Please provide a short explanation of why you made the changes you made.

## License
MIT

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
