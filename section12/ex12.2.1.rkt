;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex12.2.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define-struct mail (from date message))
;; A mail-message is a structure:
;; (make-mail name n s)
;; where name is a string, n is a number, and s is a string
(define M1 (make-mail "John" 8 "Hi everyone!"))
(define M2 (make-mail "Mary" 10 "Ahh!"))
(define M3 (make-mail "Johnny" 9 "Zhhh"))
(define LOM (cons M1 (cons M2 (cons M3 empty))))

;; sort-by-date : list-of-mail -> list-of-mail
;; to create a sorted list of mails from all mails in alom
(check-expect (sort-by-date LOM) (cons M2 (cons M3 (cons M1 empty))))
(define (sort-by-date alom)
  (cond [(empty? alom) empty]
        [else (insert-by-date (first alom) (sort-by-date (rest alom)))]))

;; insert-by-date : mail list-of-mail -> list-of-mail
;; to create a list of mails from mail and the mails on alom
;; that is sorted in descending order by date; alom is already sorted

(define (insert-by-date m alom)
  (cond [(empty? alom) (cons m empty)]
        [(>= (mail-date m) (mail-date (first alom))) (cons m alom)]
        [(< (mail-date m) (mail-date (first alom)))
         (cons (first alom) (insert-by-date m (rest alom)))]))

;; sort-by-msg : list-of-mail -> list-of-mail
;; to create a sorted list of mails from all mails in alom
(check-expect (sort-by-msg LOM) (cons M3 (cons M1 (cons M2 empty))))
(define (sort-by-msg alom)
  (cond [(empty? alom) empty]
        [else (insert-by-msg (first alom) (sort-by-msg (rest alom)))]))
  
;; insert-by-date : mail list-of-mail -> list-of-mail
;; to create a list of mails from mail and the mails on alom
;; that is sorted in descending order by date; alom is already sorted

(define (insert-by-msg m alom)
  (cond [(empty? alom) (cons m empty)]
        [(string>=? (mail-message m) (mail-message (first alom))) (cons m alom)]
        [(string<? (mail-message m) (mail-message (first alom)))
         (cons (first alom) (insert-by-msg m (rest alom)))]))
