.MODEL SMALL
.STACK 100H
.DATA
VAR1 DB 10,13, "BINARY CONTENT: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV CX, 0000H
    MOV CX, 16
    
    MOV BX, 0000H
    MOV BX, 7FDCH
    
    TOP:
    ROL BX, 1
    JNC V0:
    JC V1:
    
    V1:
    MOV AH, 2
    MOV DL, '1'
    INT 21H
    
    LOOP TOP
    
    V0:
    MOV AH, 2
    MOV DL, '0'
    INT 21H
    
    LOOP TOP
    
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN