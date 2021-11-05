;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex4.4.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (tax amount)
  (cond [(<= amount 240) 0]
        [(and (< 240 amount) (< amount 480)) 15]
        [else 28]))

(define (netpay hours)
  (- (* 12 hours) (tax (* 12 hours))))