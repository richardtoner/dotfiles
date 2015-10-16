# Richard Toner's Dot Files

This repository contains all of the dot files required for my personal terminal configuration.

There are a lot of useful aliases in the main profile along with some mighty Git commands and extensions.

## Installation

Installation of the dot files can be handled either with Boxen or manually.

### Boxen

Add the following code to your personal manifest:

    repository { "/Users/${::boxen_user}/.dotfiles":
      source => 'richardtoner/dotfiles'
    }

    file { "/Users/${::boxen_user}/.profile":
      ensure  => link,
      mode    => '0644',
      target  => "/Users/${::boxen_user}/.dotfiles/.profile",
      require => Repository["/Users/${::boxen_user}/.dotfiles"],
    }

When you run `boxen` the dot files will be installed. You will need to close your terminal and reopen it for the changes to take effect.

### Manual Installation

Using your terminal, do the following:

1. Clone the repository into a .dotfiles directory in your home directory: `git clone https://github.com/richardtoner/dotfiles.git ~/.dotfiles`
2. Create a symlink to the `.profile` file in the repository: `ln -s ~/.dotfiles/.profile ~/.profile`

## Optionals

Some other optional dot files are also documented:

### Atom

Add the following to your Boxen personal manifest:

    file { "/Users/${::boxen_user}/.atom/config.cson":
      ensure  => link,
      mode    => '0644',
      target  => "/Users/${::boxen_user}/.dotfiles/.atom/config.cson",
      require => Repository["/Users/${::boxen_user}/.dotfiles"],
    }

Or, install manually by doing the following:

1. Remove any existing Atom config file: `rm -f ~/.atom/config.cson`
2. Create a symlink to the `.atom/config.cson` file in the repository: `ln -s ~/.dotfiles/.atom/config.cson ~/.atom/config.cson`
