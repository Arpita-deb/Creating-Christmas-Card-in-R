# R You Ready for Christmas?
## A Guide to Create Custom Cards with R
![christmas](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/cff47923-ad0b-45be-a0bb-0e54c3515ae0)
Inspired by an article about how to create a Christmas card in R, I've created my own Christmas Card using ggplot() in R Programming Language.

# Tool used: 
* R Programming Language
* RStudio

# Packages used:
* ggplot2
* ggforce
* sf

# Steps Taken:

## Step 1 ~ Loading the required packages
  
    # Installing the required packages
      install.packages("tidyverse")
      install.packages("ggforce")
      install.packages("sf")
      
      library(ggplot2)
      library(ggforce)
      library(sf)

![Rplot](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/fddcb754-3daa-4939-93cb-8113cc8456df)

## Step 2 ~ Creating a golden background
      
      t1 <- ggplot() +                      # to create a blank canvas using an empty plot
       theme_void() +                       # removing all the themes elements
        theme(
          plot.background = element_rect(   # creating a blank rectangle as our first layer of the card
            fill = "gold1"                  # giving it a golden color
          )
        )
      t1

![Rplot01](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/9c726d12-e522-4ca1-842b-44ab5c36e13b)

## Step 3 ~ Adding small triangles and squares in the background

      # Generating small triangles for the background
      
      set.seed(20231225)        # random seed, to generate the same numbers as this code
      n <- 75                   # number of triangles to create
      triangles <- data.frame(  # dataframe to store the coordinates of the triangles
        x = runif(n, 0, 1),     # to generate random locations between (0,1) of triangles using a uniform distribution
        y = runif(n, 0, 1)
      )
      
      # Generating small squares for the background
      
      set.seed(20241225)        # random seed, to generate the same numbers as this code
      n <- 100                  # number of squares to create
      squares <- data.frame(    # dataframe to store the coordinates of the squares
        x = runif(n, 0, 1),     # to generate random locations between (0,1) of squares using a uniform distribution
        y = runif(n, 0, 1)
      )
      
      # Adding small squares in the original plot
      
      t2 <- t1 +                # adding the new layer on the previous one (t1)
        geom_point(             # using the triangle data to add the layer
          data = triangles,
          mapping = aes(
            x = x,
            y = y
          ),
          colour = "orangered", # setting the color to orangered
          pch = 6               # to create triangles
        )
      t2
      
      
      # Adding small squares in the original plot
      
      t3 <- t2 +                 # adding the new layer on the previous one (t2)
        geom_point(              # using the square data to add the layer
          data = squares,
          mapping = aes(
            x = x,
            y = y
          ),
          colour = "darkgreen",  # setting the color to darkgreen
          pch = 5                # to create squares
        )
      t3

![Rplot02](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/7963ea34-e2f8-4fc8-afcb-54f7a81ec86b)

## Step 4 ~ Adding a carpeted floor
To add a ground, i.e. a carpeted floor, we'll add a red rectangle along the bottom of the plot.

      t4 <- t3 +
        annotate(
          geom = "rect",              # to create a rectangle
          xmin = 0, xmax = 1,         # the coordinates of the corners of the rectangle 
          ymin = 0, ymax = 0.05,      # color of the rectangle
          fill = "red",               # color of the border
          colour = "red"
        ) + 
        xlim(0,1) +                   # to prevent the plot area from resizing to fit the area of the floor
        ylim(0,1) +
        coord_fixed(expand = FALSE)   # to fix the 1:1 aspect ratio and make sure our grid is actually square with expand = FALSE to remove the additional padding at the sides of the plot.
      t4

![Rplot03](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/2005779e-c763-4ff6-8885-a16ae6d57b9b)

## Step 5 ~ Creating the Christmas Tree
To create a very basic Christmas tree, we'll use 3 triangles on top of each other to give it its characteristic pyramidal shape.
Since there are no built-in triangle geoms in ggplot2, we'll create a polygon using the sf (simple features) package. We'll create 3 triangles by adding the coordinates on the original plot and adding them as layers one on top of another.

     # Creating the triangle for tree tier 1
      tree_pts1 <- matrix( 
        c(                  # coordinate points for the first triangle
          0.35, 0.24,       # a matrix with two columns – one for x coordinates and one for y
          0.8, 0.24,
          0.6, 0.55,
          0.35, 0.24        # The last row is the same as the first to make the polygon closed.
        ),
        ncol = 2,
        byrow = TRUE
      )
      tree <- st_polygon(list(tree_pts1)) # the matrix is converted into a spatial object using the st_polygon() function
      plot(tree)            # plotting the triangle
      
      # Adding the triangle in the original plot
      t5 <- t4 +
        geom_sf(  
          data = tree,
          fill = "green4",
          colour = "green4"
        ) +
        coord_sf(expand = FALSE)
      t5

![tree tier 1](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/40ffb7c8-c369-48aa-954b-c8a61c8a5970)

