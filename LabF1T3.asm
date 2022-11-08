.model small
.stack 100h
.data 
A DW 10,13,"INPUT: $" 
B DW 10,13,"$"
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
    ;compare with A
    cmp bh,41h
    jl EXIT
    ;compare with Z
    cmp bh,5Ah
    jg EXIT 
    
    mov ah,9
    lea dx,B
    int 21h
    
    ;print msg2
    mov ah,2
    MOV DL,BH
    INT 21H 
    
    Exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN