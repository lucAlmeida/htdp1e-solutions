;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.4.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct add (left right))
(define-struct mul (left right))

; 1. (+ 10 -10)
(define S1 (make-add 10 -10))
; 2. (+ (* 20 3) 33)
(define S2 (make-add (make-mul 20 3) 33))
; 3. (* 3.14 (* r r))
(define S3 (make-mul 3.14 (make-mul 'r 'r)))
; 4. (+ (* 9/5 c) 32)
(define S4 (make-add (make-mul 9/5 'c) 32))
; 5. (+ (* 3.14 (* o o)) (* 3.14 (* i i)))
(define S5 (make-add (make-mul 3.14 (make-mul 'o 'o)) (make-mul 3.14 (make-mul 'i 'i))))

;; numeric? : scheme-exp -> boolean
;; determines whether scheme expression is boolean or not
(check-expect (numeric? S1) #t)
(check-expect (numeric? S2) #t)
(check-expect (numeric? S3) #f)
(check-expect (numeric? S4) #f)
(check-expect (numeric? S5) #f)

(define (numeric? sch-exp)
  (cond ((number? sch-exp) #t)
        ((add? sch-exp) (and (numeric? (add-left sch-exp))
                             (numeric? (add-right sch-exp))))
        ((mul? sch-exp) (and (numeric? (mul-left sch-exp))
                             (numeric? (mul-right sch-exp))))
        (else #f)))