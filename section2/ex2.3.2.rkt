#lang racket

(define (sum-coins pennies nickels dimes quarters)
  (+ pennies (* 5 nickels) (* 10 dimes) (* 25 quarters)))