The rest of the tiers are created similarly.

      # Creating the triangle for tree tier 2
      
      tree_pts2 <- matrix(
        c(                          # coordinate points for the second triangle
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
      
      # Adding the triangle in the original plot
      t6 <- t5 +
        geom_sf(
          data = tree,
          fill = "green3",
          colour = "green3"
        ) +
        coord_sf(expand = FALSE)
      t6
      
      # Creating the triangle for tree tier 3
      
      tree_pts3 <- matrix(         # coordinate points for the third triangle
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
      
      # Adding the triangle in the original plot
      t7 <- t6 +
        geom_sf(
          data = tree,
          fill = "green1",
          colour = "green1"
        ) +
        coord_sf(expand = FALSE)
      t7


![Rplot06](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/919e575b-5abf-44c0-8c29-643cd8500074)

![Rplot07](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/84968c04-50b5-479c-af83-83917786a7af)

## Step 6 ~ Creating the trunk of the tree
Using the annotate function I'll create a brown rectangle and add it as a layer on the original plot, under the first tree tier, as the trunk of the tree.

    # Creating the trunk of the tree
    t8 <- t7 +
      annotate(
        geom = "rect",
        xmin = 0.55, xmax = 0.63,
        ymin = 0.03, ymax = 0.24,
        fill = "chocolate4",
        colour = "chocolate4"
      )
    t8
![Rplot08](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/caf3dc6c-2295-415a-80bc-0808fef5d1a7)

## Step 7 ~ Adding the presents
I created the presents in the same way as I've created the floor and the tree trunk, by annotating a rectangle with different colors and shapes.

    # Generating the rectangles for the present ribbons
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

![Rplot09](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/cc819117-54ad-48de-956b-85b6866a9e9c)

## Step 8 ~ Adding the present ribbons
By creating thinner stripes in the same old way i.e., by annotating with rectangles with different shapes and colors, I've added the ribbons to tie up the presents.

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
![Rplot10](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/c8b6e3b4-0fa8-484d-b49c-0f4d11499954)

## Step 9 ~ Creating the star
Using a combination of 3 triangles we can create a star to top the Christmas tree.

     # Coordinate points for the central triangle
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
      
      # Coordinate points for the left triangle
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
      
      # Coordinate points for the right triangle
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

![triangles](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/13a96381-3832-4c36-a870-455112b69655)

      # Adding the central triangle on the tree
      t17 <- t16 +
        geom_sf(
          data = triangle,
          fill = "yellow",
          colour = "yellow"
        ) +
        coord_sf(expand = FALSE)
      t17
      
      # Adding the left triangle on the tree
      t18 <- t17 +
        geom_sf(
          data = ltriangle,
          fill = "yellow",
          colour = "yellow"
        ) +
        coord_sf(expand = FALSE)
      t18
      
      # Adding the right triangle on the tree
      t19 <- t18 +
        geom_sf(
          data = rtriangle,
          fill = "yellow",
          colour = "yellow"
        ) +
        coord_sf(expand = FALSE)
      t19

![Rplot14](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/78ad2975-0380-4770-8eb2-0c6ad05f8f65)

## Step 10 ~ Adding the Christmas Baubles
To add some decorations to the tree, I decided to create some red circles with golden border to denote Christmas baubles/bubbles/globes.

    # Creating circles for the decorations
      t20 <- t19 +
        geom_circle(             # the geom_circle() needs 3 arguments: coordinates of the center of the circle and the radius of it
          data = data.frame(     # creating the data frame inside the function
            x0 = c(0.6, 0.7, 0.54, 0.72, 0.63, 0.5, 0.47, 0.55,0.62),        # x-coordinates of the center of the circles
            y0 = c(0.3, 0.5, 0.43, 0.33, 0.48, 0.25, 0.4, 0.54, 0.64),       # y-coordinates of the center of the circles
            r = c(0.02, 0.02, 0.024, 0.015, 0.02, 0.02, 0.015, 0.019, 0.024) # radii of the circles
          ),
          mapping = aes(x0 = x0, y0 = y0, r = r),
          fill = "red",          # filling the baubles with red color
          colour = "gold"        # giving the baubles golden border
        )
      
      t20

![Rplot15](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/e6f9a92e-ac2e-443c-bfd6-bcab408470b2)

# Step 11 ~ Adding the final text

      # Adding the Greetings
      t21 <- t20 +
        annotate(
          geom = "text",                  # adding text to our plot using the annotate() function and the "text" geometry
          x = 0.35, y = 0.82,             # x and y coordinates for the location of the text
          label = "Merry Christmas and\n Happy Holidays\n To You All!", # the text as label, \n is used to break the text
          colour = "red3",                # color of the text
          family = "serif",               # font family 
          fontface = "italic", size = 7   # fontface and font size of the text
        )
      t21

![Rplot16](https://github.com/Arpita-deb/Creating-Christmas-Card-in-R/assets/139372731/1b4cf6ad-6186-41c8-aa3a-7b19c7314756)

# Resource:

* [CREATING CHRISTMAS CARDS WITH R](https://realworlddatascience.net/ideas/tutorials/posts/2023/12/12/xmas-cards.html?utm_campaign=Data_Elixir&utm_source=Data_Elixir_464)
