;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex4.2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; in-interval-1? : number -> number
;; to determine whether n is between -3 and 0 (exclusive)
(define (in-interval-1? x)
  (and (< -3 x) (< x 0)))

;; in-interval-2? : number -> number
;; to determine whether n is less than 1 or greater than 2
(define (in-interval-2? x)
  (or (< x 1) (> x 2)))

;; in-interval-3? : number -> number
;; to determine whether n is not between 1 and 5 (inclusive)
(define (in-interval-3? x)
  (not (and (<= 1 x) (<= x 5))))
