.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE 
A DB 0AH,0DH,"Hello World $"
B DB 0AH,0DH,"Bye World$"

.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX    
    
    MOV CX,1
    START:
    MOV AH,9
    LEA DX,A
    INT 21H
    INC CX
    
    CMP CX,6
    JE BYE
    JNE START
    
    BYE:
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN