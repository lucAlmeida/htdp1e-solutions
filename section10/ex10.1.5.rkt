;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.1.5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; eliminate-exp : number list-of-number -> list-of-number
;; returns the list of toy prices below or equal the given amount
(check-expect (eliminate-exp 1.0 (cons 2.95 (cons .95 (cons 1.0 (cons 5 empty)))))
              (cons .95 (cons 1.0 empty)))

(define (eliminate-exp ua lotp)
  (cond [(empty? lotp) empty]
        [(<= (first lotp) ua) (cons (first lotp) (eliminate-exp ua (rest lotp)))]
        [else (eliminate-exp ua (rest lotp))]))
