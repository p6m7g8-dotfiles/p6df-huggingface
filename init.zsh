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
  
  code --install-extension HuggingFace.huggingface-vscode

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::huggingface::brews()
#
#>
######################################################################
p6df::modules::huggingface::brews() {

  # m1/arm
  brew install cmake
  brew install pkg-config
}

######################################################################
#<
#
# Function: p6df::modules::huggingface::aliases::init()
#
#>
######################################################################
p6df::modules::huggingface::aliases::init() {
 
  alias p6_hft="pytest -p no:warnings -n auto --dist=loadfile ./tests/ $@"

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

  pip install tensorflow
  pip install pytorch
  pip install transformers
  pip install 'transformers[torch]'
  pip install 'transformers[flax]'

  pip install huggingface-hub
 
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

  p6_github_login_clone "huggingface" "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}

_p6_user=
_p6_org=
######################################################################
#<
#
# Function: str str = p6df::modules::huggingface::prompt::line()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6df::modules::huggingface::prompt::line() {
  
  if p6_string_blank "$_p6_user"; then
    local user=$(huggingface-cli whoami | head -1)
    local org=$(huggingface-cli whoami | awk -F: '/:/{print $2}')
    _p6_user=$user
    _p6_org=$org
  fi

  local str=""
  if ! p6_string_blank "$_p6_user"; then
    str="huggingface:\t$_p6_org/$_p6_user"
  fi

  p6_return_str "$str"
}
# PYTORCH_TRANSFORMERS_CACHE 
# PYTORCH_PRETRAINED_BERT_CACHE
# TRANSFORMERS_CACHE
# HF_DATASETS_OFFLINE=1
# https://huggingface.co/docs/huggingface_hub/package_reference/environment_variables

######################################################################
#<
#
# Function: p6_hf_hub_download(repo_id, filename, revision, cache_dir)
#
#  Args:
#	repo_id -
#	filename -
#	revision -
#	cache_dir -
#
#>
######################################################################
p6_hf_hub_download() {
    local repo_id="$1"
    local filename="$2"
    local revision="$3"
    local cache_dir="$4"

    if [ -z "$revision" ] && [ -z "$cache_dir" ]; then
        python -c "from huggingface_hub import hf_hub_download; hf_hub_download(repo_id=\"$repo_id\", filename=\"$filename\")"
    elif [ -z "$cache_dir" ]; then
        python -c "from huggingface_hub import hf_hub_download; hf_hub_download(repo_id=\"$repo_id\", filename=\"$filename\", revision=\"$revision\")"
    else
        python -c "from huggingface_hub import hf_hub_download; hf_hub_download(repo_id=\"$repo_id\", filename=\"$filename\", revision=\"$revision\", cache_dir=\"$cache_dir\")"
    fi
}

######################################################################
#<
#
# Function: p6_hf_repo_create(repo_id)
#
#  Args:
#	repo_id -
#
#>
######################################################################
p6_hf_repo_create() {
    local repo_id="$1"

    python -c "from huggingface_hub import create_repo; create_repo(repo_id=\"$repo_id\")"
}

######################################################################
#<
#
# Function: p6_hf_file_upload(path_or_fileobj, path_in_repo, repo_id)
#
#  Args:
#	path_or_fileobj -
#	path_in_repo -
#	repo_id -
#
#>
######################################################################
p6_hf_file_upload() {
    local path_or_fileobj="$1"
    local path_in_repo="$2"
    local repo_id="$3"

    python -c "from huggingface_hub import upload_file; upload_file(path_or_fileobj=\"$path_or_fileobj\", path_in_repo=\"$path_in_repo\", repo_id=\"$repo_id\")"
}

