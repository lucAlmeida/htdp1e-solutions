;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex4.1.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; (> x 3)

;; (> 4 3)
;; true
;; (> 2 3)
;; false
;; (> 7/2 3)
;; true

;; (and (> 4 x) (> x 3))

;; (and (> 4 4) (> 4 3))
;; (and false true)
;; false

;; (and (> 4 2) (> 2 3))
;; (and true false)
;; false

;; (and (> 4 7/2) (> 7/2 3))
;; (and true true)
;; true

;; (= (* x x) x)

;; (= (* 4 4) 4)
;; (= 16 4)
;; false

;; (= (* 2 2) 2)
;; (= 4 2)
;; false

;; (= (* 7/2 7/2) 7/2)
;; (= 12.25 7/2)
;; false
