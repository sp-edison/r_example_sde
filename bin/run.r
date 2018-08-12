#!/usr/bin/env Rscript


library(optparse)

option_list <- list (
    make_option(c("-i","--inp"), type='character', help="Input file path", default=NULL ,metavar="character")
);

opt_parser <- OptionParser(option_list=option_list);
opt <- parse_args(opt_parser);

if (is.null(opt$inp)){
	print_help(opt_parser);
	stop("At least one argument must be supplied (input file).n", call.=FALSE);
}

inputfile = opt$inp;

## input param ##
lines <- readLines(inputfile);

sde <- list()

for (line in lines) {
	data <- unlist(strsplit(line, " "))
	if (data[1] == 'INT1') {
		sde$int1 = data[2];
	} else if (data[1] == 'REAL1') {
		sde$real1 = data[2];
	} else if (data[1] == 'LIST1') {
		sde$list1 = data[2];
    } else if (data[1] == 'VECTOR1') {
		sde$vector1 = c(data[3], data[4], data[5]);
    }
}

cat('INT1 is ', sde$int1, '\n');
cat('REAL1 is ', sde$real1, '\n');
cat('LIST1 is ', sde$list1, '\n');
cat('VECTOR1 is ', sde$vector1, '\n');
