.model small
.stack 100h
.data 
A DW 10,13,"INPUT: $"
B DW 10,13,"o $"
C DW 10,13,"e $"
.code
main proc 
    MOV AX,@DATA
    MOV DS,AX  
    
    mov ah,9
    lea dx,a
    int 21h
    ;take input
    mov ah,1
    int 21h
    mov bh,al
    ;compare with 1 OR 3
    cmp bh,31h
    JE PRINTB
    CMP BH,33H
    JE PRINTB
    
    CMP BH,32H
    JE PRINTC
    CMP BH,34H
    JE PRINTC
    
    JMP EXIT

    PRINTB:
    mov ah,9
    lea dx,B
    int 21h
    JMP EXIT
    
    PRINTC:
    mov ah,9
    lea dx,C
    int 21h
 
    
    Exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN