CC=gcc
FILE=sample.cry
KEY=easy

all: exploit
	$(CC) --shared -m32 exploit.o -o libexploit.so
exploit:
	$(CC) -m32 -fpic -c exploit.c

run:
	LD_PRELOAD=$(shell pwd)/libexploit.so ./docrypt $(FILE) $(KEY)

clean:
	rm exploit.o libexploit.so


