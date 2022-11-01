.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"Addition$"
B DB 0AH, 0DH,"ENTER NUMBER 1: $"
C DB 0AH, 0DH,"ENTER NUMBER 2: $" 
D DB 0AH, 0DH,"ADDITION: $" 
E DB 0AH, 0DH,"SUBSTRACTION: $" 
VAR1 DB ?
VAR2 DB ?

.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX  
    
    ;Title
    MOV AH,9
    LEA DX,A
    INT 21H 
    
    ;User input 1
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;INPUPT 1
    MOV AH,1
    INT 21H
    MOV BH, AL
    MOV VAR1,BH
    
    
    ;User input 2
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ;INPUT 2
    MOV AH,1
    INT 21H
    MOV CH, AL
    MOV VAR2,CH 
    
    ;Addition
    MOV AH,9
    LEA DX,D
    INT 21H 
    ;ADD
    ADD BH,VAR2 ;BH=BH+CH
    SUB BH,48 ; SUB BH,30H 
    
    MOV AH,2   ;FOR SINGLE OUTPUT
    MOV DL,BH
    INT 21H
    
    ;Substraction 
    MOV AH,9
    LEA DX,E
    INT 21H
    ;Substract
    SUB VAR1,CH
    ADD VAR1,30H   
    
    MOV AH,2   ;FOR SINGLE OUTPUT
    MOV DL,VAR1
    INT 21H
    
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN