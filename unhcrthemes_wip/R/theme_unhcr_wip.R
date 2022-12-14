theme_unhcr_wip <- function(font_size = 9, font_family = "Lato", line_size = .5,
                            rel_small = 8 / 9, rel_tiny = 7 / 9, rel_large = 12 / 9,
                            grid = TRUE, axis = "x", ticks = FALSE) {
  # margin
  half_line <- font_size / 2

  # colours
  unhcr_blue <- "#0072BC"
  dark_grey <- "#191919"
  medium_grey <- "#666666"
  light_grey <- "#CCCCCC"

  # work off theme_minimal
  ret <- ggplot2::theme_minimal(base_family = font_family, base_size = font_size)

  # reset all base element
  ret <- ret + ggplot2::theme(line = ggplot2::element_line(
    color = "black", size = line_size, linetype = 1, lineend = "butt"
  ))
  ret <- ret + ggplot2::theme(rect = ggplot2::element_rect(
    fill = NA, color = NA, size = line_size, linetype = 1
  ))
  ret <- ret + ggplot2::theme(text = ggplot2::element_text(
    family = font_family, face = "plain", color = dark_grey,
    size = font_size, hjust = 0.5, vjust = 0.5, angle = 0, lineheight = .9,
    margin = ggplot2::margin(), debug = FALSE
  ))

  # legend
  ret <- ret + ggplot2::theme(legend.background = ggplot2::element_blank())
  ret <- ret + ggplot2::theme(legend.spacing = grid::unit(font_size, "pt"))
  ret <- ret + ggplot2::theme(legend.margin = ggplot2::margin(0, 0, 0, 0))
  ret <- ret + ggplot2::theme(legend.key = ggplot2::element_blank())
  ret <- ret + ggplot2::theme(legend.key.size = grid::unit(1.1 * font_size, "pt"))
  ret <- ret + ggplot2::theme(legend.text = ggplot2::element_text(size = rel(rel_small)))
  ret <- ret + ggplot2::theme(legend.title = ggplot2::element_text(hjust = 0))
  ret <- ret + ggplot2::theme(legend.position = "top")
  ret <- ret + ggplot2::theme(legend.direction = "horizontal")
  ret <- ret + ggplot2::theme(legend.justification = 0.5)
  ret <- ret + ggplot2::theme(legend.box.margin = ggplot2::margin(0, 0, 0, 0))
  ret <- ret + ggplot2::theme(legend.box.background = ggplot2::element_blank())
  ret <- ret + ggplot2::theme(legend.box.spacing = grid::unit(font_size, "pt"))

  # grid
  if (inherits(grid, "character") | grid == TRUE) {
    ret <- ret + ggplot2::theme(panel.grid = ggplot2::element_line(color = light_grey, size = line_size / 2))
    ret <- ret + ggplot2::theme(panel.grid.major = ggplot2::element_line(color = light_grey, size = line_size / 2))
    ret <- ret + ggplot2::theme(panel.grid.minor = ggplot2::element_line(color = light_grey, size = line_size / 2))

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + ggplot2::theme(panel.grid.major.x = ggplot2::element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + ggplot2::theme(panel.grid.major.y = ggplot2::element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + ggplot2::theme(panel.grid.minor.x = ggplot2::element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + ggplot2::theme(panel.grid.minor.y = ggplot2::element_blank())
    }
  } else {
    ret <- ret + ggplot2::theme(panel.grid = ggplot2::element_blank())
  }

  # panel
  ret <- ret + ggplot2::theme(panel.background = ggplot2::element_blank())
  ret <- ret + ggplot2::theme(panel.border = ggplot2::element_blank())
  ret <- ret + ggplot2::theme(panel.spacing = grid::unit(half_line, "pt"))
  ret <- ret + ggplot2::theme(panel.ontop = FALSE)

  # axis line
  if (inherits(axis, "character") | axis == TRUE) {
    ret <- ret + ggplot2::theme(axis.line = ggplot2::element_line(
      color = dark_grey, size = line_size,
      lineend = "square"
    ))
    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + ggplot2::theme(axis.line.x = ggplot2::element_blank())
      } else {
        ret <- ret + ggplot2::theme(axis.line.x = ggplot2::element_line(
          color = dark_grey, size = line_size,
          lineend = "square"
        ))
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + ggplot2::theme(axis.line.y = ggplot2::element_blank())
      } else {
        ret <- ret + ggplot2::theme(axis.line.y = ggplot2::element_line(
          color = dark_grey, size = line_size,
          lineend = "square"
        ))
      }
    } else {
      ret <- ret + ggplot2::theme(axis.line.x = ggplot2::element_line(
        color = dark_grey, size = line_size,
        lineend = "square"
      ))
      ret <- ret + ggplot2::theme(axis.line.y = ggplot2::element_line(
        color = dark_grey, size = line_size,
        lineend = "square"
      ))
    }
  } else {
    ret <- ret + ggplot2::theme(axis.line = ggplot2::element_blank())
  }

  # axis text
  ret <- ret + ggplot2::theme(axis.text = ggplot2::element_text(size = rel(rel_small), color = dark_grey))
  ret <- ret + ggplot2::theme(axis.text.x = ggplot2::element_text(margin = ggplot2::margin(
    t = rel_small * font_size / 4
  ), vjust = 1))
  ret <- ret + ggplot2::theme(axis.text.x.top = ggplot2::element_text(margin = ggplot2::margin(
    b = rel_small * font_size / 4
  ), vjust = 0))
  ret <- ret + ggplot2::theme(axis.text.y = ggplot2::element_text(margin = ggplot2::margin(
    r = rel_small * font_size / 4
  ), hjust = 1))
  ret <- ret + ggplot2::theme(axis.text.y.right = ggplot2::element_text(margin = ggplot2::margin(
    l = rel_small * font_size / 4
  ), hjust = 0))

  # axis title
  ret <- ret + ggplot2::theme(axis.title = ggplot2::element_text(size = rel(rel_small), color = medium_grey))
  ret <- ret + ggplot2::theme(axis.title.x = ggplot2::element_text(margin = ggplot2::margin(
    t = rel_small * font_size / 4
  ), vjust = 1))
  ret <- ret + ggplot2::theme(axis.title.x.top = ggplot2::element_text(margin = ggplot2::margin(
    b = rel_small * font_size / 4
  ), vjust = 0))
  ret <- ret + ggplot2::theme(axis.title.y = ggplot2::element_text(angle = 90, margin = ggplot2::margin(
    r = rel_small * font_size / 4
  ), vjust = 1))
  ret <- ret + ggplot2::theme(axis.title.y.right = ggplot2::element_text(angle = -90, margin = ggplot2::margin(
    l = rel_small * font_size / 4
  ), vjust = 0))

  # ticks
  if (inherits(ticks, "character") | ticks == TRUE) {
    ret <- ret + ggplot2::theme(axis.ticks.length = grid::unit(half_line / 2, "pt"))
    ret <- ret + ggplot2::theme(axis.ticks = ggplot2::element_line(color = dark_grey, size = line_size / 2))
    if (inherits(ticks, "character")) {
      ticks <- tolower(ticks)
      if (regexpr("x", ticks)[1] < 0) {
        ret <- ret + ggplot2::theme(axis.ticks.x = ggplot2::element_blank())
      } else {
        ret <- ret + ggplot2::theme(axis.ticks.x = ggplot2::element_line(color = dark_grey, size = line_size / 2))
      }
      if (regexpr("y", ticks)[1] < 0) {
        ret <- ret + ggplot2::theme(axis.ticks.y = ggplot2::element_blank())
      } else {
        ret <- ret + ggplot2::theme(axis.ticks.y = ggplot2::element_line(color = dark_grey, size = line_size / 2))
      }
    } else {
      ret <- ret + ggplot2::theme(axis.ticks.x = ggplot2::element_line(color = dark_grey, size = line_size / 2))
      ret <- ret + ggplot2::theme(axis.ticks.y = ggplot2::element_line(color = dark_grey, size = line_size / 2))
    }
  } else {
    ret <- ret + ggplot2::theme(axis.ticks = element_blank())
  }

  # strip
  ret <- ret + ggplot2::theme(strip.text = ggplot2::element_text(
    hjust = 0, size = font_size,
    margin = ggplot2::margin(half_line / 2, half_line / 2, half_line / 2, half_line / 2)
  ))

  # title and subtitle
  ret <- ret + ggplot2::theme(plot.title = ggplot2::element_text(
    size = rel(rel_large), color = "black", face = "bold",
    hjust = 0, vjust = 1,
    margin = ggplot2::margin(b = half_line),
  ))
  ret <- ret + ggplot2::theme(plot.subtitle = ggplot2::element_text(
    size = font_size, color = dark_grey, face = "plain",
    hjust = 0, vjust = 1,
    margin = ggplot2::margin(b = half_line)
  ))
  ret <- ret + ggplot2::theme(plot.title.position = "plot")

  # caption
  ret <- ret + ggplot2::theme(plot.caption = ggplot2::element_text(
    size = rel(rel_tiny), color = medium_grey,
    hjust = 0, vjust = 1,
    margin = ggplot2::margin(t = half_line)
  ))
  ret <- ret + ggplot2::theme(plot.caption.position = "plot")

  # tag
  ret <- ret + ggplot2::theme(plot.tag = ggplot2::element_text(
    size = font_size, color = unhcr_blue,
    hjust = 0, vjust = 1
  ))
  ret <- ret + ggplot2::theme(plot.tag.position = c(0, 1))

  # plot
  ret <- ret + ggplot2::theme(plot.background = ggplot2::element_blank())
  ret <- ret + ggplot2::theme(plot.margin = ggplot2::margin(half_line, half_line, half_line, half_line))

  # class for condition on tag
  class(ret) <- c("conditional_theme", class(ret))

  ret
}

# conditional theme testing the tag presence and adding some margin
# TODO Find a way to get margin based on font_size as the main theme.
# potential solution plot$theme$text$size
# seems that it shrinks the margin after the title if not restated here.
ggplot_add.conditional_theme <- function(object, plot, object_name) {
  if (!is.null(plot$labels$tag)) {
    object <- object + ggplot2::theme(plot.title = ggplot2::element_text(
      margin = ggplot2::margin(t = 9 * 1.5, b = 4.5)
    ))
  }
  plot$theme <- ggplot2:::add_theme(plot$theme, object, object_name)
  plot
}
