;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex11.5.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;; add-pi : number -> number
;; adds pi to the given number
(define (add-pi n)
  (+ 3.14 n))

;; multiply-by-pi : N -> number
;; multiplies a number by 3.14
(check-expect (multiply-by-pi 0) 0)
(check-expect (multiply-by-pi 1) 3.14)
(check-expect (multiply-by-pi 2) 6.28)
(check-expect (multiply-by-pi 3) 9.42)

(define (multiply-by-pi n)
  (cond [(zero? n) 0]
        [else (add-pi (multiply-by-pi (sub1 n)))]))