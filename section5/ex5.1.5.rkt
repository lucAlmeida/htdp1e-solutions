;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex5.1.5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (check-color target-one target-two guess-one guess-two)
  (cond [(and (symbol=? target-one guess-one) (symbol=? target-two guess-two)) 'Perfect]
        [(or (symbol=? target-one guess-one) (symbol=? target-two guess-two)) 'OneColorAtCorrectPosition]
        [(or (symbol=? target-one guess-two) (symbol=? target-two guess-one)) 'OneColorOccurs]
        [else 'NothingCorrect]))