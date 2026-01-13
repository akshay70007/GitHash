GIT_HASH := $(shell git rev-parse --short HEAD)

CXXFLAGS += -DGIT_COMMIT_HASH=\"$(GIT_HASH)\"
