.data
  n:.long 5
  v:.long 7,9,13,11,18
  s:.asciz "Elementele sunt intr-o ordine strict crescatoare!"
  formatstr:.asciz "%s"
  formatstr2:.asciz "%d\n"
  indice:.long 0
 .text
 .global main
 main:
  mov $1,%ecx
  mov $v,%edi
  mov $0,%esi
 et_while:
  cmp n,%ecx
  je et_print
  movl (%edi,%ecx,4),%edx
  mov %ecx,%ebx
  sub $1,%ebx
  movl (%edi,%ebx,4),%eax
  cmp %eax,%edx
  jle et_setup
  inc %ecx
  jmp et_while
et_setup:
  mov %ecx,%esi
  inc %ecx
  jmp et_while
et_print:
  mov %esi,indice
  push indice
  push $formatstr2
  call printf
  pop %ebx
  pop %ebx
  push $0
  call fflush
  pop %ebx
et_exit:
  mov $1,%eax
  mov $0,%ebx
  int $0x80
  
   
