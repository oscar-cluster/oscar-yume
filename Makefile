DESTDIR=
BINDIR=$(DESTDIR)/usr/bin
DATADIR=$(DESTDIR)/usr/share
MANDIR=$(DESTDIR)/usr/share/man
NAME=yume
VERSION=2.8.1

FILES := ChangeLog ptty_try yume yume-opkg-4.2.1 yume-opkg yum-repoquery3 \
		rhel4-i386.rpmlist yume.8 yume.spec Makefile rhel4-x86_64.rpmlist \
		yum-repoquery 
DEBIANFILES := debian/changelog debian/compat debian/control debian/copyright \
		debian/rules

all:

install:
	install -d -o root -g root -m 755 $(BINDIR)
	install -d -o root -g root -m 755 $(DATADIR)/$(NAME)
	install -d -o root -g root -m 755 $(MANDIR)/man8
	install -o root -g root -m 755  yume $(BINDIR)
	install -o root -g root -m 755  yume-opkg $(BINDIR)
	install -o root -g root -m 755  yum-repoquery $(BINDIR)
	install -o root -g root -m 755  ptty_try $(BINDIR)
	install -o root -g root -m 755  *.rpmlist $(DATADIR)/$(NAME)
	install -o root -g root -m 755  yume.8 $(MANDIR)/man8

dist: clean
	mkdir -p /tmp/$(NAME)-$(VERSION)/debian
	cp ${FILES} /tmp/$(NAME)-$(VERSION)
	cp ${DEBIANFILES} /tmp/$(NAME)-$(VERSION)/debian
	PWD=`pwd`
	cd /tmp; tar czf $(NAME)-$(VERSION).tar.gz $(NAME)-$(VERSION)
	mv /tmp/$(NAME)-$(VERSION).tar.gz $(PWD)

clean:
	rm -f *~
	rm -rf /tmp/$(NAME)-$(VERSION)
	rm -f $(NAME)-$(VERSION).tar.gz
