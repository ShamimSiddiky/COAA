.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"Enter 2-Digit Nubmer: $"
.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX    
    
    ;NEW LINE
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;INPUPT
    MOV AH,01h
    INT 21H  
    SUB AL,30h ;ascii to int
    MOV BH,AL
    
    MOV AH,01h
    INT 21h
    SUB AL,30h
    MOV CH,AL
    
    MOV AL,BH
    MOV BL,10
    MUL BL
    
    ADD AL, CH
  
    ;OUTPUT
    MOV CX, AX
    MOV AX, 4c00h
    INT 21H 
  
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END