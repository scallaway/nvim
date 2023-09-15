nvim

This is my current (and constantly in-progress) configuration that I use on a
daily basis.

---

Requirements:
	- Neovim 0.9 (https://github.com/neovim/neovim)
		- although I build from source because I like to live 
	  	  dangerously

---

Current startup times (tested with Hyperfine):

  ❯ hyperfine "nvim --headless +qa"

    Benchmark 1: nvim --headless +qa
      Time (mean ± σ):      37.1 ms ±   1.1 ms    [User: 28.6 ms, System: 8.3 ms]
      Range (min … max):    34.9 ms …  40.9 ms    81 runs

There's more work to be done here in terms of startup time, but that involves a
lot of "lazy" configuration and, to be honest, 37ms of startup is really not
that bad.
