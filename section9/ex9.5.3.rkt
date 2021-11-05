;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex9.5.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; dollar-store? : list-of-numbers -> boolean
;; checks whether all of the prices are below 1

(define (dollar-store? lon)
  (cond [(empty? lon) true]
        [else (and (< (first lon) 1) (dollar-store? (rest lon)))]))

;; dollar-store-2? : list-of-numbers -> boolean
;; checks whether all of the prices are below the threshold

(define (dollar-store-2? lon threshold)
  (cond [(empty? lon) true]
        [else (and (< (first lon) threshold) (dollar-store-2? (rest lon) threshold))]))