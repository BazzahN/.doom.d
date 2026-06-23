;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-vivendi)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory "~/WORK_Local/org/")
(setq org-roam-directory (file-truename "~/org-roam"))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!'i for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;;Recommended by doctor
;(setq shell-file-name (executable-find "bash"))
;(setq-default vterm-shel "C:/Users/newtonh3/scoop/apps/emacs/current/libexec/emacs/30.2/x86_64-w64-mingw32/cmdproxy.exe")
;(setq-default explicit-shell-file-name "C:/Users/newtonh3/scoop/apps/emacs/current/libexec/emacs/30.2/x86_64-w64-mingw32/cmdproxy.exe")

;; Registers
(set-register ?i '(file . "~/.doom.d/config.el"))
(set-register ?t '(file . "c:/Users/newtonh3/WORK_Local/org/todo_gen.org"))
(set-register ?s '(file . "c:/Users/newtonh3/WORK_Local/org/supervisor_meetings.org"))


;;Important key bindings
(map! "C-x C-e" #'elfeed)

(map! :map org-mode-map
      "C-c d" #'org-cdlatex-mode
      "$" #'math-delimiters-insert)



;; Org Mode Config
(after! org
  (setq org-todo-keywords
        '((sequence "TODO" "UNSCHEDULED" "IN-PROGRESS" "LOI" "DONE")))
  (setopt org-tag-alist '(("@PhD" . ?p) ("@admin" . ?a) ("@home" . ?h) ("@emacs" . ?e) ("@Meeting" . ?m) ("@Book" . ?b)))
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "C:/Users/newtonh3/WORK_Local/org/todo_gen.org" "Tasks")
         "* TODO %?\n %U\n %i\n")
        ("j" "Journal" entry (file+olp+datetree "C:/Users/newtonh3/WORK_Local/org/journal.org")
         "* %?\nEntered on %U\n %i\n")
	("s" "svisor meetings" entry (file+olp+datetree "C:/Users/newtonh3/WORK_Local/org/supervisor_meetings.org")
         "**** %?\n %U")
	("n" "Note" entry (file+headline "C:/Users/newtonh3/WORK_Local/org/todo_gen.org" "Notes")
         "* %? %^G\n%U" :empty-lines 1)
	("m" "Manual Cookbook" entry (file "C:/Users/newtonh3/WORK_Local/org/recipes.org")
         "* %^{Recipe title: }\n  :PROPERTIES:\n  :source-url:\n  :servings:\n  :prep-time:\n  :cook-time:\n  :ready-in:\n  :END:\n** Ingredients\n   %?\n** Directions\n\n"))))

(after! org-appear
  (setq org-appear-inside-latex t)
  (setq org-appear-autosubmarkers t)
  )

;; (after! server
;;   (unless (server-running-p)
;;     (server-start)))

(after! tex
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-start-server t)
  (add-to-list
   'TeX-view-program-list
   '("Sioyek"
     "sioyek.exe --reuse-window \
      --forward-search-file %b \
      --forward-search-line %n \
      %o"))

  (setq TeX-view-program-selection
        '((output-pdf "Sioyek"))))


;;Org Roam included
(after! flyspell
  (setopt ispell-program-name "C:/Users/newtonh3/scoop/apps/aspell/0.60.8.2-1/bin/aspell.exe"))

;;Set references path
(after! citar
  (setopt citar-bibliography '("C:/Users/newtonh3/WORK_Local/org/my_library.bib")) )


;; Smudge
;; (use-package! smudge
;;   :bind-keymap ("C-c ." . smudge-command-map)
;;   :custom
;;   (smudge-oauth2-client-secret "727aac0d7fbe452b9794962088cbfba9")
;;   (smudge-oauth2-client-id "381409a08fad49c8b9be8ce47df884bf")
;;   ;; optional: enable transient map for frequent commands
;;   (smudge-player-use-transient-map t)
;;   :config
;;   ;; optional: display current song in mode line
;;   (global-smudge-remote-mode))
;; (setopt smudge-transport 'connect)
