;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex6.3.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct jetfighter (designation acceleration top-speed range))

(define (within-range jetfighter target-distance)
  (<= target-distance (jetfighter-range jetfighter)))

(define (reduce-range jetfighter)
  (make-jetfighter (jetfighter-designation jetfighter)
                   (jetfighter-acceleration jetfighter)
                   (jetfighter-top-speed jetfighter)
                   (* (jetfighter-range jetfighter) 0.8)))
