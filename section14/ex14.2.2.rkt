;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A binary-tree (short: BT) is either:
;; 1. false; or
;; 2. (make-node soc pn lft rgt)
;;    where soc is a number, pn is a symbol, and lft and rgt are BTs.
(define-struct node (ssn name left right))

(define BT1 (make-node 15 'd false (make-node 24 'i false false)))
(define BT2 (make-node 15 'd (make-node 87 'h false false) false))

;; fun-for-bt : bt -> ???
#;
(define (fun-for-bt a-bt)
  (cond
    [(false? a-bt) ...]
    [else
     ... (node-ssn a-bt) ...
     ... (node-name a-bt) ...
     ... (fun-for-bt (node-left a-bt)) ...
     ... (fun-for-bt (node-right a-bt)) ...]))


;; contains-bt : bt number -> boolean
;; determines whether the bt contains the given number
(check-expect (contains-bt BT1 15) true)
(check-expect (contains-bt BT1 24) true)
(check-expect (contains-bt BT1 87) false)
(check-expect (contains-bt BT2 15) true)
(check-expect (contains-bt BT2 24) false)
(check-expect (contains-bt BT2 87) true)

(define (contains-bt a-bt number)
  (cond [(false? a-bt) false]
        [else (or (= (node-ssn a-bt) number)
                  (contains-bt (node-left a-bt) number)
                  (contains-bt (node-right a-bt) number))]))

;; search-bt : bt number -> boolean
;; searches bt for given ssn number
(check-expect (search-bt BT1 15) 'd)
(check-expect (search-bt BT1 24) 'i)
(check-expect (search-bt BT1 87) false)
(check-expect (search-bt BT2 15) 'd)
(check-expect (search-bt BT2 24) false)
(check-expect (search-bt BT2 87) 'h)
#;
(define (search-bt a-bt soc)
  (cond [(false? a-bt) false]
        [(= (node-ssn a-bt) soc) (node-name a-bt)]
        [(contains-bt (node-left a-bt) soc) (search-bt (node-left a-bt) soc)]
        [(contains-bt (node-right a-bt) soc) (search-bt (node-right a-bt) soc)]
        [else false]))

(define (search-bt a-bt soc)
  (cond [(false? a-bt) false]
        [(= (node-ssn a-bt) soc) (node-name a-bt)]
        [(and (boolean? (search-bt (node-left a-bt) soc))
              (boolean? (search-bt (node-right a-bt) soc))) false]
        [(boolean? (search-bt (node-left a-bt) soc)) (search-bt (node-right a-bt) soc)]
        [(boolean? (search-bt (node-right a-bt) soc)) (search-bt (node-left a-bt) soc)]))