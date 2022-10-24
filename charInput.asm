.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"Enter First Char: $"  
B DB 0AH, 0DH,"Enter Second Char: $" 
C DB 0AH, 0DH,"Characters are: $"
D DB 0AH, 0DH,"$"
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
    MOV BL,AL  
               
    ;NEW LINE B
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;INPUPT 2
    MOV AH,01h
    INT 21H
    MOV CL,AL 
  
    ;OUTPUT
    ;NEW LINE C
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    ;NEW LINE D
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV DL,CL
    MOV AH,2
    INT 21H
     
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
