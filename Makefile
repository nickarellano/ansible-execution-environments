BASE_VERSION ?= supported # [ supported, 29, minimal ]
CONTAINER_NAME ?= routeros-ee-$(BASE_VERSION)
CONTAINER_TAG ?= 1.0.0

.PHONY: lint
lint: # Lint the repository with yaml-lint
	yaml-lint .

.PHONY: build
build: # Build the execution environment image
	ansible-builder build \
		--build-arg EE_BASE_IMAGE=registry.redhat.io/ansible-automation-platform-21/ee-$(BASE_VERSION)-rhel8 \
		--tag $(CONTAINER_NAME):$(CONTAINER_TAG) \
		--container-runtime podman
