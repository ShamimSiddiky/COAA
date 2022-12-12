.model small
.stack 100h
.data ;VARIABLE

.code
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX   
    
    xor bx, bx
mov cl, 4
mov ah, 1
int 21h



while:
cmp al, 0DH
je end_while



cmp al, 39h
jg letter



and al, 0FH
jmp shift



letter:
sub al, 37h



shift:
shl bx, cl



or bl, al



int 21h
jmp while



end_while:



xor cx, cx
xor ax, ax
mov cx, 16d



top:
rol bx, 1
jc print_1
jnc print_0
l1:
loop top
jmp exit



print_1:
mov ah, 2
mov dl, 49D
int 21h
jmp l1



print_0:
mov ah, 2
mov dl, 48D
int 21h
jmp l1



exit: 
    
    
    
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN