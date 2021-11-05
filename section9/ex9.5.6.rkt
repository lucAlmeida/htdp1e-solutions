;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex9.5.6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; delta : list-of-number list-of-number -> list-of-number
;; produce the difference between the inventory at two moments in time

(check-expect (delta '(3 6 8) '(2 4 5)) '(1 2 3))
(define (delta beginning end)
  (cond [(or (empty? beginning) (empty? end)) '()]
        [else
         (cons (- (first beginning) (first end))
               (delta (rest beginning) (rest end)))]))