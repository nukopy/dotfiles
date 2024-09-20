# 環境変数の設定
$env.DOTDIR = $env.HOME + "/Projects/dotfiles"

# ヘッダーの表示関数
def print_header [] {
  echo "\e[34m"
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
  echo "\e[0m\n"
}

# macOSのシステム情報を表示する関数
def print_macos_system_info [] {
  let hostname = (sys | get host.hostname)

  echo "========== System Info =========="
  echo $"Hostname: (hostname)"

  # ハードウェア情報の表示
  let cpu_brand_string = (sys | get cpu.0.brand)
  let cores = (sys | get cpu | length)
  let mem_size = (sys | get mem.total)
  let disk_kind = (sys | get disks.0.kind)
  let disk_size = (sys | get disks.0.total)

  echo "Hardware:"
  echo "  CPU:"
  echo $"    Brand: ($cpu_brand_string)"
  echo $"    Cores: ($cores)"
  echo $"  RAM: ($mem_size)"
  echo "  Disk:"
  echo $"    Kind: ($disk_kind)"
  echo $"    Size: ($disk_size)"

  # OS情報の表示
  let os_version = (sys | get host.long_os_version)
  let kernel_name = (sys | get host.name)
  let kernel_version = (sys | get host.kernel_version)

  echo "OS:"
  echo $"  Version: ($os_version)"
  echo $"  Kernel: ($kernel_name) ($kernel_version)"
  echo ""
}

# macOS用のシンボリックリンクを作成する関数
def make_symlinks_macos [] {
  echo "========== Make symlinks =========="
  echo "Creating symlinks to home directory..."
  echo $"HOME: ($env.HOME)"
  echo $"DOTDIR: ($env.DOTDIR)"

  # シンボリックリンクの作成
  ^ln -sf $env.HOME/Projects/dotfiles/gitconfig/.gitconfig $env.HOME/.gitconfig
  ^ln -sf $env.HOME/Projects/dotfiles/gitconfig/.gitignore_global $env.HOME/.gitignore_global
  ^ln -sf $env.HOME/Projects/dotfiles/.zshenv.home $env.HOME/.zshenv
  ^ln -sf $env.HOME/Projects/dotfiles/latex/.latexmkrc $env.HOME/.latexmkrc
  ^ln -sf $env.HOME/Projects/dotfiles/karabiner $env.HOME/.config/karabiner
  ^ln -sf $env.HOME/Projects/dotfiles/direnv/.direnvrc $env.HOME/.direnvrc
  ^ln -sf $env.HOME/Projects/dotfiles/alacritty/alacritty.yml $env.HOME/.config/alacritty/alacritty.yml
  ^ln -sf $env.HOME/Projects/dotfiles/starship/starship.toml $env.HOME/.config/starship.toml
  ^ln -sf $env.HOME/Projects/dotfiles/spacemacs/.spacemacs $env.HOME/.spacemacs
  ^ln -sf $env.HOME/Projects/dotfiles/homebrew/Brewfile $env.HOME/.Brewfile
  # nushell config
  ^ln -sf $env.HOME/Projects/dotfiles/nushell/env.nu $env.HOME/Library/Application\ Support/nushell/env.nu
  ^ln -sf $env.HOME/Projects/dotfiles/nushell/config.nu $env.HOME/Library/Application\ Support/nushell/config.nu
  default $env.HOME/Library/Application\ Support/nushell/env.nu
  default $env.HOME/Library/Application\ Support/nushell/config.nu

  if (uname) == 'Darwin' {
    echo "Creating symlinks for Xcode settings..."
    # Xcode設定のバックアップとシンボリックリンクの作成
    # backup
    ^cp $env.HOME/Library/Developer/Xcode/UserData/IDETemplateMacros.plist $env.HOME/Library/Developer/Xcode/UserData/IDETemplateMacros.plist.bk; rm -rf $env.HOME/Library/Developer/Xcode/UserData/IDETemplateMacros.plist
    ^cp -r $env.HOME/Library/Developer/Xcode/UserData/KeyBindings $env.HOME/Library/Developer/Xcode/UserData/KeyBindings.bk; rm -rf $env.HOME/Library/Developer/Xcode/UserData/KeyBindings

    # create symlink
    ^ln -sf $env.HOME/Projects/dotfiles/xcode/UserData/IDETemplateMacros.plist $env.HOME/Library/Developer/Xcode/UserData/IDETemplateMacros.plist
    ^ln -sf $env.HOME/Projects/dotfiles/xcode/UserData/IDETextMacros.plist $env.HOME/Library/Developer/Xcode/UserData/IDETextMacros.plist
    ^ln -sf $env.HOME/Projects/dotfiles/xcode/UserData/KeyBindings $env.HOME/Library/Developer/Xcode/UserData/KeyBindings
  }
  echo "Done!"
  echo ""
  echo 'Please restart your shell, "exec $SHELL -l".'
}

# エントリーポイント
def main [] {
  print_header
  if (uname) == 'Darwin' {
    print_macos_system_info
    make_symlinks_macos
  } else {
    echo "Sorry, this script is intended only for macOS"
  }
}

# エントリーポイントの実行
main
