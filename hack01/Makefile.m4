include(docm4.m4)dnl
DOCM4_HASH_HEAD_NOTICE([Makefile],[Make script])

init: all 

UPDATE_MAKEFILE

##
## Relevant rules
##

all:

.PHONY: clean

clean :

#
# Programming exercise
#


EXPORT_FILES  = check.sh docrypt encrypt libauth.so.md5 test.cry sample.cry
EXPORT_FILES += Makefile README credentials.cry   docrypt.md5   libauth.so   libmylib.so 
EXPORT_FILES += README ../../tools/COPYING 


DOCM4_EXPORT(hack01,0.1.0)

dnl
dnl Uncomment to include bintools
dnl
dnl
dnl DOCM4_MAKE_BINTOOLS

