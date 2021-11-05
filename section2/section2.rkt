#lang racket

(define (area-of-disk r)
  (* 3.14 (* r r)))

(define (area-of-ring outer inner)
  (- (area-of-disk outer)
     (area-of-disk inner)))

(define (Fahrenheit->Celsius f)
  (/ (* (- f 32) 5) 9))

(define (dollar->euro d)
  (* d 0.84))

(define (triangle b h)
  (* (/ 1 2) b h))

(define (convert3 a b c)
  (+ (* c 100) (* b 10) a))

(define (f n)
  (+ (/ n 3) 2))

(define (f1 n)
  (+ (sqr n) 10))

(define (f2 n)
  (+ (* 0.5 (sqr n)) 20))

(define (f3 n)
  (- 2 (/ 1.0 n)))

(define (wage h)
  (* 12 h))