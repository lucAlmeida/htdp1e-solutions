;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex15.3.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;; occurs : symbol wp -> boolean
;; determines whether given symbol occurs anywhere in WP, including its embedded ones
(check-expect (occurs 'a WP0) false)
(check-expect (occurs 'b WP1) true)
(check-expect (occurs 'c WP1) false)
(check-expect (occurs 'a WP2) true)
(check-expect (occurs 'b WP2) true)
(check-expect (occurs 'z WP2) false)
(check-expect (occurs 'c WP3) true)
(check-expect (occurs 'z WP3) false)
(check-expect (occurs 'a WP4) false)
(check-expect (occurs 'b WP4) true)
(check-expect (occurs 'a WP5) false)
(check-expect (occurs 'b WP5) true)

(define (occurs s wp)
  (occurs-document s (wp-body wp)))

(define (occurs-document s wd)
  (cond ((empty? wd) false)
        ((symbol? (first wd))
         (or (symbol=? s (first wd))
             (occurs-document s (rest wd))))
        (else (or (occurs s (first wd))
                  (occurs-document s (rest wd))))))
