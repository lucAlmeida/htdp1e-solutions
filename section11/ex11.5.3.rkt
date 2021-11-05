;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex11.5.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; add : N N -> N
;; add two natural numbers
(check-expect (add 3 2) 5)
(check-expect (add 0 5) 5)
(check-expect (add 2 5) 7)

(define (add n m)
  (cond [(zero? n) m]
        [else (add1 (add (sub1 n) m))]))

;; multiply : N N -> N
;; multiplies two natural numbers
(check-expect (multiply 3 2) 6)
(check-expect (multiply 0 5) 0)
(check-expect (multiply 2 5) 10)

(define (multiply n x)
  (cond [(zero? n) 0]
        [else (add x (multiply (sub1 n) x))]))

;; exponent : N N -> N
;; raises x to the power of y
(check-expect (exponent 3 0) 1)
(check-expect (exponent 3 1) 3)
(check-expect (exponent 3 2) 9)
(check-expect (exponent 3 3) 27)

(define (exponent x y)
  (cond [(zero? y) 1]
        [else (multiply x (exponent x (sub1 y)))]))