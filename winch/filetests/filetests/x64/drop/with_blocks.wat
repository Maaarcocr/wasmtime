;;! target = "x86_64"

(module
    (func (result i32)
	(i32.const 1)
    (i32.const 2)
	(block (result i32)
        (i32.const 3)
    )
    (drop)
	(i32.add)
    )
)
;;    0:	 55                   	push	rbp
;;    1:	 4889e5               	mov	rbp, rsp
;;    4:	 4883ec08             	sub	rsp, 8
;;    8:	 4c893424             	mov	qword ptr [rsp], r14
;;    c:	 48c7c003000000       	mov	rax, 3
;;   13:	 b801000000           	mov	eax, 1
;;   18:	 83c002               	add	eax, 2
;;   1b:	 4883c408             	add	rsp, 8
;;   1f:	 5d                   	pop	rbp
;;   20:	 c3                   	ret	
