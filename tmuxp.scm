(define-module (tmuxp)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages check)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages tmux)
  #:use-module (gnu packages python-xyz))

(define-public python-libtmux-0.14.2
  (package
    (name "python-libtmux")
    (version "0.14.2")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "libtmux" version))
       (sha256
        (base32
         "0j4a7xvzhqi1ybf5jgmvraw4c3axbkqndz6fm7560kww26539viq"))))
    (build-system python-build-system)
    (arguments
     '(#:tests? #f))
    (home-page
     "https://github.com/tmux-python/libtmux")
    (synopsis "scripting library / orm for tmux")
    (description "scripting library / orm for tmux")
    (license license:expat)))

(define-public python-pyyaml-5.4.1
  (package
    (inherit python-pyyaml)
    (version "5.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "PyYAML" version))
       (sha256
        (base32
         "0pm440pmpvgv5rbbnm8hk4qga5a292kvlm1bh3x2nwr8pb5p8xv0"))))))

(define-public python-kaptan
  (package
    (name "python-kaptan")
    (version "0.5.12")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "kaptan" version))
       (sha256
        (base32
         "1lix7hafsqdpdmiyihykymb1x9bp2s02ik0smzjzq8hlfdb1zg8s"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-pyyaml" ,python-pyyaml-5.4.1)))
    (arguments
     '(#:tests? #f))
    (home-page "https://github.com/emre/kaptan")
    (synopsis "Configuration manager")
    (description "Configuration manager")
    (license license:bsd-3)))

(define-public python-tmuxp
  (package
   (name "python-tmuxp")
    (version "1.13.1")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "tmuxp" version))
     (sha256
      (base32
                "0l6bsjz5x0bcssrj1y0rf559d50xrw5zkdblghyzk509aags3sj1"))))
   (build-system python-build-system)
   (arguments
    '(#:tests? #f))
   (propagated-inputs
    `(("python-click" ,python-click)
      ("python-colorama" ,python-colorama)
      ("python-kaptan" ,python-kaptan)
      ("python-libtmux" ,python-libtmux-0.14.2)))
   (home-page
    "https://github.com/tmux-python/tmuxp")
   (synopsis "tmux session manager")
   (description "tmux session manager")
   (license license:expat)))
;; python-tmuxp ;; ?? commenter apr??s test
