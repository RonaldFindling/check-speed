#!/bin/bash

username=vagrant #odroid

# configure your timezone here
ln -sf /usr/share/zoneinfo/Europe/Vienna /etc/localtime

apt-get update

# install speedtest-cli https://github.com/sivel/speedtest-cli
apt-get install -y python-pip
pip install speedtest-cli # fails without sudo

# install R
apt-get install -y r-base
mkdir -p "/home/${username}/lib/R"
R -e 'source("http://bioconductor.org/biocLite.R"); install.packages("rmarkdown", repos="http://cran.uni-muenster.de/"); install.packages("scales", repos="http://cran.uni-muenster.de/"); install.packages("ggplot2", repos="http://cran.uni-muenster.de/"); ' #, lib="/home/vagrant/lib/R")'

# install pandoc (to convert markdown to latex)
apt-get install -y pandoc

# install latex (needed in pancod for pdf-latex)
apt-get install -y texlive-full #texlive-latex-recommended

# install poppler-utils so we can view pdfs in the shell with less myfile.pdf
apt-get install -y poppler-utils

