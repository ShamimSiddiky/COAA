.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"INPUT A: $"
B DB 0AH, 0DH,"INPUT B: $"
C DB 0AH, 0DH,"A: $" 
D DB 0AH, 0DH,"B: $" 

VAR1 DB ?
VAR2 DB ?
.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX  
    
    ;USER INPUT A
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;INPUPT 1
    MOV AH,1
    INT 21H
    MOV BH, AL
    MOV VAR1, BH
    
    ;USER INPUT B
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;INPUPT 1
    MOV AH,1
    INT 21H
    MOV BH, AL
    MOV VAR2, BH
    
    ;SWAP   
    MOV CH, VAR1
    XCHG CH, VAR2
    
    ;OUTPUT
    ;NEW LINE C
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV DL,CH
    MOV AH,2
    INT 21H  
    
    ;NEW LINE D
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV DL,VAR2
    MOV AH,2
    INT 21H
    
    
    
    
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN