## ---- include = FALSE---------------------------------------------------------
op = par(no.readonly=TRUE) # save par to restore later
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
knitr::opts_knit$set(global.par = TRUE)
library("baffle")

## ---- include=FALSE-----------------------------------------------------------
par("mar"=rep(0, 4))

## ---- eval=TRUE---------------------------------------------------------------
waffle(c(3,8))

## -----------------------------------------------------------------------------
par(mfrow=c(1, 3))
waffle(c(25, 75), col=c("red", "gray"))
waffle(c(25, 75), col=c("blue", "gray"), ncol=5)
waffle(c(25, 75), col=c("darkgreen", "gray"), nrow=5)

## -----------------------------------------------------------------------------
par(mfrow=c(2,2))
waffle(c(13, 12), col=c("darkorchid", "gray"))
waffle(c(13, 12), col=c("skyblue", "gray"), from="topright")
waffle(c(13,12), col=c("tomato", "gray"), byrow=FALSE)
waffle(c(13,12), col=c("springgreen", "gray"), from="bottomright", byrow=FALSE)

## ---- include=FALSE-----------------------------------------------------------
par(mfrow=c(1,1))

## -----------------------------------------------------------------------------
par(mar=c(4,0,0,0))
cyl = table(mtcars$cyl)
waffle(cyl, stacked=FALSE, gap=1)
legend("top", horiz=TRUE, bty="n", inset=0.9, xpd=TRUE,
    legend=names(cyl), cex=2,
    fill=palette.colors(length(cyl), "Set 1"), border=NA,
    title="Number of cylinders\n in 'mtcars'")

## -----------------------------------------------------------------------------
par(mar=c(4,0,0,0))
cyl = table(mtcars$cyl)
waffle(cyl, stacked=FALSE, gap=1, f=rcpoly, n=as.numeric(names(cyl)))
legend("top", horiz=TRUE, bty="n", inset=0.9, xpd=TRUE,
    legend=names(cyl), cex=2,
    fill=palette.colors(length(cyl), "Set 1"), border=NA,
    title="Number of cylinders\n in 'mtcars'")

## -----------------------------------------------------------------------------
autotext = function(x, y, labels, d=0.9, ...){
    cex = min(1/strheight(labels), 1/strwidth(labels))*d
    text(x, y, labels, cex=cex, ...)
    }

par(mar=c(4,0,0,0))
cyl = table(mtcars$cyl)
waffle(cyl, stacked=FALSE, gap=1, f=autotext, labels=names(cyl))
legend("top", horiz=TRUE, bty="n", inset=0.9, xpd=TRUE,
    legend=names(cyl), cex=2,
    fill=palette.colors(length(cyl), "Set 1"), border=NA,
    title="Number of cylinders\n in 'mtcars'")

## ---- include=FALSE-----------------------------------------------------------
par(mar=rep(0,4))

## -----------------------------------------------------------------------------
library("png")
path = system.file("img/Rlogo.png", package="png")
imgR = imgG = imgB = img = readPNG(path)
imgR[,,c(2,3)] = 0
imgG[,,c(1,3)] = 0
imgB[,,c(1,2)] = 0
waffle(c(1,1,1,1), f=rasters, image=list(img, imgR, imgG, imgB), rotate=c(0,30,60,90))

## ---- include=FALSE-----------------------------------------------------------
# Restore old par
par(op)

