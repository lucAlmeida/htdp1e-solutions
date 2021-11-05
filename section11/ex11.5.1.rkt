;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex11.5.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; add : N N -> N
;; add two natural numbers
(check-expect (add 3 2) 5)
(check-expect (add 0 5) 5)
(check-expect (add 2 5) 7)

(define (add n m)
  (cond [(zero? n) m]
        [else (add1 (add (sub1 n) m))]))