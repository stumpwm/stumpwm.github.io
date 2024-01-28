.PHONY: all website clean publish
all: publish
website:
	emacs --load ./stumpwm-site.el --batch --eval '(org-publish "stumpwm-website")'
website-force: research-log.el
	emacs --load ./stumpwm-site.el --batch --eval '(org-publish "stumpwm-website" t)'
publish: website
	git commit -a -m "Automated commit from makefile"
	git push origin
