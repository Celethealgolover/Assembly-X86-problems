.data
  a:.space 4
  b:.space 4
  s:.asciz "Enter two natural numbers:"
  formatstrin:.asciz "%ld%ld"
  formatstrin2:.asciz "%s"
  formatstrout1:.asciz "Before swapping the  numbers are:%ld %ld\n"
  formatstrout2:.asciz "After swapping the  numbers are:%ld %ld\n"
.text
.global main
main:
et_print0:
    push $s
    push $formatstrin2
    call printf
    pop %ebx
    pop %ebx
    push $0
    call fflush
    pop %ebx
et_input:
    pushl $b
    pushl $a
    pushl $formatstrin
    call scanf
    popl %ebx
    popl %ebx
    popl %ebx
et_print1:
    push b
    push a
    push $formatstrout1
    call printf
    pop %ebx
    pop %ebx
    pop %ebx
    push $0
    call fflush
    pop %ebx
et_swap:   
  mov a,%eax
  mov b,%ebx
  mov %eax,%ecx
  mov %ebx,%eax
  mov %ecx,%ebx
  mov %ebx,b
  mov %eax,a
et_print2:
    push b
    push a
    push $formatstrout2
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

