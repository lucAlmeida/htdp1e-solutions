;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex11.2.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; repeat : N symbol -> list-of-symbols
;; to create a list of n copies of given symbol
(check-expect (repeat 3 'abc) (cons 'abc (cons 'abc (cons 'abc empty))))

(define (repeat n s)
  (cond [(zero? n) empty]
        [else (cons s (repeat (sub1 n) s))]))