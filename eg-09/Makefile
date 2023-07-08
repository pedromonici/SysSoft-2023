bin =  eg-00 eg-00a eg-01 eg-01 eg-02 eg-03 eg-04 eg-04a eg-05 eg-06 eg-07 eg-08 eg-09 # eg-10 eg-11

all: $(bin)

eg-09 : eg-09.c
	gcc -Wall -g -m32 -Wall -Wno-unused -O0 -fcf-protection=none -fno-stack-protector -mpreferred-stack-boundary=2 -fno-pie -fno-pic -z execstack -Wno-deprecated-declarations --ansi -no-pie $<  -o $@

eg-09.in : eg-09.bin eg-09.sh
	./eg-09.sh $<

eg-09.bin : eg-09.S
	as --32 $< -o $@.o
	ld -melf_i386 --oformat=binary -Ttext=0x0 $@.o -o $@

eg-09.elf : eg-09.S
	as --32 $< -o $@.o
	ld -melf_i386  $@.o -o $@

%/main: %
	objdump -m i386 --disassemble=main $< | sed  's/:\(\t.*\t\)/:    /g'

.PHONY: clean

clean :
	rm -f $(bin) *.o *.in *.bin *.elf
