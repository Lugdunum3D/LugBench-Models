MODELS = Corset \
	DamagedHelmet \
	FireHydrant

MODELS_ZIPS = $(addsuffix .zip, $(MODELS))
MODELS_OPTIMIZED_ZIPS = $(addsuffix _optimized.zip, $(MODELS))

# Hack for CURL progress-bar https://stackoverflow.com/a/41860083/2367848

all: $(MODELS_ZIPS) $(MODELS_OPTIMIZED_ZIPS)
upload: $(MODELS_ZIPS) $(MODELS_OPTIMIZED_ZIPS)
	@$(foreach target, $^, \
		echo "Uploading $(target)"; \
		curl --progress-bar --user 'upload:${UPLOAD_PASSWORD}' -T $(target) https://thirdparty-dl.lugbench.eu/models/$(target) | tee /dev/null; \
	)

%.zip: %
	@echo zipping $^ to $@
	$(eval tmp = $(shell mktemp -d))
	cp -Ra $^/. $(tmp)
	[ -x $(tmp)/optimize.sh ] && cd $(tmp) && rm optimize.sh || true
	cd $(tmp) && zip -r $(abspath $@) *

%_optimized.zip: %
	@echo zipping $^ to $@
	$(eval tmp = $(shell mktemp -d))
	cp -Ra $^/. $(tmp)
	[ -x $(tmp)/optimize.sh ] && cd $(tmp) && ./optimize.sh && rm optimize.sh || true
	python3 ./json_minifier.py $(tmp)/*.gltf
	cd $(tmp) && zip -r $(abspath $@) *


clean:
	rm *.zip

.PHONY: clean all upload
