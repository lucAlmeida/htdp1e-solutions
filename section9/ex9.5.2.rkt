;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex9.5.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; how-many-symbols : list-of-symbols -> number
;; produce the number of symbols on the given list

(define (how-many-symbols los)
  (cond [(empty? los) 0]
        [else (+ 1 (how-many-symbols (rest los)))]))

;; how-many-numbers : list-of-numbers -> number
;; produce the number of items on the given list of numbers

(define (how-many-numbers lon)
  (cond [(empty? lon) 0]
        [(number? (first lon)) (+ 1 (how-many-numbers (rest lon)))]
        [else (how-many-numbers (rest lon))]))