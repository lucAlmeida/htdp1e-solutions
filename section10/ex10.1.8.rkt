;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.1.8) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; quadratic-roots : number number number -> symbol
;; solves quadratic equation for the given coefficients

(define (quadratic-roots a b c)
  (cond [(= a 0) 'degenerate]
        [(< (* b b) (* 4 a c)) 'none]
        [(= (* b b) (* 4 a c)) (/ (- b) (* 2 a))]
        [(> (* b b) (* 4 a c)) (cons (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
                                     (cons (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
                                           empty))]))