.data
string .asciiz "ola\n"
.text
la $a0, string
li $v0, 4
syscall