;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex7.1.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct star (last first dob ssn))

(define-struct airplane (kind max-speed max-load price))

(number? (make-posn 2 3))
(number? (+ 12 10))
(posn? 23)
(posn? (make-posn 23 3))
(star? (make-posn 23 3))