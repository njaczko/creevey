PROJECT := creevey.xcodeproj
SCHEME := Phoenix Slides
CONFIGURATION ?= Debug
DERIVED_DATA := $(CURDIR)/build
APP := $(DERIVED_DATA)/Build/Products/$(CONFIGURATION)/Phoenix Slides.app
DEVELOPER_DIR ?= /Applications/Xcode.app/Contents/Developer

.PHONY: build run clean

build:
	DEVELOPER_DIR="$(DEVELOPER_DIR)" xcodebuild -project "$(PROJECT)" -scheme "$(SCHEME)" \
		-configuration "$(CONFIGURATION)" -derivedDataPath "$(DERIVED_DATA)" \
		CODE_SIGNING_ALLOWED=NO build

run: build
	open "$(APP)"

clean:
	DEVELOPER_DIR="$(DEVELOPER_DIR)" xcodebuild -project "$(PROJECT)" -scheme "$(SCHEME)" \
		-derivedDataPath "$(DERIVED_DATA)" clean
