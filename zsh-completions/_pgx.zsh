#compdef pgx

function _pgx {
  local curcontext="$curcontext" state line
  typeset -A opt_args

  _arguments \
    '1: :->cmd'\
    '2: :->subcmd'

  case $state in
    cmd)
      compadd -Q "$@" staging production infra
      ;;
    subcmd)
      case $words[2] in
        staging)
          _arguments '2:databases:($(_staging))'
          ;;
        production)
          _arguments '2:databases:($(_production))'
          ;;
        infra)
          _arguments '2:databases:($(_infra))'
          ;;
      esac
  esac
}

_pgx $@


_staging() {
  ls ~/git/k8s-secrets/staging/*.enc.yaml | cut -d/ -f7 | cut -d. -f1
}

_production() {
  ls ~/git/k8s-secrets/production/*.enc.yaml | cut -d/ -f7 | cut -d. -f1
}

_infra() {
  ls ~/git/k8s-secrets/infra/*.enc.yaml | cut -d/ -f7 | cut -d. -f1
}
