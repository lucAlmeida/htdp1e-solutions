;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname section9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; how-many : list-of-symbols -> number
;; to determine how many symbols are on a-list-of-symbols
(define (how-many a-list-of-symbols)
  (cond [(empty? a-list-of-symbols) 0]
        [else (+ (how-many (rest a-list-of-symbols)) 1)]))

;; sum : list-of-numbers -> number
;; to compute the sum of the numbers on a-list-of-nums
(define (sum a-list-of-nums)
  (cond [(empty? a-list-of-nums) 0]
        [else (+ (first a-list-of-nums) (sum (rest a-list-of-nums)))]))