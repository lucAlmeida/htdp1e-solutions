;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname section7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A pixel-2 is either
;; 1. a number, or
;; 2. a posn structure

;; distance-to-0 : pixel-2 -> number
;; to compute the distance of a-pixel to the origin
(define (distance-to-0 a-pixel)
  (cond [(number? a-pixel) a-pixel]
        [(posn? a-pixel) (sqrt (+ (sqr (posn-x a-pixel))
                                  (sqr (posn-y a-pixel))))]))

;; A shape is either
;; 1. a circle structure:
;;    (make-circle p s)
;;    where p is a posn and s is a number; or
(define-struct circle (center radius))
;; 2. a square structure:
;;    (make-square p s)
;;    where p is a posn and s is a number
(define-struct square (nw length))

;; perimeter : shape -> number
;; to compute the perimeter of a-shape
#;
(define (perimeter a-shape)
  (cond [(square? a-shape)
         ... (square-nw a-shape) ... (square-length a-shape) ...]
        [(circle? a-shape)
         ... (circle-center a-shape) ... (circle-radius a-shape) ...]))

(define (perimeter a-shape)
  (cond [(square? a-shape) (* (square-length a-shape) 4)]
        [(circle? a-shape) (* (* 2 (circle-radius a-shape)) pi)]))

;; area : shape -> number
;; to compute the area of a-shape
#;
(define (area a-shape)
  (cond [(square? a-shape)
         ... (square-nw a-shape) ... (square-length a-shape) ...]
        [(circle? a-shape)
         ... (circle-center a-shape) ... (circle-radius a-shape) ...]))

(define (area a-shape)
  (cond [(square? a-shape)
         (* (square-length a-shape) (square-length a-shape))]
        [(circle? a-shape)
         (* pi (circle-radius a-shape) (circle-radius a-shape))]))