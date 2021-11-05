;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex11.3.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; create-temps : N integer integer -> list-of-integer
;; produce a list of n integers that are between low and high

(define (create-temps n low high)
  (cond [(zero? n) empty]
        [(= low high) (cons high empty)]
        [else (cons low (create-temps (sub1 n) (add1 low) high))]))
