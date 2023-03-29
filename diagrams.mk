PLANTUMLCLI := $(shell which plantumlcli)


SOURCE := ./source
PUMLS := $(shell find ${SOURCE} -name *.puml)
PNGS  := $(addsuffix .puml.png, $(basename ${PUMLS}))
EPSS  := $(addsuffix .puml.eps, $(basename ${PUMLS}))
SVGS  := $(addsuffix .puml.svg, $(basename ${PUMLS}))

%.puml.png: %.puml
	$(PLANTUMLCLI) -t png -o $@ $<

%.puml.eps: %.puml
	$(PLANTUMLCLI) -t eps -o $@ $<

%.puml.svg: %.puml
	$(PLANTUMLCLI) -t svg -o $@ $<

build: ${SVGS}

all: build

clean:
	rm -rf \
		$(shell find ${SOURCE} -name *.puml.svg)
		$(shell find ${SOURCE} -name *.puml.png) \
		$(shell find ${SOURCE} -name *.puml.eps) \
	rm -rf ./build
