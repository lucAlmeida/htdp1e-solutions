;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname section11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; hellos : N -> list-of-symbols
;; to create a list of n copies of 'hello
(define (hellos n)
  (cond [(zero? n) empty]
        [else (cons 'hello (hellos (sub1 n)))]))

;; ! : N -> N
;; to compute the n * (n-1) * ... * 2 * 1
(define (! n)
  (cond [(zero? n) 1]
        [else (* n (! (sub1 n)))]))

;; product-from-20 : N [>= 20] -> N
;; to compute n * (n-1) * ... * 21 * 1
(define (product-from-20 n-above-20)
  (cond [(= n-above-20 20) 1]
        [else (* n-above-20 (product-from-20 (sub1 n-above-20)))]))

;; Let limit be a natural number. A natural number [>= limit](N[>=limit]) is either:
;; 1. limit or
;; 2. (add1 n) if n is a natural number [>= limit].

;; product : N[limit] N[>= limit] -> N
;; to compute n * (n-1) * ... * (limit + 1) * 1
(define (product limit n)
  (cond [(= n limit) 1]
        [else (* n (product limit (sub1 n)))]))

;; add-to-pi : N -> number
;; to compute n + 3.14 without using +
(define (add-to-pi n)
  (cond [(zero? n) 3.14]
        [else (add1 (add-to-pi (sub1 n)))]))