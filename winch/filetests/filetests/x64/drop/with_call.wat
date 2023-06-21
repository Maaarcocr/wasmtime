;;! target = "x86_64"

(module
    (func $answer (result i32) (i32.const 42))
    (func (result i32)
	(i32.const 1)
	(i32.const 2)
    (call $answer)
    (drop)
	(i32.add)
    )
)
;;    0:	 55                   	push	rbp
;;    1:	 4889e5               	mov	rbp, rsp
;;    4:	 4883ec08             	sub	rsp, 8
;;    8:	 4c893424             	mov	qword ptr [rsp], r14
;;    c:	 48c7c02a000000       	mov	rax, 0x2a
;;   13:	 4883c408             	add	rsp, 8
;;   17:	 5d                   	pop	rbp
;;   18:	 c3                   	ret	
;;
;;    0:	 55                   	push	rbp
;;    1:	 4889e5               	mov	rbp, rsp
;;    4:	 4883ec08             	sub	rsp, 8
;;    8:	 4c893424             	mov	qword ptr [rsp], r14
;;    c:	 4883ec08             	sub	rsp, 8
;;   10:	 e800000000           	call	0x15
;;   15:	 4883c408             	add	rsp, 8
;;   19:	 b801000000           	mov	eax, 1
;;   1e:	 83c002               	add	eax, 2
;;   21:	 4883c408             	add	rsp, 8
;;   25:	 5d                   	pop	rbp
;;   26:	 c3                   	ret	
