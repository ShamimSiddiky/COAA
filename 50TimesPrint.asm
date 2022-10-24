.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE 
A DB 0AH,0DH,"Enter a char: $" 
B DB 0AH,0DH,"$"

.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX 
    MOV CX,50   
    
    ;Output A
    MOV AH,9
    LEA DX,A
    INT 21H   
    
    ;INPUT
    MOV AH,1
    INT 21H 
    MOV BL,AL 
    
    MOV AH,9
    LEA DX,B
    INT 21H 
    
    OUTPUT:
    MOV DL,BL
    MOV AH,2
    INT 21H
    DEC CX
    JNZ OUTPUT

    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN