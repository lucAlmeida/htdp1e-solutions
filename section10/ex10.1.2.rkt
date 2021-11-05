;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.1.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; hours->wages : list-of-numbers -> list-of-numbers
;; to create a list of weekly wages from a list of weekly hours (alon)

(define (hours->wages alon)
  (cond
    [(empty? alon) empty]
    [(> (first alon) 100) (error "too many hours")]
    [else (cons (wage (first alon)) (hours->wages (rest alon)))]))

;; wage : number -> number
;; to compute the total wage (at $12 per hour)
;; of someone who worked for h hours

(define (wage h)
  (+ (* 12 h)))
