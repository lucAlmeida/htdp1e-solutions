;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex3.1.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define PERFORMANCE-COST 180)
(define BASE-ATTENDANCE 120)
(define BASE-TICKET-PRICE 5.00)
(define DIME .10)
(define ATTENDANCE-INC 15)
(define ATTENDEE-COST 1.5)
; (define ATTENDEE-COST 0.04)

;; profit : number -> number
;; to compute the profit as the difference between revenue and costs
;; at some given ticket-price
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;; revenue : number -> number
;; to compute the revenue, given ticket-price
(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

;; cost : number -> number
;; to compute the costs, given ticket-price
#;
(define (cost ticket-price)
  (+ PERFORMANCE-COST
     (* ATTENDEE-COST (attendees ticket-price))))

(define (cost ticket-price)
  (* ATTENDEE-COST (attendees ticket-price)))

;; attendees : number -> number
;; to compute the number of attendees, given ticket-price
(define (attendees ticket-price)
  (+ BASE-ATTENDANCE
     (* (/ ATTENDANCE-INC DIME) (- BASE-TICKET-PRICE ticket-price))))
