#compdef pgx

function _pgx {
  local curcontext="$curcontext" state line
  typeset -A opt_args

  _arguments \
    '1: :->cmd'\
    '2: :->subcmd'

  case $state in
    cmd)
      compadd -Q "$@" staging production
      ;;
    subcmd)
      case $words[2] in
        staging)
          _arguments '2:databases:($(_staging))'
          ;;
        production)
          _arguments '2:databases:($(_production))'
          ;;
      esac
  esac
}

_pgx $@


_staging() {
  ls ~/git/k8s-secrets/staging/*.crypt | cut -d/ -f7 | cut -d. -f1
}

_production() {
  ls ~/git/k8s-secrets/production/*.crypt | cut -d/ -f7 | cut -d. -f1
}
