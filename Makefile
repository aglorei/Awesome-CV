.PHONY: documents

CC = xelatex
USER_DIR = aglorei
RESUME_DIR = aglorei/resume
CV_DIR = aglorei/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

documents: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(USER_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(USER_DIR) $<

cv.pdf: $(USER_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(USER_DIR) $<

coverletter.pdf: $(USER_DIR)/coverletter.tex
	$(CC) -output-directory=$(USER_DIR) $<

clean:
	rm -rf $(USER_DIR)/*.pdf
