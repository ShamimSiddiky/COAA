.model small
.stack 100h
.data
msg1 db "Input: $"
msg2 db "Output: $"

.code
main proc
    mov ax, @data
    mov ds, ax
        
    ; bin input    
       XOR BX, BX
       MOV CX, 16D
       WHILE:
       MOV AH, 1
       INT 21H
       AND AL, 01H
       SHL BX, 1
       OR BL, AL
       
       LOOP WHILE
       
       exit:
       mov ah, 4ch
       int 21h
       main endp
    end main