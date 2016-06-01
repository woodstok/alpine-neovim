# Dockerized Neovim

This container is build to my preference but you can feel free to fork and modify all you want. 

## How to use

### Install the neovim shell script

Copy the `neovim` shell script from in the container to anywhere on your `$PATH`. 

```bash
docker run -it --rm fxdgear/alpine-neovim:latest cat /neovim | sed -e 's/\r//' > /usr/local/bin/nvim && chmod +x /usr/local/bin/nvim
```

## Run Neovim

now just run the command `nvim`.

