#!/bin/bash

export DOTDIR=$HOME/Projects/dotfiles

print_header() {
  printf "\e[34m"
  echo '--------------------------------------------------------------------------------'
  echo '                                                                                '
  echo '                 888          888     .d888 d8b 888                             '
  echo '                 888          888    d88P"  Y8P 888                             '
  echo '                 888          888    888        888                             '
  echo '             .d88888  .d88b.  888888 888888 888 888  .d88b.  .d8888b            '
  echo '            d88" 888 d88""88b 888    888    888 888 d8P  Y8b 88K                '
  echo '            888  888 888  888 888    888    888 888 88888888 "Y8888b.           '
  echo '            Y88b 888 Y88..88P Y88b.  888    888 888 Y8b.          X88           '
  echo '             "Y88888  "Y88P"   "Y888 888    888 888  "Y8888   88888P"           '
  echo '                                                                                '
  echo '                        fast environmental construction                         '
  echo '                                                                                '
  echo '                          github.com/nukopy/dotfiles                            '
  echo '                                                                                '
  echo '--------------------------------------------------------------------------------'
  printf "\e[0m\n"
}

# ------------------------------
# macOS
# ------------------------------

print_macos_system_info() {
  echo "========== System Info =========="
  echo "Hostname: $(uname -n)"

  # print hardware info
  echo "Hardware:"
  echo "  CPU: $(sysctl -n machdep.cpu.brand_string)"
  echo "  RAM: $(sysctl -n hw.memsize | awk '{print $0/1024/1024/1024 " GB"}')"
  echo "  Disk: $(df -h / | awk 'NR==2 {print $2}')"

  # print OS info
  echo "OS:"
  echo "  Version: $(sw_vers -productName) $(sw_vers -productVersion) $(sw_vers -buildVersion)"
  echo "  Kernel: $(uname -v)"
  echo ""
}

make_symlinks_macos() {
  echo "========== Make symlinks =========="
  # create symlink to home directory
  echo "Creating symlinks to home directory..."
  echo "HOME: $HOME"
  echo "DOTDIR: $DOTDIR"

  set -ex
  ln -sf $HOME/Projects/dotfiles/gitconfig/.gitconfig ~/.gitconfig
  ln -sf $HOME/Projects/dotfiles/gitconfig/.gitignore_global ~/.gitignore_global
  ln -sf $HOME/Projects/dotfiles/.zshenv.home ~/.zshenv
  ln -sf $HOME/Projects/dotfiles/latex/.latexmkrc ~/.latexmkrc
  ln -sf $HOME/Projects/dotfiles/karabiner ~/.config/karabiner
  ln -sf $HOME/Projects/dotfiles/direnv/.direnvrc ~/.direnvrc
  ln -sf $HOME/Projects/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
  ln -sf $HOME/Projects/dotfiles/starship/starship.toml ~/.config/starship.toml
  ln -sf $HOME/Projects/dotfiles/spacemacs/.spacemacs ~/.spacemacs
  ln -sf $HOME/Projects/dotfiles/homebrew/Brewfile ~/.Brewfile
  set +ex

  # for Xcode
  if [[ "$(uname)" == 'Darwin' ]]; then
      echo "Creating symlinks for Xcode settings..."

      # backup
      set -ex
      cp ~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist ~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist.bk && rm -rf ~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist
      cp -r ~/Library/Developer/Xcode/UserData/KeyBindings ~/Library/Developer/Xcode/UserData/KeyBindings.bk && rm -rf ~/Library/Developer/Xcode/UserData/KeyBindings

      # create symlink
      ln -sf $HOME/Projects/dotfiles/xcode/UserData/IDETemplateMacros.plist ~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist
      ln -sf $HOME/Projects/dotfiles/xcode/UserData/IDETextMacros.plist ~/Library/Developer/Xcode/UserData/IDETextMacros.plist
      ln -sf $HOME/Projects/dotfiles/xcode/UserData/KeyBindings ~/Library/Developer/Xcode/UserData/KeyBindings
      set +ex
  fi
  echo "Done!"

  echo ""
  echo "Please restart your shell, \"exec \$SHELL -l\"."
}

# ------------------------------
# main
# ------------------------------

bootstrap() {
  if [[ "$(uname -s)" == "Darwin" ]]; then
    print_macos_system_info
    make_symlinks_macos
  else
    echo "Sorry, this script is intended only for macOS"
    exit 1
  fi
}

main() {
  print_header
  bootstrap
}

main
