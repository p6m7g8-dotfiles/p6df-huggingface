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
    p6m7g8-dotfiles/p6df-jupyter
    p6m7g8-dotfiles/p6huggingface
  )
}

######################################################################
#<
#
# Function: p6df::modules::huggingface::vscodes()
#
#>
######################################################################
p6df::modules::huggingface::vscodes() {

  p6df::modules::vscode::extension::install HuggingFace.huggingface-vscode

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::huggingface::external::brews()
#
#>
######################################################################
p6df::modules::huggingface::external::brews() {

  # m1/arm
  p6df::core::homebrew::cli::brew::install cmake
  p6df::core::homebrew::cli::brew::install pkg-config

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::huggingface::aliases::init()
#
#>
######################################################################
p6df::modules::huggingface::aliases::init() {

  p6_alias "p6_hft" "pytest -p no:warnings -n auto --dist=loadfile ./tests/"
  p6_alias "hft" "p6_hft"

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

  # TODO: convert to uv
  # pip install tensorflow
  # pip install pytorch
  # pip install transformers
  # pip install 'transformers[torch]'
  # pip install 'transformers[flax]'

  # pip install huggingface-hub

  python -c "from transformers import pipeline; print(pipeline('sentiment-analysis')('we love you'))"

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

  p6_github_cli_parallel_clone "huggingface" "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::huggingface::prompt::mod()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6df::modules::huggingface::prompt::mod() {

# PYTORCH_TRANSFORMERS_CACHE
# PYTORCH_PRETRAINED_BERT_CACHE
# TRANSFORMERS_CACHE
# HF_DATASETS_OFFLINE=1
# https://huggingface.co/docs/huggingface_hub/package_reference/environment_variables

  local str=""

  p6_return_str "$str"
}


######################################################################
#<
#
# Function: p6df::modules::huggingface::mcp()
#
#>
######################################################################
p6df::modules::huggingface::mcp() {

  p6df::core::homebrew::cli::brew::install hf-mcp-server

  p6df::modules::anthropic::mcp::server::add "huggingface" "hf-mcp-server"
  p6df::modules::openai::mcp::server::add "huggingface" "hf-mcp-server"

  p6_return_void
}
