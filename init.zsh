# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::huggingface::deps()
#
#>
######################################################################
p6df::modules::huggingface::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::huggingface::init()
#
#>
######################################################################
p6df::modules::huggingface::init() {

  p6_return_void
}
