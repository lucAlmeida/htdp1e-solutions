;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex6.4.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A movie is a structure:
;; (make-movie title producer)
;; where title and producer are symbols
(define-struct movie (title producer))

;; A boyfriend is a structure:
;; (make-boyfriend name hair eyes phone)
;; where name and hair are symbols, and eyes and phone are numbers
(define-struct boyfriend (name hair eyes phone))

;; A cheerleader is a structure:
;; (make-cheerleader name number)
;; where name is a symbol and number is a number
(define-struct cheerleader (name number))

;; A CD is a structure:
;; (make-CD artist title price)
;; where artist and title are symbols and price is a number
(define-struct CD (artist title price))

;; A sweater is a structure:
;; (make-sweater material size producer)
;; where material and producer are symbols, and size is a number
(define-struct sweater (material size producer))
