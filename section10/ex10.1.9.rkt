;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex10.1.9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; controller : number -> list-of-value
;; produce a list with a message considering the given cents
(check-expect (controller 1) (cons 1 (cons 'cent empty)))
(check-expect (controller 83) (cons 83 (cons 'cents empty)))
(check-expect (controller 103) (cons 1 (cons 'dollar (cons 'and (cons 3 (cons 'cents empty))))))
(check-expect (controller 2090) (cons 20 (cons 'dollars (cons 'and (cons 90 (cons 'cents empty))))))
(check-expect (controller 9999) (cons 99 (cons 'dollars (cons 'and (cons 99 (cons 'cents empty))))))

(define (controller cents)
  (cond [(= cents 1) (cons 1 (cons 'cent empty))]
        [(< cents 100) (cons cents (cons 'cents empty))]
        [(= (quotient cents 100) 1)
         (cons 1 (cons 'dollar (cons 'and (controller (remainder cents 100)))))]
        [else
         (cons (quotient cents 100)
               (cons 'dollars (cons 'and (controller (remainder cents 100)))))]))