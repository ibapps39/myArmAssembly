; ARM64 
    .section __TEXT, __text, regular, pure_instructions
; .section = "Assembler, make the following sections"
; '__TEXT, __text, regular, pure_instructions' are kinds of sections, direectives, and type-identifiers
; Directives tells the assembler to change a setting.
; Type identifiers are like variable indentifers. 
; __TEXT is a directive and is a read-only section.
; __text = '.text is directive __text'. (__TEXT, __text) tells the assembler to assemble into the indicated section of __TEXT
; Typer identifiers are like int, double for variables.
; regular = a type idenfitifer that contains any kind of data and gets no special treatment. Is default.
; pure_instructions = is a section attribute. Indicates that the sections only has valid machine instructions
; .section __TEXT, __text, regular, pure_instructions is equivalent to .text if default flag is -dynamic 
	.build_version macos, 11, 0	sdk_version 11, 3
; indicates build os, os version, using sdk
	.globl	_main                           ; -- Begin function main
; Makes _main external
	.p2align	2
; Moves to higher location in memory.
_main:                                  ; @main
; Defines or starts main?
	.cfi_startproc
; %bb.0: = 'basic block number 0'
; MIT - '.cfi_startproc is used at the beginning of each function that should have an entry in .eh_frame. 
;It initializes some internal data structures and emits architecture dependent initial CFI instructions. 
;Don't forget to close the function by .cfi_endproc.'
; Me- used at the start of each function with .eh_frame, initializes inter. data structs, and need to be closed.
	sub	sp, sp, #48                     ; =48
; sub = subtract, sp is a stack pointer. stack frame is collection (stack) of calls when calling a function. 
; Decrementing the stack pointer creates a new stack frame. Allocates 48 bytes.
; sub sp, sp, #48: reserve 48 bytes on the stack (six 64-bit words)
; sub acted upon register, operand register, second register operand.
; sub x0, x1, x2: x0 = x1 - x2
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
; stp = store a pair of registers. Here it's storing the old frame pointer sp, x29, link register x30, and
; storying it on the stack starting at sp + 32. [] brackets are memory access.
	add	x29, sp, #32  
; calculates new stack frame pointer, sp. Necessary to point to old frame and old stack pointers. 
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
;;;End Notes
; I used https://developer.apple.com/library/archive/documentation/DeveloperTools/Reference/Assembler/040-Assembler_Directives/asm_directives.html#//apple_ref/doc/uid/TP30000823-CJBIFBJG
; for some help.
; And https://cit.dixie.edu/cs/2810/arm64-assembly.html
;http://web.mit.edu/rhel-doc/3/rhel-as-en-3/cfi-directives.html
; https://wolchok.org/posts/how-to-read-arm64-assembly-language/
