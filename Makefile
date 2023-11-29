# Define paths and directories
TEST_EXECUTABLE_PATH = $(CURDIR)/$(BUILD_DIR)/example_test # Rename test executable
BUILD_DIR := build

# Run all tests
.PHONY: test
test: $(TEST_EXECUTABLE_PATH)
	$(TEST_EXECUTABLE_PATH)

# Delete tests related files
.PHONY: test/clean
test/clean:
	$(RM) -r $(CURDIR)/$(BUILD_DIR)

# Rule for creating the test executable
.PHONY: $(TEST_EXECUTABLE_PATH)
$(TEST_EXECUTABLE_PATH): $(CURDIR)/$(BUILD_DIR)
	cmake --build $(CURDIR)/$(BUILD_DIR)

# Rule for setting up the build directory
.PHONY: $(CURDIR)/$(BUILD_DIR)
$(CURDIR)/$(BUILD_DIR):
	cmake -S $(CURDIR) -B $(CURDIR)/$(BUILD_DIR)

