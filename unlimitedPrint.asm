.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE 
A DB 0AH,0DH,"Hello, world $"

.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX  
    
    ;Output A
    START:
    MOV AH,9
    LEA DX,A
    INT 21H   
    JMP START

    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN