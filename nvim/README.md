# Init neovim 0.5.0

## Install some stuff before usage

### Package manager
New package manager: Packer:
https://github.com/wbthomason/packer.nvim
```
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Disable old buffer
Disable any old vim script init file by renaming the old `init.vim` to
`init.vim~`

### To make lua lsp work
Make sure that you install the languenage server. I did it manually, 'casue I
didn't know any better.

https://github.com/sumneko/lua-language-server

Follow the build instructions:
https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)

Make sure that the path to lua-language-server is correct inside `init.lua`. Right now it is
```lua
local sumneko_binary = '/home/anton/usefull-repos/lua-language-server/bin/Linux/lua-language-server'
local sumneko_root_path = '/home/anton/usefull-repos/lua-language-server/'
```

## After first start
Run

```vim
:PackerInstall
```

