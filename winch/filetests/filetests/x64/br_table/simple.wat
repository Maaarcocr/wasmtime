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
;;   15:	 48c7c102000000       	mov	rcx, 2
;;   1c:	 4839c1               	cmp	rcx, rax
;;   1f:	 480f46c1             	cmovbe	rax, rcx
;;   23:	 488d0df9ffffff       	lea	rcx, [rip - 7]
;;   2a:	 48631401             	movsxd	rdx, dword ptr [rcx + rax]
;;   2e:	 4801d1               	add	rcx, rdx
;;   31:	 ffe1                 	jmp	rcx
;;   33:	 1c00                 	sbb	al, 0
;;   35:	 0000                 	add	byte ptr [rax], al
;;   37:	 1200                 	adc	al, byte ptr [rax]
;;   39:	 0000                 	add	byte ptr [rax], al
;;   3b:	 bf15000000           	mov	edi, 0x15
;;   40:	 e800000000           	call	0x45
;;   45:	 bf14000000           	mov	edi, 0x14
;;   4a:	 e800000000           	call	0x4f
;;   4f:	 4883c410             	add	rsp, 0x10
;;   53:	 5d                   	pop	rbp
;;   54:	 c3                   	ret	
