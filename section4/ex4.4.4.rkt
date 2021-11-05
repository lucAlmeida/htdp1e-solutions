;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex4.4.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (how-many a b c)
  (cond [(> (* b b) (* 4 a c)) 2]
        [(= (* b b) (* 4 a c)) 1]
        [else 0]))
