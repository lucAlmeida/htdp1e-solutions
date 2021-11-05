;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex9.5.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; check-range1 : list-of-number -> boolean
;; determines whether all measurements are between 5ºC and 95ºC

(define (check-range1 lon)
  (cond [(empty? lon) true]
        [else
         (and (and (>= (first lon) 5) (<= (first lon) 95)) (check-range1 (rest lon)))]))

;; check-range2 : list-of-number number number -> boolean
;; determines whether all measurements are between lower and upper

(define (check-range2 lon lower upper)
  (cond [(empty? lon) true]
        [else
         (and (and (>= (first lon) lower) (<= (first lon) upper)) (check-range2 (rest lon) lower upper))]))