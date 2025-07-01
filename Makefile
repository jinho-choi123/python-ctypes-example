CC = g++
CFLAGS = -fPIC -Wall
LDFLAGS = -shared
BUILD_DIR = build
TARGET_NAME = libhelloworld.so
TARGET = $(BUILD_DIR)/$(TARGET_NAME)
SRCDIR = csrc
SRCS = $(wildcard $(SRCDIR)/*.cpp)
OBJS = $(patsubst $(SRCDIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))


all: $(TARGET)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(TARGET): $(OBJS) $(BUILD_DIR)
	$(CC) $(LDFLAGS) -o $@ $(OBJS)

$(BUILD_DIR)/%.o: $(SRCDIR)/%.cpp $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)
