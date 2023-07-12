(define-module (hello)
  #:use-module (srfi srfi-19)
  #:use-module (system foreign)
  #:export (main))
;;
;; Using https://hyper.dev/blog/2018/gnu-guile-ffi/:
;;
;;   Copyright © Amirouche
;;   Amazigh BOUBEKKI, and contributors (2012-2022).
;;
;;   Permission is hereby granted, free of charge, to any person obtaining a copy
;;   of this software and associated documentation files (the "Software"), to
;;   deal in the Software without restriction, including without limitation the
;;   rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
;;   sell copies of the Software, and to permit persons to whom the Software is
;;   furnished to do so, subject to the following conditions:
;;
;;   The above copyright notice and this permission notice shall be included in
;;   all copies or substantial portions of the Software.
;;
;;   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;;   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;;   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
;;   IN THE SOFTWARE.
;;
(define* (dynamic-link* #:optional library-name)
	 (let ((shared-object (if library-name (dynamic-link library-name)
				(dynamic-link))))
	   (lambda (return-value function-name . arguments)
	     (let ((function (dynamic-func function-name shared-object)))
	       (pointer->procedure return-value function arguments)))))

(define FFI (dynamic-link* "./newplus/libnewplus.so"))
(define plusone (FFI int "plusone" int))

(define* (hello #:optional (count 2000000000))
	 (let ((start (current-time)))
	   (let loop ((x 0)
		      (count count))
	     (if (< x count)
	       (loop (plusone x) count)))
	   (time-nanosecond (time-difference (current-time) start))))

(define* (main #:rest args)
	 (map display
	      (list (apply hello args) "\n")))
