# pandoc-docker-latex-ja

A sample project using a Pandoc's official Docker image by [pandoc/dockerfiles](https://github.com/pandoc/dockerfiles) 
for Japanese users who wants a PDF output powered by LaTeX (especially LuaLaTeX or XeLaTeX).

Using:

- [pandoc/latex](https://hub.docker.com/r/pandoc/latex) image

## Usage

### docker build

    $ git clone https://github.com/sky-y/pandoc-docker-latex-ja.git
    $ cd pandoc-docker-latex-ja
    $ docker build . -t pandoc-docker-latex-ja

### docker run

To start shell (`/bin/ash`):

    $ docker run --rm -it --name pandoc --volume $(pwd):/data pandoc-docker-latex-ja /bin/ash

For WSL with Docker for Windows: Try this:

    $ docker run --rm -it --name pandoc --volume $(wslpath -m $(pwd)):/data pandoc-docker-latex-ja /bin/ash

The working directory (`WORKDIR`) is `/data` for users.

The Default is `ENTRYPOINT` is `["docker-entrypoint.sh"]` given by [dockerfiles/docker-entrypoint.sh](https://github.com/pandoc/dockerfiles/blob/master/common/docker-entrypoint.sh). That causes that you can use `pandoc` like:

    $ docker run --volume $(pwd):/data --user $(id -u):$(id -g) pandoc-docker-latex-ja https://raw.githubusercontent.com/jgm/pandoc/master/MANUAL.txt

## External files

### LaTeX class file 

- jlreq.cls
    - [abenori/jlreq](https://github.com/abenori/jlreq/)

### Pandoc filter

[minoki/pandoc-aozora-ruby: ?????????????Pandoc filter??](https://github.com/minoki/pandoc-aozora-ruby)

### Sample input file

[??????????](https://www.aozora.gr.jp/cards/001124/card42934.html)

## License

Code in this repository is licensed under the [GNU General Public License Version 2](https://github.com/pandoc/dockerfiles/blob/master/LICENSE).
