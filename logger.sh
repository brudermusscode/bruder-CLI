# File containing logging options which can be included and then
# used around other sh files. This should keep everything straight forward.

TIME=$(date +"%d. %B %Y - %H:%M")

log_info() {
  echo "[$1] $2"
}

log_success() {
  echo "[✅] $1"
}

log_error() {
  echo "[💥] $1"
}

log_run() {
  "$@" > >(sed 's/^/ |»    /') 2> >(sed 's/^/ |»    /' >&2)
}

void_run() {
  "$@" > >(sed 's/^/ |»    /') 2> >(sed 's/^/ |»    /' >&2)
}