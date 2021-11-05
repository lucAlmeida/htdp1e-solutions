;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.2.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; A binary-search-tree (short: BST) is a BT:
;; 1. false is always a BST;
;; 2. (make-node soc pn lft rgt) is a BST if
;;    a. lft and rgt are BSTs,
;;    b. all ssn numbers in lft are smaller than soc, and
;;    c. all ssn numbers in rgt are smaller than soc.
(define-struct node (ssn name left right))

(define BST1 (make-node 63
                        'e
                        (make-node 29
                                   'd
                                   (make-node 15
                                              'b
                                              (make-node 10 'a false false)
                                              (make-node 24 'c false false))
                                   false)
                        (make-node 89
                                   'g
                                   (make-node 77 'f false false)
                                   (make-node 95 'h false (make-node 99 'i false false)))))

;; fun-for-bst : bst -> ???
#;
(define (fun-for-bst a-bst)
  (cond
    [(false? a-bst) ...]
    [else
     ... (node-ssn a-bst) ...
     ... (node-name a-bst) ...
     ... (fun-for-bst (node-left a-bst)) ...
     ... (fun-for-bst (node-right a-bst)) ...]))

;; search-bst : bst n -> number
;; searches bst for given ssn number
(check-expect (search-bst BST1 10) 'a)
(check-expect (search-bst BST1 15) 'b)
(check-expect (search-bst BST1 24) 'c)
(check-expect (search-bst BST1 29) 'd)
(check-expect (search-bst BST1 63) 'e)
(check-expect (search-bst BST1 77) 'f)
(check-expect (search-bst BST1 89) 'g)
(check-expect (search-bst BST1 95) 'h)
(check-expect (search-bst BST1 99) 'i)

(define (search-bst a-bst soc)
  (cond [(false? a-bst) false]
        [(= soc (node-ssn a-bst)) (node-name a-bst)]
        [(< soc (node-ssn a-bst)) (search-bst (node-left a-bst) soc)]
        [(> soc (node-ssn a-bst)) (search-bst (node-right a-bst) soc)]))