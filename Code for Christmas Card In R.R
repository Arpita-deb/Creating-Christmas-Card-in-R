# creating the background
t1 <- ggplot() +
  theme_void() +
  theme(
    plot.background = element_rect(
      fill = "gold1"
    )
  )
t1

# adding small triangles in the background
set.seed(20231225)
n <- 75
triangles <- data.frame(
  x = runif(n, 0, 1),
  y = runif(n, 0, 1)
)

t2 <- t1 +
  geom_point(
    data = triangles,
    mapping = aes(
      x = x,
      y = y
    ),
    colour = "orangered",
    pch = 6
  )
t2

# adding small squares in the background
set.seed(20241225)
n <- 100
squares <- data.frame(
  x = runif(n, 0, 1),
  y = runif(n, 0, 1)
)

t3 <- t2 +
  geom_point(
    data = squares,
    mapping = aes(
      x = x,
      y = y
    ),
    colour = "darkgreen",
    pch = 5
  )
t3

# adding the floor
t4 <- t3 +
  annotate(
    geom = "rect",
    xmin = 0, xmax = 1,
    ymin = 0, ymax = 0.05,
    fill = "red",
    colour = "red"
  ) + xlim(0,1) + ylim(0,1) +
  coord_fixed(expand = FALSE)

t4

# creating tree tier 1
tree_pts1 <- matrix(
  c(
    0.35, 0.24,
    0.8, 0.24,
    0.6, 0.55,
    0.35, 0.24
  ),
  ncol = 2,
  byrow = TRUE
)
tree <- st_polygon(list(tree_pts1))
plot(tree)

t5 <- t4 +
  geom_sf(
    data = tree,
    fill = "green4",
    colour = "green4"
  ) +
  coord_sf(expand = FALSE)

t5

# creating tree tier 2
tree_pts2 <- matrix(
  c(
    0.4, 0.39,
    0.77, 0.39,
    0.6, 0.59,
    0.4, 0.39
  ),
  ncol = 2,
  byrow = TRUE
)
tree <- st_polygon(list(tree_pts2))
plot(tree)

t6 <- t5 +
  geom_sf(
    data = tree,
    fill = "green3",
    colour = "green3"
  ) +
  coord_sf(expand = FALSE)

t6

# creating tree tier 3
tree_pts3 <- matrix(
  c(
    0.46, 0.52,
    0.73, 0.52,
    0.6, 0.7,
    0.46, 0.52
  ),
  ncol = 2,
  byrow = TRUE
)
tree <- st_polygon(list(tree_pts3))
plot(tree)

t7 <- t6 +
  geom_sf(
    data = tree,
    fill = "green1",
    colour = "green1"
  ) +
  coord_sf(expand = FALSE)

t7

# creating the trunk of the tree
t8 <- t7 +
  annotate(
    geom = "rect",
    xmin = 0.55, xmax = 0.63,
    ymin = 0.03, ymax = 0.24,
    fill = "chocolate4",
    colour = "chocolate4"
  )
t8

#adding the presents

t9 <- t8 + 
  annotate(
    geom = "rect",
    xmin=0.24, xmax = 0.4,
    ymin = 0.03, ymax = 0.22, fill = "indianred1", color = "indianred1"
  )
t9


t10 <- t9 + 
  annotate(
    geom = "rect",
    xmin=0.03, xmax = 0.26,
    ymin = 0.03, ymax = 0.13, fill = "darkorange", color = "darkorange"
  )
t10

t11 <- t10 + 
  annotate(
    geom = "rect",
    xmin=0.42, xmax = 0.53,
    ymin = 0.03, ymax = 0.12, fill = "midnightblue", color = "midnightblue"
  )
t11

t12 <- t11 + 
  annotate(
    geom = "rect",
    xmin=0.72, xmax = 0.96,
    ymin = 0.03, ymax = 0.23, fill = "red3", color = "red3"
  )
t12

# adding the present ribbons
t13 <- t12 + 
  annotate(
    geom = "rect",
    xmin=0.81, xmax = 0.83,
    ymin = 0.03, ymax = 0.23, fill = "lavenderblush1", color = "lavenderblush1"
  )
t13


t14 <- t13 + 
  annotate(
    geom = "rect",
    xmin=0.45, xmax = 0.47,
    ymin = 0.03, ymax = 0.12, fill = "mistyrose", color = "mistyrose"
  )
t14

t15 <- t14 + 
  annotate(
    geom = "rect",
    xmin=0.1, xmax = 0.12,
    ymin = 0.03, ymax = 0.13, fill = "khaki", color = "khaki"
  )
t15


t16 <- t15 + 
  annotate(
    geom = "rect",
    xmin=0.3, xmax = 0.33,
    ymin = 0.03, ymax = 0.22, fill = "paleturquoise2", color = "paleturquoise2"
  )
t16


# creating the star
triangle_pts <- matrix(
  c(
    0.52, 0.75,
    0.67, 0.75,
    0.6, 0.7,
    0.52, 0.75
  ),
  ncol = 2,
  byrow = TRUE
)
triangle <- st_polygon(list(triangle_pts))
plot(triangle)


t17 <- t16 +
  geom_sf(
    data = triangle,
    fill = "yellow",
    colour = "yellow"
  ) +
  coord_sf(expand = FALSE)
t17

ltriangle_pts <- matrix(
  c(
    0.55, 0.68,
    0.6, 0.8,
    0.6, 0.7,
    0.55, 0.68
  ),
  ncol = 2,
  byrow = TRUE
)
ltriangle <- st_polygon(list(ltriangle_pts))
plot(ltriangle)

t18 <- t17 +
  geom_sf(
    data = ltriangle,
    fill = "yellow",
    colour = "yellow"
  ) +
  coord_sf(expand = FALSE)
t18


rtriangle_pts <- matrix(
  c(
    0.6, 0.7,
    0.6, 0.8,
    0.65, 0.68,
    0.6, 0.7
  ),
  ncol = 2,
  byrow = TRUE
)
rtriangle <- st_polygon(list(rtriangle_pts))
plot(rtriangle)

t19 <- t18 +
  geom_sf(
    data = rtriangle,
    fill = "yellow",
    colour = "yellow"
  ) +
  coord_sf(expand = FALSE)
t19


# creating the lights 
t20 <- t19 +
  geom_circle(
    data = data.frame(
      x0 = c(0.6, 0.7, 0.54, 0.72, 0.63, 0.5, 0.47, 0.55,0.62),
      y0 = c(0.3, 0.5, 0.43, 0.33, 0.48, 0.25, 0.4, 0.54, 0.64),
      r = c(0.02, 0.02, 0.024, 0.015, 0.02, 0.02, 0.015, 0.019, 0.024)
    ),
    mapping = aes(x0 = x0, y0 = y0, r = r),
    fill = "red",
    colour = "gold"
  )
t20

# Merry Christmas Wish
t21 <- t20 +
  annotate(
    geom = "text",
    x = 0.35, y = 0.82,
    label = "Merry Christmas and\n Happy Holidays\n To You All!",
    colour = "red3",
    family = "serif",
    fontface = "italic", size = 7
  )
t21
