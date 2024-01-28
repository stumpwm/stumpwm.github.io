(require 'org)
(setq org-html-metadata-timestamp-format "%m/%d/%Y"
      org-publish-project-alist
      '(("stumpwm-orgfiles"
	 :base-directory "~/stumpwm.github.io/"
	 :base-extension "org"
	 :publishing-directory "~/stumpwm.github.io/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 3
	 :auto-preamble t
	 :section-numbers nil
	 :table-of-contents nil
	 :style-include-default nil
	 :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\" />"
	 :html-preamble t
	 :html-postamble "")
	("stumpwm-website" :components ("stumpwm-orgfiles"))))
