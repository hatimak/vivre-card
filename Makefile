.PHONY: all
.PHONY: cv
.PHONY: coverletter

CC = xelatex
BUILD_DIR = ./build
CV_DIR = ./cv
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

all: $(foreach x, coverletter cv, $x.pdf)

cv: cv.pdf

coverletter: coverletter.pdf

cv.pdf: ./cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

coverletter.pdf: ./coverletter.tex
	$(CC) -output-directory=$(BUILD_DIR) $<

clean:
	rm -rf $(BUILD_DIR)/* ./*.log
