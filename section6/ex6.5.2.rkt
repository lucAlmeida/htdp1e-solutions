;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex6.5.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A point-in-time is:
;; (make-point-in-time hours minutes seconds)
;; where hours, minutes and seconds are numberss
(define-struct point-in-time (hours minutes seconds))

(define (time->seconds point-in-time)
  (+ (* 3600 (point-in-time-hours point-in-time))
     (* 60 (point-in-time-minutes point-in-time))
     (point-in-time-seconds point-in-time)))