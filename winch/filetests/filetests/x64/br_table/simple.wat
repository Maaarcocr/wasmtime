;;! target = "x86_64"
(module
  (func $dummy (param i32))
  (func (export "singleton") (param i32)
    (block
      (block
        (br_table 1 0 (local.get 0))
        (i32.const 21)
        (call $dummy)
      )
      (i32.const 20)
      (call $dummy)
    )
  )
)


;;    0:	 55                   	push	rbp
;;    1:	 4889e5               	mov	rbp, rsp
;;    4:	 4883ec10             	sub	rsp, 0x10
;;    8:	 897c240c             	mov	dword ptr [rsp + 0xc], edi
;;    c:	 4c89742404           	mov	qword ptr [rsp + 4], r14
;;   11:	 4883c410             	add	rsp, 0x10
;;   15:	 5d                   	pop	rbp
;;   16:	 c3                   	ret	
;;
;;    0:	 55                   	push	rbp
;;    1:	 4889e5               	mov	rbp, rsp
;;    4:	 4883ec10             	sub	rsp, 0x10
;;    8:	 897c240c             	mov	dword ptr [rsp + 0xc], edi
;;    c:	 4c89742404           	mov	qword ptr [rsp + 4], r14
;;   11:	 8b44240c             	mov	eax, dword ptr [rsp + 0xc]
;;   15:	 488d0df9ffffff       	lea	rcx, [rip - 7]
;;   1c:	 48631401             	movsxd	rdx, dword ptr [rcx + rax]
;;   20:	 4801d1               	add	rcx, rdx
;;   23:	 ffe1                 	jmp	rcx
;;   25:	 1800                 	sbb	byte ptr [rax], al
;;   27:	 0000                 	add	byte ptr [rax], al
;;   29:	 bf15000000           	mov	edi, 0x15
;;   2e:	 e800000000           	call	0x33
;;   33:	 bf14000000           	mov	edi, 0x14
;;   38:	 e800000000           	call	0x3d
;;   3d:	 4883c410             	add	rsp, 0x10
;;   41:	 5d                   	pop	rbp
;;   42:	 c3                   	ret	
