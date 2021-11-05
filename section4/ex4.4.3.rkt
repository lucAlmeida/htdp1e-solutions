;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex4.4.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (pay-back charge)
  (cond [(<= charge 500) (* charge 0.0025)]
        [(and (< 500 charge) (<= charge 1500)) (* charge 0.0050)]
        [(and (< 1500 charge) (<= charge 2500)) (* charge 0.0075)]
        [else (* charge 0.01)]))