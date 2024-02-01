.PHONY: all website clean publish
all: publish
website:
	emacs --load ./stumpwm-site.el --batch --eval '(org-publish "stumpwm-website")'
git-manual:
	-git clone https://github.com/stumpwm/stumpwm.git
	cd stumpwm && autoconf && ./configure
	make -C stumpwm stumpwm.texi
	make -C stumpwm stumpwm.info
	-rm -rf git
	mkdir git
	cp stumpwm/stumpwm.info git/stumpwm-git.info
	texi2html --css-ref="../style.css" --split=node --output=git/ stumpwm/stumpwm.texi
	texi2pdf -c stumpwm/stumpwm.texi -o git/stumpwm-git.pdf
	git add git/
	git commit -a -m "Automated stumpwm manual commita for git directory."
	rm -rf stumpwm

website-force: 
	emacs --load $< --batch --eval '(org-publish "stumpwm-website" t)'
publish: website git-manual
	git commit -a -m "Automated commit from makefile"
	git push origin
