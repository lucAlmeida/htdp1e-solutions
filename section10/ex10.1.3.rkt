;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.1.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; convertFC : list-of-number -> list-of-number
;; converts a list of Fahrenheit measurements to a list of Celsius

(define (convertFC lon)
  (cond [(empty? lon) empty]
        [else (cons (fahr->celsius (first lon)) (convertFC (rest lon)))]))

;; fahr->celsius : number -> number
;; converts a Fahrenheit measurement to its Celsius equivalent

(define (fahr->celsius f)
  (* (- f 32) (/ 5 9)))