# Dockerized Neovim

This container is build to my preference but you can feel free to fork and modify all you want. 

## How to use

### Install the neovim shell script

Copy the `neovim` shell script from in the container to anywhere on your `$PATH`. 

```bash
docker run --rm fxdgear/alpine-neovim cat /neovim > /usr/local/bin/nvim
```

**TODO** fix this so I don't have to do this anymore
It's possible depending on your OS that there can be some weird line endings to fix that run:

```bash
sed -i 's/\r//' filename
```

## Run Neovim

now just run the command `nvim`.

