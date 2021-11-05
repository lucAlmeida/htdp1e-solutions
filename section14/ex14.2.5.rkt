;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14.2.5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
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

;; create-bst : bst number symbol -> bst
;; produces given bst with the given info inserted in one of its false subtrees
(check-expect (create-bst (make-node 66 'a false false) 53 'b)
              (make-node 66 'a (make-node 53 'b false false) false))
(check-expect (create-bst (make-node 66 'a false false) 72 'c)
              (make-node 66 'a false (make-node 72 'c false false)))
(check-expect (create-bst (make-node 66 'a false false) 66 'c)
              (make-node 66 'c false false))
(check-expect (create-bst
               (create-bst
                (create-bst
                 (create-bst
                  (create-bst
                   (create-bst
                    (create-bst
                     (create-bst
                      (create-bst
                       false
                       63 'e)
                      29 'd)
                     15 'b)
                    10 'a)
                   24 'c)
                  89 'g)
                 77 'f)
                95 'h)
               99 'i)
              BST1)

(define (create-bst a-bst n s)
  (cond [(false? a-bst) (make-node n s false false)]
        [(< n (node-ssn a-bst))
         (make-node (node-ssn a-bst)
                    (node-name a-bst)
                    (create-bst (node-left a-bst) n s)
                    (node-right a-bst))]
        [(> n (node-ssn a-bst))
         (make-node (node-ssn a-bst)
                    (node-name a-bst)
                    (node-left a-bst)
                    (create-bst (node-right a-bst) n s))]
        [else (make-node (node-ssn a-bst) s false false)]))