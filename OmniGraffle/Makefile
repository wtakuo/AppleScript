SRCS = Export_Current_Canvas_to_PDF.applescript Export_All_Canvases_to_PDF.applescript \
	Export_Current_Canvas_to_EPS.applescript Export_All_Canvases_to_EPS.applescript
SCPTS = $(SRCS:%.applescript=%.scpt)

TARGET_DIR = ~/Library/Scripts/Applications/OmniGraffle/

COMPILE = osacompile

%.scpt: %.applescript
	$(COMPILE) -o $@ $^

.PHONY: all install clean allclean

all: $(SCPTS)

install: $(SCPTS)
	cp $^ $(TARGET_DIR)

clean:
	$(RM) $(SCPTS)

allclean: clean
	$(RM) *~
