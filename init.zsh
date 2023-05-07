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

######################################################################
#<
#
# Function: p6df::modules::huggingface::langs()
#
#>
######################################################################
p6df::modules::huggingface::langs() {

  pip install huggingface-hub
  npm install -g huggingface-hub

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::huggingface::clones()
#
#  Environment:	 P6_DFZ_SRC_FOCUSED_DIR
#>
######################################################################
p6df::modules::huggingface::clones() {

  p6_github_login_clone "huggingface" "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}

# https://huggingface.co/docs/huggingface_hub/index
# https://github.com/huggingface/huggingface_hub
# https://github.com/huggingface/huggingface.js
# https://huggingface.co/learn/nlp-course/chapter1/1
# https://github.com/aws/sagemaker-huggingface-inference-toolkit
# https://github.com/nateraw/spaces-template
