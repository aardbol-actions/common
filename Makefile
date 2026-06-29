SUBDIRS = action-io-generator bundle-verifier

.PHONY: install compile bundle test lint all clean

install:
	@for dir in $(SUBDIRS); do \
		(cd $$dir && npm install); \
	done

compile:
	@for dir in $(SUBDIRS); do \
		(cd $$dir && npm run compile); \
	done

bundle:
	@for dir in $(SUBDIRS); do \
		if [ -f "$$dir/package.json" ]; then \
			(cd $$dir && npm run bundle); \
		fi \
	done

test:
	@for dir in $(SUBDIRS); do \
		(cd $$dir && npm test); \
	done

lint:
	@for dir in $(SUBDIRS); do \
		(cd $$dir && npm run lint); \
	done

all: install compile bundle test

clean:
	@for dir in $(SUBDIRS); do \
		(cd $$dir && npm run clean); \
	done
