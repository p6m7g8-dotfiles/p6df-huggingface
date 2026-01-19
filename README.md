# P6's POSIX.2: p6df-huggingface

## Table of Contents

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

## Contributing

- [How to Contribute](<https://github.com//.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com//.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

- hft IS p6_hft
- p6_hft IS pytest -p no:warnings -n auto --dist=loadfile ./tests/ $@

### Functions

## p6df-huggingface

### p6df-huggingface/init.zsh

- p6_hf_file_upload(path_or_fileobj, path_in_repo, repo_id)
- p6_hf_hub_download(repo_id, filename, revision, cache_dir)
- p6_hf_repo_create(repo_id)
- p6df::modules::huggingface::aliases::init()
- p6df::modules::huggingface::clones()
- p6df::modules::huggingface::deps()
- p6df::modules::huggingface::external::brews()
- p6df::modules::huggingface::langs()
- p6df::modules::huggingface::vscodes()
- str = p6df::modules::huggingface::prompt::mod()

## Hierarchy

```text
.
├── init.zsh
└── README.md

1 directory, 2 files
```

## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
