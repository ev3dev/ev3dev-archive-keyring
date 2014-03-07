build : ev3dev-archive-keyring.gpg

ev3dev-archive-keyring.gpg: ppa.lechnology.com.key
	gpg --no-default-keyring --keyring ./$@ --import $^

install: build
	install -d $(DESTDIR)/usr/share/keyrings/
	cp ev3dev-archive-keyring.gpg $(DESTDIR)/usr/share/keyrings/
	install -d $(DESTDIR)/etc/apt/trusted.gpg.d/
	cp ev3dev-archive-keyring.gpg $(DESTDIR)/etc/apt/trusted.gpg.d/

clean:
	rm -f *.gpg
	rm -f *.gpg~
