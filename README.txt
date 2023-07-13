nvim

This is my current (and constantly in-progress) configuration that I use on a
daily basis.

---

Requirements:
	- Neovim 0.9 (https://github.com/neovim/neovim)
		- although I build from source because I like to live 
	  	  dangerously
	- Packer.nvim (https://github.com/wbthomason/packer.nvim)

Make sure you have `packer` installed somewhere that is accessible to your
user (and your neovim configuration)

Run `PackerSync` to get the latest versions of the plugins (at some point
there will be some documentation about all of them).

There might be a few errors thrown by Tree Sitter, I've not been able to find
the source of those yet. If you just exit and run the command again, it should
complete without errors.


---

Current startup times (tested with Hyperfine):

  Benchmark 1: nvim --headless +qa
    Time (mean ± σ):      46.9 ms ±   8.3 ms    [User: 28.5 ms, System: 16.6 ms]
    Range (min … max):    35.8 ms …  60.1 ms    78 runs
 
