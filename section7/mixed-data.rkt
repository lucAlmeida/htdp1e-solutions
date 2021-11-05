;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname mixed-data) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Data Definition:
(define-struct circle (center radius))
(define-struct square (nw length))

;; A shape is either
;; 1. a structure: (make-circle p s)
;;    where p is a posn, s a number;
;; 2. a structure: (make-square p s)
;;    where p is a posn, s a number.

;; Contract, Purpose, Header:
;; perimeter : shape -> number
;; to compute the perimeter of a-shape

;; Examples: see tests

;; Template:
;; (define (f a-shape)
;;   (cond
;;     [(square? a-shape)
;;     ... (square-nw a-shape) ... (square-length a-shape) ...]
;;     [(circle? a-shape)
;;     ... (circle-center a-shape) ... (circle-radius a-shape) ...]))

;; Definition:
(define (perimeter a-shape)
  (cond [(circle? a-shape)
         (* (* 2 (circle-radius a-shape)) pi)]
        [(square? a-shape)
         (* (square-length a-shape) 4)]))

;; Tests: (same as examples)
(= (perimeter (make-square 0 3)) 12)
(= (perimeter (make-circle 0 1)) (* 2 pi))