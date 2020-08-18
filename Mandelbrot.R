# Mandelbrot.R

# Parameters

cols <- colorRampPalette(c("blue","yellow","red","black"))(11)
xmin = -0.70
xmax = -0.65
nx = 500
ymin = 0.30
ymax = 0.34
ny = 500
n = 10000

# Variables

x <- seq(xmin, xmax, length.out = nx)
y <- seq(ymin, ymax, length.out = ny)
c <- outer(x,y*1i,FUN = "+")
z <- matrix(0.0, nrow = length(x), ncol = length(y))
k <- matrix(0.0, nrow = length(x), ncol = length(y))

for(rep in 1:n) {
  print(rep)
  index <- which(Mod(z)<2)
  z[index] <- z[index]^2 + c[index]
  k[index] <- k[index] + 1
}

image(x,y,k, col = cols)