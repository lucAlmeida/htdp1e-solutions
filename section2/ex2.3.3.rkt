#lang racket

(define (total-profit attendees)
  (- (* attendees 5) (+ 20 (* attendees 0.5))))