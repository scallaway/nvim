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
      Time (mean ± σ):      36.1 ms ±   1.5 ms    [User: 27.8 ms, System: 8.2 ms]
      Range (min … max):    32.7 ms …  41.8 ms    83 runs

There's more work to be done here in terms of startup time, but that involves a
lot of "lazy" configuration and, to be honest, 37ms of startup is really not
that bad.
