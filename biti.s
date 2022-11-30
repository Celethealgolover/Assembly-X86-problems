.data
  x:.space 4
  nr:.long 0
  str1:.asciz "%s"
  message:.asciz "Enter a natural number:"
  str2:.asciz "%d"
  str3:.asciz "The number %d has %d bit(s)!\n"
.text
.global main
main:
et_message:
  push $message
  push $str1
  call printf
  pop %ebx
  pop %ebx
  push $0
  call fflush
  pop %ebx
et_input:
  push $x
  push $str2
  call scanf
  pop %ebx
  pop %ebx
et_setup:
  mov x,%eax
  mov $0,%ecx
et_while:
  cmp $0,%eax
  je et_print
  add $1,%ecx
  mov %eax,%edx
  sub $1,%edx
  and %edx,%eax
  jmp et_while
et_print:
   mov %ecx,nr
   push nr
   push x
   push $str3
   call printf
   pop %ebx
   pop %ebx
   pop %ebx
   push $0
   call fflush
   pop %ebx
et_exit:
  mov $1,%eax
  mov $0,%ebx
  int $0x80
  
