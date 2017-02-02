load("./teamcolors.Rdata")

#' @title Sports team color schemes.
#' 
#' @description These are color schemes from a variety of popular teams.
#' 
#' @param name Name of the team to use.
#' @return A vector of colors (hex format)
#' @export
#' @keywords colors sports
#' @examples
#' team_colors("Winnipeg Jets")
team_colors <- function(name) {
	palt <- teamlist[[name]]
	if (is.null(palt))
    	stop("Team colors not found!")

    # Return the color scheme as a vector
    return(as.vector(palt))
}
