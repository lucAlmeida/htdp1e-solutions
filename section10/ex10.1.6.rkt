;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.1.6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; name-robot : list-of-symbol -> list-of-symbol
;; replaces all occurrences of 'robot with 'r2d2
(check-expect (name-robot '(robot doll dress)) '(r2d2 doll dress))

(define (name-robot los)
  (cond [(empty? los) empty]
        [(symbol=? (first los) 'robot) (cons 'r2d2 (name-robot (rest los)))]
        [else (cons (first los) (name-robot (rest los)))]))

;; substitute : list-of-symbol -> list-of-symbol
;; replaces all occurrences of old with new
(check-expect (substitute 'Barbie 'doll (cons 'robot (cons 'doll (cons 'dress empty))))
              (cons 'robot (cons 'Barbie (cons 'dress empty))))

(define (substitute new old los)
  (cond [(empty? los) empty]
        [(symbol=? (first los) old) (cons new (substitute new old (rest los)))]
        [else (cons (first los) (substitute new old (rest los)))]))