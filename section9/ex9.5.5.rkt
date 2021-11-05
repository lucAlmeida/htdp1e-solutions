;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex9.5.5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; convert : list-of-number -> number
;; produce the corresponding number for the given list

(define (convert lon)
  (convert-helper lon 1))

;; convert-helper : list-of-number number -> number

(define (convert-helper lon base)
  (cond [(empty? lon) 0]
        [else (+ (* (first lon) base) (convert-helper (rest lon) (* base 10)))]))

;; A Digit is Number[0, 9]

;; check-guess-for-list : list-of-digits number -> symbol
;; determine how the guess relate to the target number
(check-expect (check-guess-for-list '(1 2 3) 322) 'TooSmall)
(check-expect (check-guess-for-list '(2 2 3) 322) 'Perfect)
(check-expect (check-guess-for-list '(3 2 3) 322) 'TooLarge)

(define (check-guess-for-list guess target)
  (cond [(< (convert guess) target) 'TooSmall]
        [(> (convert guess) target) 'TooLarge]
        [else 'Perfect]))

