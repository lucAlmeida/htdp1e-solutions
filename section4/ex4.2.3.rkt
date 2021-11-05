;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex4.2.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; equation1 : number -> number
;; to determine whether x is a solution for x² + 2 * x + 1 = 0
(define (equation1 x)
  (= (+ (* x x) (+ (* 2 x) 1)) 0))

;; equation-a : number -> number
;; to determine whether x is a solution for 4 * x + 2 = 62
(define (equation-a x)
  (= (+ (* 4 x) 2) 62))

;; equation-b : number -> number
;; to determine whether x is a solution for 2 * x² = 102
(define (equation-b x)
  (= (* 2 (* x x)) 102))

;; equation-c : number -> number
;; to determine whether x is a solution for 4 * x² + 6 * x + 2 = 462
(define (equation-c x)
  (= (+ (* 4 (* x x)) (* 6 x) 2) 462))
