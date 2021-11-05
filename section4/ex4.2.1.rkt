;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex4.2.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; is-between-exc-3-and-7? : number -> boolean
;; to determine whether n is between 3 (exclusive) and 7
(define (is-between-exc-3-and-7? n)
  (and (> n 3) (<= n 7)))

;; is-between-3-and-7? : number -> boolean
;; to determine whether n is between 3 and 7
(define (is-between-3-and-7? n)
  (and (>= n 3) (<= n 7)))

;; is-between-3-and-exc-9? : number -> boolean
;; to determine whether n is between 3 and 9 (exclusive)
(define (is-between-3-and-exc-9? n)
  (and (>= n 3) (< n 9)))

;; is-between-1-3? : number -> boolean
;; to determine whether n is between 1 and 3
(define (is-between-1-3? n)
  (and (> n 1) (< n 3)))

;; is-between-9-11? : number -> boolean
;; to determine whether n is between 9 and 11
(define (is-between-9-11? n)
  (and (> n 9) (< n 11)))

;; is-between-0-1? : number -> boolean
;; to determine whether n is between 0 and 1
(define (is-between-0-1? n)
  (and (> n 0) (< n 1)))

;; in-union-of-1-3-and-9-11 : number -> boolean
;; to determine whether n is between 1 and 3 or 9 and 11
(define (in-union-of-1-3-and-9-11 n)
  (or (is-between-1-3? n) (is-between-9-11? n)))

;; is-between-0-1-or-over-3? : number -> boolean
;; to determine whether n is between 0 and 1 (exclusive)
;; or larger than 3
(define (is-between-0-1-or-over-3? n)
  (or (is-between-0-1? n) (>= n 3)))