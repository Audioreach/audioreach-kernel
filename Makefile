AUDIO_ROOT=$(PWD)

obj-m := ipc/audio-pkt.o
obj-m += dsp/spf-core.o
obj-m += dsp/msm_audio_mem.o

EXTRA_CFLAGS += -I$(AUDIO_ROOT)/include

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(shell pwd) modules

modules_install:
	$(MAKE) INSTALL_MOD_STRIP=1 -C $(KERNEL_SRC) M=$(shell pwd) modules_install

clean:
	find ./ -iname "*.o" -delete
	find ./ -iname "*.ko" -delete
	find ./ -iname "*.mod.c" -delete
	find ./ -iname "*.mod.o" -delete
	find ./ -iname "*~" -delete
	find ./ -iname ".*.cmd" -delete
	rm -f Module.symvers
	rm -rf .tmp_versions
