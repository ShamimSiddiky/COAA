.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"Dollar as ending sign.$"
.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX    
    
    ;INPUPT
    MOV AH,1
    INT 21H
    MOV BH, AL
    
    ;NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 

    ;OUTPUT
    MOV AH,2
    MOV DL, BH
    INT 21H  
    
    ;NEW LINE
    MOV AH,9
    LEA DX,A
    INT 21H  
    
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END