TARGET := srif.pdf

.PHONY: all
all: $(TARGET)

$(TARGET): srif.tex libiio.pdf
	texi2pdf $< -o $@

%.pdf: %.svg
	inkscape -f $< -A $@

%.svg: %.dia
	dia -t svg -e $@ $<

.PHONY: clean
clean:
	rm -f $(TARGET) $(TARGET:.pdf=.aux) $(TARGET:.pdf=.log) $(TARGET:.pdf=.out) libiio.pdf

.PHONY: run
run: $(TARGET)
	evince $<
