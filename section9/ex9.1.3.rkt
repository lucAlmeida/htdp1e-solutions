;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex9.1.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; distance-to-0-for-3 : list-of-3-numbers -> number
;; to compute distance of point to the origin

(define (distance-to-0-for-3 a-list-of-3-numbers)
  (sqrt (+ (sqr (first a-list-of-3-numbers))
           (sqr (first (rest a-list-of-3-numbers)))
           (sqr (first (rest (rest a-list-of-3-numbers)))))))
