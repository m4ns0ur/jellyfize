# Application name
APP_NAME := jellyfize

# Build output directories
BUILD_DIR := build

# Compiler options
LDFLAGS := -ldflags="-s -w"  # Strip debugging information and symbol tables to reduce binary size

# Targets
.PHONY: all

all: clean build_linux build_mac build_mac_arm build_windows

# Clean build directory
clean:
	rm -rf $(BUILD_DIR)

# Build for Linux
build_linux:
	GOARCH=amd64 GOOS=linux go build $(LDFLAGS) -o $(BUILD_DIR)/$(APP_NAME)_linux

# Build for macOS
build_mac:
	GOARCH=amd64 GOOS=darwin go build $(LDFLAGS) -o $(BUILD_DIR)/$(APP_NAME)_mac

# Build for macOS ARM
build_mac_arm:
	GOARCH=arm64 GOOS=darwin go build $(LDFLAGS) -o $(BUILD_DIR)/$(APP_NAME)_mac_arm

# Build for Windows
build_windows:
	GOARCH=amd64 GOOS=windows go build $(LDFLAGS) -o $(BUILD_DIR)/$(APP_NAME)_windows.exe
