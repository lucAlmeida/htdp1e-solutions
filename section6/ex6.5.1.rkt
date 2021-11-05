;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex6.5.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A movie is a structure:
;; (make-movie title producer)
;; where title and producer are symbols
(define-struct movie (title producer))

;; process-movie : movie -> ???
(define (process-movie a-movie)
  ... (movie-title a-movie) ...
  ... (movie-producer a-movie) ...)

;; A boyfriend is a structure:
;; (make-boyfriend name hair eyes phone)
;; where name and hair are symbols, and eyes and phone are numbers
(define-struct boyfriend (name hair eyes phone))

;; process-boyfriend : boyfriend -> ???
(define (process-boyfriend a-boyfriend)
  ... (boyfriend-name a-boyfriend) ...
  ... (boyfriend-hair a-boyfriend) ...
  ... (boyfriend-eyes a-boyfriend) ...
  ... (boyfriend-phone a-boyfriend) ...)

;; A cheerleader is a structure:
;; (make-cheerleader name number)
;; where name is a symbol and number is a number
(define-struct cheerleader (name number))

;; process-cheerleader : cheerleader -> ???
(define (process-cheerleader a-cheerleader)
  ... (cheerleader-name a-cheerleader) ...
  ... (cheerleader-number a-cheerleader ...))

;; A CD is a structure:
;; (make-CD artist title price)
;; where artist and title are symbols and price is a number
(define-struct CD (artist title price))

;; process-CD : CD -> ???
(define (process-CD a-CD)
  ... (CD-artist a-CD) ...
  ... (CD-title a-CD) ...
  ... (CD-price a-CD) ...)

;; A sweater is a structure:
;; (make-sweater material size producer)
;; where material and producer are symbols, and size is a number
(define-struct sweater (material size producer))

;; process-sweater : sweater -> ???
(define (process-sweater a-sweater)
  ... (sweater-material a-sweater) ...
  ... (sweater-size a-sweater) ...
  ... (sweater-producer a-sweater) ...)
