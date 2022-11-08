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
    lea dx,A
    int 21h
    
    MOV AH,1
    INT 21H
    MOV AH,0
    
    CMP AX,BX
    JL COMPCX
    JMP EXIT
    
    COMPCX:
    mov ah,9
    lea dx,C
    int 21h
    
    MOV AH,1
    INT 21H
    MOV AH,0
    XCHG AX,CX
    
    CMP BX,CX
    JL AX0
    JMP BX0
    
    AX0:
    MOV AH,0
    MOV AL,0
    JMP EXIT
    
    BX0:
    MOV BH,0
    MOV BL,0
    
    
    Exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN