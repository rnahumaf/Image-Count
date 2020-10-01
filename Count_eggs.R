
img = readImage("IMG_5358.JPG") # Small image, please
colorMode(img) = Grayscale

threshold = otsu(img)
img_th = img > threshold

disc = makeBrush(31, "disc")
er <- blackTopHat(img_th, disc)
# display(er)

# If the above ends up with artifacts (small unrelated objects)
# You can play with 'makeBrush' size and 'erode' until they're gone

disc = makeBrush(3, "disc")
er <- erode(er, disc)
# display(er)

# Change tolerance as needed
nmask = watershed( distmap(er), tolerance = 0.9)
# And check visually if labels are adequate
display(colorLabels(nmask), method = "raster")

# Then, finally, get the label count
max(nmask)
