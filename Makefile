CHART_DIR ?=
DEST_DIR ?= ./artifacts
CHARTS = pihole-ha syncthing

charts-all: $(CHARTS)

$(DEST_DIR):
	@mkdir -p $(DEST_DIR)

$(CHARTS): $(DEST_DIR)
	helm package charts/$@ -d $(DEST_DIR)

package: $(DEST_DIR)
	helm package $(CHART_DIR) -d $(DEST_DIR)

release:
	cr upload -o alzabo -r helm-charts -t $$TOKEN -p $(DEST_DIR)

# the index recipe may not be entirely correct
index:
	cr index -o alzabo -r helm-charts -c https://alzabo.github.io/helm-charts/ -i ./index.yaml -p $(DEST_DIR)

