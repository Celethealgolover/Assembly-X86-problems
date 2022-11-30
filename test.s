.data
  formatstrout1:.asciz "%s"
  message:.asciz "Enter a number:"
  message_negative:.asciz "The number %d is negative!\n"
  message_positive:.asciz "The number %d is positive!\n"
  message_zero:.asciz "The number is zero!\n"
  formatstrin:.asciz "%d"
  x:.space 4
.text
.global main
main:
et_message:
  push $message
  push $formatstrout1
  call printf
  pop %ebx
  pop %ebx
  push $0
  call fflush
  pop %ebx
et_scanf:
  push $x
  push $formatstrin
  call scanf
  pop %ebx
  pop %ebx
et_setup:
  mov x,%eax
et_test1:
  cmp $0,%eax
  jge et_test2
  push x
  push $message_negative
  call printf
  pop %ebx
  pop %ebx
  push $0
  call fflush
  pop %ebx
  jmp et_exit
et_test2:
  cmp $0,%eax
  je et_fin
  push x
  push $message_positive
  call printf
  pop %ebx
  pop %ebx
  push $0
  call fflush
  pop %ebx
  jmp et_exit
et_fin:
  push x
  push $message_zero
  call printf
  pop %ebx
  pop %ebx
  push $0
  call fflush
  pop %ebx
  jmp et_exit
et_exit:
  mov $1,%eax
  mov $0,%ebx
  int $0x80
   
  
