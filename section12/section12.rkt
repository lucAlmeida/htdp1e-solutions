;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname section12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; sort : list-of-numbers -> list-of-numbers
;; to create a sorted list of numbers from all the numbers in alon
(check-expect (s0rt empty) empty)
(check-expect (s0rt (cons 1297.04 (cons 20000.00 (cons -505.25 empty))))
              (cons 20000.00 (cons 1297.04 (cons -505.25 empty))))

(define (s0rt alon)
  (cond [(empty? alon) empty]
        [else (insert (first alon) (s0rt (rest alon)))]))

;; insert : number list-of-numbers -> list-of-numbers
;; to create a list of numbers from n and the numbers on alon
;; that is sorted in descending order; alon is already sorted

(define (insert n alon)
  (cond [(empty? alon) (cons n empty)]
        [(>= n (first alon)) (cons n alon)]
        [(< n (first alon)) (cons (first alon) (insert n (rest alon)))]))