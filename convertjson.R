library("rjson")

json_file <- "https://raw.githubusercontent.com/jimniels/teamcolors/c700faa806aaa290cfd31a98225df306fda6cf14/static/data/teams.json"
json_data <- fromJSON(file=json_file)

teamlist <- list()

for( i in json_data ){
	tname <- i$name
	tcol <- i$colors$hex
	tcol <- paste("#", tcol, sep = "")
	teamlist[[ tname ]] <- tcol
}

save(teamlist, file = "./teamcolors.Rdata")
