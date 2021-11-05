;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex15.3.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;; size : wp -> number
;; produce the number of symbols contained in the web page
(check-expect (size WP0) 0)
(check-expect (size WP1) 2)
(check-expect (size WP3) 3)
(check-expect (size WP4) 2)

(define (size wp)
  (count-document (wp-body wp)))

;; count-document : wd -> number
;; produce the number of symbols contained in the document
(check-expect (count-document (wp-body WP0)) 0)
(check-expect (count-document (wp-body WP1)) 2)
(check-expect (count-document (wp-body WP2)) 2)
(check-expect (count-document (wp-body WP3)) 3)
(check-expect (count-document (wp-body WP4)) 2)

(define (count-document wd)
  (cond ((empty? wd) 0)
        ((symbol? (first wd)) (+ 1 (count-document (rest wd))))
        (else (+ (size (first wd)) (count-document (rest wd))))))
