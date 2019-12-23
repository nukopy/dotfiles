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

check_os() {
  if [ "$(uname -s)" == "Darwin" ]; then
    if [ $(compare_versions "$(sw_vers -productVersion)" "10.9") == '<' ]; then
      echo "Sorry, this script is intended only for OS X 10.9.0+"
      exit 1
    fi
  else
    echo "Sorry, this script is intended only for OS X"
    exit 1
  fi
}
