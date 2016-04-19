PLOT_SCRIPT = plotcount.py
TXT_FILES = $(wildcard books/*.txt)
DAT_FILES = $(patsubset books/%.txt, %.bat, $(TXT_FILES))
PNG_FILES = $(patsubset books/%.txt, %.png, $(TXT_FILES))

analysis4.zip : $(DAT_FILES) $(PNG_FILES) $(PLOT_SCRIPT)
	zip $@ $^

.PHONY : variables
variables : 
	echo TXT_FILES: $(TXT_FILES)
	echo DAT_FILES: $(DAT_FILES)
	echo PNG_FILES: $(PNG_FILES)
	
.PHONY : dats
dats : $(DAT_FILES)

.PHONY: pngs
pngs: $(PNG_FILES)

# plot
%.png : books/%.txt $(PLOT_SCRIPT)
	python $(PLOT_SCRIPT) $< $*.dat
	
.PHONY : clean	
clean : 
	rm -f $(DAT_FILES)
	rm -f analysis.zip
	rm -f *.png