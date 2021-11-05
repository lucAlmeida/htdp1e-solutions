;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex15.3.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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
(define WP6 (make-wp 'top
                     (cons (make-wp 'inner (cons (make-wp 'new (cons 'z empty)) empty))
                           (cons 'b
                                 (cons 'c empty)))))

;; find :: wp symbol -> (boolean | los)
;; produce false if symbol is not in body of page or its embedded WPs.
;; produce list of headers on the way to the symbol if present
(check-expect (find WP0 'a) false)
(check-expect (find WP1 'a) (cons 'top empty))
(check-expect (find WP1 'b) (cons 'top empty))
(check-expect (find WP2 'a) (cons 'top empty))
(check-expect (find WP2 'b) (cons 'top (cons 'inner empty)))
(check-expect (find WP3 'a) (cons 'top empty))
(check-expect (find WP3 'b) (cons 'top (cons 'inner empty)))
(check-expect (find WP3 'c) (cons 'top empty))
(check-expect (find WP4 'b) (cons 'top empty))
(check-expect (find WP4 'c) (cons 'top empty))
(check-expect (find WP4 'z) false)
(check-expect (find WP5 'b) (cons 'top empty))
(check-expect (find WP5 'c) (cons 'top empty))
(check-expect (find WP5 'z) false)
(check-expect (find WP6 'b) (cons 'top empty))
(check-expect (find WP6 'c) (cons 'top empty))
(check-expect (find WP6 'z) (cons 'top (cons 'inner (cons 'new empty))))

(define (find wp s)
  (cond ((empty? (wp-body wp)) false)
        ((and (symbol? (first (wp-body wp)))
              (symbol=? (first (wp-body wp)) s))
         (cons (wp-header wp) empty))
        ((and (wp? (first (wp-body wp)))
              (not (boolean? (find (first (wp-body wp)) s))))
         (cons (wp-header wp) (find (first (wp-body wp)) s)))
        (else (find (make-wp (wp-header wp) (rest (wp-body wp))) s))))