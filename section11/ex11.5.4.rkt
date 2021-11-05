;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex11.5.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A deep-list is either
;; 1. s where s is some symbol or
;; 2. (cons dl empty), where dl is a deep list

;; addDL : deep-list deep-list -> deep-list
;; adds two deep list representing natural numbers
(check-expect (addDL empty empty) empty)
(check-expect (addDL (cons 'a empty) empty) (cons 'a empty))
(check-expect (addDL empty (cons 'a empty)) (cons 'a empty))
(check-expect (addDL (cons 'a empty) (cons (cons 'a empty) empty))
              (cons (cons (cons 'a empty) empty) empty))

(define (addDL n m)
  (cond [(empty? n) m]
        [(empty? m) n]
        [(symbol? n) (cons n empty)]
        [else (addDL (rest n) (cons m empty))]))

;; depth : deep-list -> N
;; determines how many conses were used for constructing dl
(check-expect (depth 'a) 0)
(check-expect (depth (cons 'a empty)) 1)
(check-expect (depth (cons (cons 'a empty) empty)) 2)
(check-expect (depth (cons (cons (cons 'a empty) empty) empty)) 3)

(define (depth dl)
  (cond [(symbol? dl) 0]
        [else (add1 (depth (first dl)))]))

;; make-deep : symbol N -> deep-list
;; produces a deep list containing s and constructed with n conses
(check-expect (make-deep 'a 0) 'a)
(check-expect (make-deep 'a 1) (cons 'a empty))
(check-expect (make-deep 'a 2) (cons (cons 'a empty) empty))
(check-expect (make-deep 'a 3) (cons (cons (cons 'a empty) empty) empty))

(define (make-deep s n)
  (cond [(zero? n) s]
        [else (cons (make-deep s (sub1 n)) empty)]))