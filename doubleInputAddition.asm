.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"Enter 2-Digit Nubmer 1: $"  
B DB 0AH, 0DH,"Enter 2-Digit Nubmer 2: $" 
C DB 0AH, 0DH,"Addition: $"
.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX    
    
    ;NEW LINE A
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;INPUPT 1
    MOV AH,01h
    INT 21H  
    SUB AL,30h ;ascii to int  
    MOV BL,10
    MUL BL
    MOV BH,AL
    
    MOV AH,01h
    INT 21h
    SUB AL,30h
    MOV CH,AL
    
    ADD BH, CH  
               
    ;NEW LINE B
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;INPUPT 2
    MOV AH,01h
    INT 21H  
    SUB AL,30h ;ascii to int  
    MOV BL,10
    MUL BL
    MOV CH,AL
    
    MOV AH,01h
    INT 21h
    SUB AL,30h
    MOV DH,AL
    ADD CH, DH
  
    ;OUTPUT 
    ADD BH,CH  
    MOV AL, BH
    AAM  
    
    MOV BX,AX
     
    ;NEW LINE C
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ADD BH, 48
    ADD BL, 48 
    
    MOV DL,BH
    MOV AH,2
    INT 21H 
    
    MOV DL, BL
    MOV AH,2
    INT 21H
     
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END