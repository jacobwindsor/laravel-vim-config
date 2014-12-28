# Vim Configuration

##Installation
* Run `sudo apt-get install vim`
+ Clone this repo into the `~/.vim` directory
* Run `vim`
* In vim run `:PluginInstall` and wait for packages to install.

### Font installation
Fonts must be installed on the target machine and if using an SSH client must also be installed on the host.
Fonts are from [powerline/fonts](https://github.com/powerline/fonts).

####Target Machine

* In the home directory run `git clone https://github.com/powerline/fonts.git`
* Now `cd fonts`
* Run `./install.sh`
* `fc-cache -vf ~/.fonts/`

####Host Machine
* [Click here](https://github.com/powerline/fonts/archive/master.zip) to download the fonts.
* In the downloaded directory follow your PC instructions to install *Sauce Code Powerline Regulat.otf*.
* In your SSH client select that as the font.
