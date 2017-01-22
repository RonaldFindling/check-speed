#!/bin/bash

apt-get update

# install speedtest-cli https://github.com/sivel/speedtest-cli
apt-get install -y python-pip
pip install speedtest-cli # fails without sudo

# install R
apt-get install -y r-base
mkdir -p "/home/vagrant/lib/R"
R -e 'source("http://bioconductor.org/biocLite.R"); install.packages("rmarkdown", repos="http://cran.uni-muenster.de/"); install.packages("scales", repos="http://cran.uni-muenster.de/"); install.packages("ggplot2", repos="http://cran.uni-muenster.de/"); ' #, lib="/home/vagrant/lib/R")'

# install pandoc (to convert markdown to latex)
apt-get install -y pandoc

# install latex (needed in pancod for pdf-latex)
apt-get install -y texlive-full #texlive-latex-recommended

# install poppler-utils so we can view pdfs in the shell with less myfile.pdf
apt-get install poppler-utils

# set executable bits on script files mounted in the vagrant container
chmod +x /vagrant/check_speed/check_internet_speed.sh
chmod +x /vagrant/check_speed/create_internet_speed_report.sh
chmod +x /vagrant/check_speed/monitor_internet_speed.Rmd
