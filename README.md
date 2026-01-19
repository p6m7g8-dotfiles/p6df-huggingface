# P6's POSIX.2: p6df-huggingface

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Aliases](#aliases)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

- `hft` -> `p6_hft`
- `p6_hft` -> `pytest -p no:warnings -n auto --dist=loadfile ./tests/`

### Functions

#### p6df-huggingface

##### p6df-huggingface/init.zsh

- `p6_hf_file_upload(path_or_fileobj, path_in_repo, repo_id)`
- `p6_hf_hub_download(repo_id, filename, revision, cache_dir)`
- `p6_hf_repo_create(repo_id)`
- `p6df::modules::huggingface::aliases::init()`
- `p6df::modules::huggingface::clones()`
- `p6df::modules::huggingface::deps()`
- `p6df::modules::huggingface::external::brews()`
- `p6df::modules::huggingface::langs()`
- `p6df::modules::huggingface::vscodes()`
- `str str = p6df::modules::huggingface::prompt::mod()`

## Hierarchy

```text
.
├── init.zsh
└── README.md

1 directory, 2 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
