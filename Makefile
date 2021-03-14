CHART_DIR ?=
DEST_DIR ?= ./artifacts

$(DEST_DIR):
	@mkdir -p $(DEST_DIR)

package: $(DEST_DIR)
	helm package $(CHART_DIR) -d $(DEST_DIR)

upload:
	cr upload -o alzabo -r helm-charts -t $(TOKEN) -p $(DEST_DIR)

# the index recipe may not be entirely correct
index:
	cr index -o alzabo -r helm-charts -c https://alzabo.github.io/helm-charts/ -i ./index.yaml -p $(DEST_DIR)

