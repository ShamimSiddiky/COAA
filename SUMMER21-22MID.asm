.model small
.stack 100h
.data
CR EQU 'ODH'
LF EQU 'OAH'
MSG1 DB "DO NOT STOP$"
MSG2 DB "STOP$"

.code main
main proc
        MOV AX,@DATA
        MOV DS,AX
        
        MOV CX,7H
        PRINT_:
        LEA DX,MSG1
        MOV AH,9
        INT 21H
        
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        DEC CX
        JNZ PRINT_
        
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        LEA DX,MSG2
        MOV AH,9
        INT 21H
        
        EXIT:
        LEA DX,MSG2  
        MOV AH,9
        INT 21H
        
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN