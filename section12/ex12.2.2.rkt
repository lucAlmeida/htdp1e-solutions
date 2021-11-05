;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex12.2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; search : number list-of-numbers -> boolean
(define (search n alon)
  (cond [(empty? alon) false]
        [else (or (= (first alon) n) (search n (rest alon)))]))

;; search-sorted : number list-of-numbers -> boolean
;; searches an element in a list assumed to be sorted in descending order
(check-expect (search-sorted 5 '(9 7 4 2 1)) false)
(check-expect (search-sorted 5 '(10 9 5 2)) true)

(define (search-sorted n alon)
  (cond [(or (empty? alon) (< (first alon) n)) false]
        [else (or (= (first alon) n) (search n (rest alon)))]))