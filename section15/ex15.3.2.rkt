;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex15.3.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct wp (header body))

;; A Web-page (short: WP) is a structure:
;; (make-wp h p)
;; where h is a symbol and p is a (Web) document

;; A (Web) document is either:
;; 1. empty,
;; 2. (cons s p)
;;    where s is a symbol and p is a document
;; 3. (cons w p)
;;    where w is a Web page and p is a document

(define WP0 (make-wp 'top empty))
(define WP1 (make-wp 'top
                     (cons 'a (cons 'b empty))))
(define WP2 (make-wp 'top
                     (cons 'a (cons (make-wp 'inner (cons 'b empty)) empty))))
(define WP3 (make-wp 'top
                     (cons 'a (cons (make-wp 'inner (cons 'b empty)) (cons 'c empty)))))
(define WP4 (make-wp 'top
                     (cons (make-wp 'inner empty)
                           (cons 'b
                                 (cons 'c empty)))))
(define WP5 (make-wp 'top
                     (cons (make-wp 'inner (cons (make-wp 'new empty) empty))
                           (cons 'b
                                 (cons 'c empty)))))

;; wp-to-file : wp -> los
;; produce a list containing all symbols in a body and headers of embedded WPs
(check-expect (wp-to-file WP0) empty)
(check-expect (wp-to-file WP1) (cons 'a (cons 'b empty)))
(check-expect (wp-to-file WP2) (cons 'a (cons 'inner empty)))
(check-expect (wp-to-file WP3) (cons 'a (cons 'inner (cons 'c empty))))
(check-expect (wp-to-file WP4) (cons 'inner (cons 'b (cons 'c empty))))
(check-expect (wp-to-file WP5) (cons 'inner (cons 'b (cons 'c empty))))

(define (wp-to-file wp)
  (construct-file (wp-body wp)))

(define (construct-file wd)
  (cond ((empty? wd) empty)
        ((symbol? (first wd)) (cons (first wd)
                                    (construct-file (rest wd))))
        (else (cons (wp-header (first wd))
                    (construct-file (rest wd))))))
