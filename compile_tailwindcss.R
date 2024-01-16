#' Install tailwindcss
#' 
#' @description 
#' This will install tailwindcss locally. It is only need to be run once 
#' per computer
#' 
install_tailwindcss <- function() {
  system(glue::glue(r'(
    cd {here::here()}
    npm install -D tailwindcss @tailwindcss/typography
  )'))
}

#' Compile TailwindCSS
#' 
#' @description 
#' This will create a css file to `output`.
#' 
#' @param watch Should the css file be continously updated. Warning,
#' this will take up the R terminal and continue running, so should 
#' be run in a seperate R terminal (or as RStudio background job)
#' @param input Path to input css file. Where the `@tailwind` directives go.
#' @param output Path to output css file. Where the compiled file goes. This 
#' should be imported as quarto site
#' 
compile_tailwindcss <- function(watch = FALSE, input = "input.css", output = "output.css") {
  watch_str <- if (watch) "--watch" else ""
  system(glue::glue(r'(
    cd {here::here()}
    tailwindcss -i {input} -o {output} {watch_str}
  )'))
}

# Run when using `quarto render`
compile_tailwindcss(watch = FALSE)
