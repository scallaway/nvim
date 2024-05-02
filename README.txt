nvim

This is my current (and constantly in-progress) configuration that I use on a
daily basis.

---

Requirements:
	- Neovim 0.9 (https://github.com/neovim/neovim), although I build from
	  source because I like to live dangerously

	  - Tested and working as of NVIM v0.10.0-dev-1115+g73c71ed95

	- If you want to use luacheck, then make sure you have Lua and luarocks
	  installed locally (otherwise Mason won't be able to install it)

---

Current startup times (tested with Hyperfine):

  ❯ hyperfine "nvim --headless +qa"

  Benchmark 1: nvim --headless +qa
    Time (mean ± σ):     191.5 ms ±  38.8 ms    [User: 157.7 ms, System: 27.7 ms]
    Range (min … max):   141.6 ms … 283.3 ms    20 runs
