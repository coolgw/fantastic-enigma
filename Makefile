LD=ld

%.o:%.s

all: final.img

final.img: bootsect
	mv bootsect final.img

clean:
	rm -rf final.img bootsect.o

bootsect: bootsect.o
	${LD} --oformat binary -N -e start -Ttext 0x7c00 -o bootsect $<
	#${LD} --oformat binary -N -e start -Ttext 0x7c03 -o bootsect $< #ld will modify some area for 0x7c03

run: final.img
	qemu-system-x86_64 -d cpu_reset -cpu 486 -fda $< -net none -no-kvm -monitor stdio -serial pty


