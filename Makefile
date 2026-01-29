CC      := clang
QEMU    := qemu-riscv64

SRC     := src/main.c
BUILD   := build
TARGET  := $(BUILD)/main

CFLAGS  := \
	--target=riscv64-linux-gnu \
	-march=rv64gcv \
	-mabi=lp64d \
	-static

all: $(TARGET)

$(TARGET): $(SRC)
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) $< -o $@

run: $(TARGET)
	$(QEMU) $(TARGET)

clean:
	rm -rf $(BUILD)

.PHONY: all run clean
