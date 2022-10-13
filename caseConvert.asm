.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"Enter Lowercase Char: $"  
B DB 0AH, 0DH,"Uppercase: $" 
C DB 0AH, 0DH,"Enter Uppercase Char: $"
D DB 0AH, 0DH,"Lowercase: $"
.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX    
    
    ;NEW LINE FOR LOWERCASE
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;INPUPT 1
    MOV AH,01h
    INT 21H 
    MOV BL,AL 

    ;OUTPUT OF 1
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;Substract
    SUB BL, 20H
    MOV AH,2   ;FOR SINGLE OUTPUT
    MOV DL,BL
    INT 21H 
    
    
    ;NEW LINE FOR UPPERCASE
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ;INPUPT 2
    MOV AH,01h
    INT 21H 
    MOV BH,AL 

    ;OUTPUT OF 2
    MOV AH,9
    LEA DX,D
    INT 21H
    
    ;ADDITION
    ADD BH, 20H
    MOV AH,2   ;FOR SINGLE OUTPUT
    MOV DL,BH
    INT 21H

    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN