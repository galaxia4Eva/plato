---
status: WIP
languages:
            - swift
            - julia
            - more..?
topics:
            - TUI
            - Literate Programming
---
# Plato, a TUI for literate programming notebooks
Take it easy, be socratic.
## Roadmap

[julia]💖[swift]💖[TUI]

[swift]💖[julia]💖[Literate Programming]

[kitty]💖[fish]

## How to build
1. checkout julia repo to your machine
```sh
git clone git@github.com:JuliaLang/julia.git <julia-dir>
```
2. build julia in `./lib/julia/src/` directory of this repo
```sh !pwd:$(git rev-parse --show-toplevel)
cd ./lib/julia/src
JULIAROOT=<julia-dir> make
cd $(git rev-parse --show-toplevel)
```
3. build swift package
```sh !pwd:$(git rev-parse --show-toplevel)
swift build
```
4. run plato with logging
```sh !pwd:$(git rev-parse --show-toplevel)
JULIA_DEBUG=loading,Main .build/debug/plato
```

[julia]:                        https://julialang.org
[swift]:                        https://www.swift.org
[TUI]:                          https://github.com/rensbreur/SwiftTUI
[Literate Programming]:         https://github.com/fonsp/Pluto.jl
[kitty]:                        https://github.com/kovidgoyal/kitty
[fish]:                         https://github.com/fish-shell/fish-shell
