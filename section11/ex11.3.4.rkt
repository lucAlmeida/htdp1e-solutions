;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex11.3.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; create-prices : N -> list-of-number
;; produce n prices between $ .10 and $ 10.00 with increments of a dime

(define (create-prices n)
  (cond [(zero? n) empty]
        [else (cons (* n .10) (create-prices (sub1 n)))]))