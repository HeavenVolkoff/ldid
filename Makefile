INSTALLPREFIX  ?= /usr/local

INCLUDES += -isystem libplist/include

CFLAGS += -O2 -fPIC
CFLAGS += $(INCLUDES)
CFLAGS += -Wall
CFLAGS += -Wno-strict-aliasing
CFLAGS += -DPACKAGE_VERSION='"2.6.0"'

CXXFLAGS += -O2 -fPIC
CXXFLAGS += $(INCLUDES)
CXXFLAGS += -Wall
CXXFLAGS += -Wno-sign-compare
CXXFLAGS += -Wno-deprecated-declarations
CXXFLAGS += -Wno-unused-function

LDID_OBJS += ldid.cpp.o lookup2.c.o

LDFLAGS = -Llibplist/src/.libs -lcrypto -pthread -lplist-2.0

.PHONY: all clean

all: ldid

%.c.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $^ -I.

%.cpp.o: %.cpp
	$(CXX) $(CXXFLAGS) -std=c++0x -o $@ -c $^ -I.

ldid: $(LDID_OBJS)
	$(CXX) $(CFLAGS) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(LDID_OBJS)

install: all
	mkdir -p $(INSTALLPREFIX)/bin
	cp ldid $(INSTALLPREFIX)/bin
