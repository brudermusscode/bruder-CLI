# File containing logging options which can be included and then
# used around other sh files. This should keep everything straight forward.

log_info() {
  echo "$1 $2"
}

log_success() {
  echo "✅ $1"
}

log_error() {
  echo "💥 $1"
}