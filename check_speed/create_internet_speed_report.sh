#!/bin/bash
# Use -gt 1 to consume two arguments per pass in the loop (e.g. each
# argument has a corresponding value to go with it).
# Use -gt 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
# as in the --default example).
# note: if this is set to -gt 0 the /etc/hosts part is not recognized ( may be a bug )

########################################
# parameter parsing and scriptification
########################################
help_string="Usage: "`basename "$0"`" -i /path/to/rmarkdownFile.Rmd -o /path/to/outputFile.pdf -d /path/to/datafile.csv\n       "`basename "$0"`" --infile /path/to/rmarkdownFile.Rmd --outfile /path/to/outputFile.pdf --datafile /path/to/datafile.csv\n -i|--infile set the rmarkdownFile to be used\n -o|--outfile set the rmarkdownFile to be used\n -d|--datafile set the csvFile to be read"

# print help string if no parameter are provided
if [ $# -eq 0 ]; then
    echo -e "${help_string}"
    exit 1
fi

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -i|--infile)
    rmarkdownFile="$2"
    shift # past argument
    ;;
	-d|--datafile)
	dataFile="$2"
	shift # past argument
	;;
    -o|--outfile)
    outputFile="$2"
    shift # past argument
    ;;
#    --default)
#    DEFAULT=YES
#    ;;
    *)
    echo -e "${help_string}"
	exit 1
    ;;
esac
shift # past argument or value
done
echo rmarkdownFile = "${rmarkdownFile}"
echo outputFile    = "${outputFile}"
echo dataFile      = "${dataFile}"
# param parsing source from Bruno Bronosky http://stackoverflow.com/a/14203146

########################################
# logic
########################################
Rscript -e "rmarkdown::render(input=\"${rmarkdownFile}\", output_file=\"${outputFile}\", params=list(dataFile=\"${dataFile}\"))"
