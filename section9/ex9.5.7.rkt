;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex9.5.7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; sum : list-of-number -> number
;; computes the sum of all numbers in given list
(check-expect (sum '(1 2 3 4)) 10)
(define (sum lon)
  (cond [(empty? lon) 0]
        [else (+ (first lon) (sum (rest lon)))]))

;; count : list-of-number -> number
;; determines how many numbers are on the given list
(check-expect (count '(1 2 3 4)) 4)
(define (count lon)
  (cond [(empty? lon) 0]
        [else (+ 1 (count (rest lon)))]))

;; average-price : list-of-number -> number
;; computes the average of the given toy prices

(define (average-price lon)
  (/ (sum lon) (count lon)))

;; checked-average-price : list-of-number -> number
;; computes the average of the given toy prices
;; signals error if toy list is empty

(define (checked-average-price lon)
  (cond [(empty? lon) (error "Empty toy list not allowed!")]
        [else (average-price lon)]))