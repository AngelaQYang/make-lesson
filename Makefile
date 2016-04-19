anaysis.zip: isles.dat abyss.dat last.dat
	zip analysis.zip isles.dat abyss.dat last.da

.PHONY: dats
dats: isles.dat abyss.bat  last.da

isles.dat : books/isles.txt 
	python wordcount.py books/isles.txt isles.dat
	
abyss.dat : books/abyss.txt
	python wordcount.py books/abyss.txt abyss.bat
	
last.dat: books/last.txt
	python wordcount.py books/last.txt last.dat

	
.PHONY: clean
clean:
	rm -f analysis.zip