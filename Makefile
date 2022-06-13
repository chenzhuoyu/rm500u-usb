obj-m  := option.o
KERNEL := $(shell uname -r)

.PHONY: all clean install

all: option.ko

clean:
	make -C /lib/modules/${KERNEL}/build M=${PWD} clean

install: option.ko
	cp option.ko /lib/modules/${KERNEL}/kernel/drivers/usb/serial/

option.ko:
	make -C /lib/modules/${KERNEL}/build M=${PWD} modules

