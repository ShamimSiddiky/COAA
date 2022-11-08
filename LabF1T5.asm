.model small
.stack 100h
.data 
A DW 10,13,"INPUT AX: $" 
B DW 10,13,"INPUT BX: $"
C DW 10,13,"INPUT CX: $"
.code
main proc 
    MOV AX,@DATA
    MOV DS,AX  
    
    mov ah,9
    lea dx,B
    int 21h 
    
    MOV AH,1
    INT 21H
    MOV AH,0
    XCHG AX,BX
    
    mov ah,9
    lea dx,C
    int 21h
    
    MOV AH,1
    INT 21H
    MOV AH,0
    XCHG AX,CX
    
    mov ah,9
    lea dx,A
    int 21h
    
    MOV AH,1
    INT 21H
    MOV AH,0
    
    CMP AX,BX
    JL DX0
    JMP COMPCX
    
    COMPCX:
    CMP BX,CX
    JL DX0
    JMP DX1
    
    DX0:
    MOV DH,0
    MOV DL,0
    JMP EXIT
    
    DX1:
    MOV DH,0
    MOV DL,1
    
    
    Exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN