.data
 n:.long 10
 maximum:.long 0
 v:.long 7,1,13,27,19,55,54,8,4,36
 message:.asciz "The size of the array is:%d\n"
 message2:.asciz "The maximum element of the array is:%d\n"
 formatstr:.asciz "%d"
 formatstr2:.asciz "%s"
.text
.global main
main:
et_message:
  push n
  push $message
  call printf
  pop %ebx
  pop %ebx
  push $0
  call fflush
  pop %ebx
et_setup:
  lea v,%edi
  mov $0,%ecx
et_loop:
  cmp n,%ecx
  je et_print
  movl (%edi,%ecx,4),%edx
  cmp maximum,%edx
  jg et_update
  inc %ecx
  jmp et_loop
et_update:
  mov %edx,maximum
  inc %ecx
  jmp et_loop
et_print:
  push maximum
  push $message2
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
