.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"Addition and Substraction.$"
B DB 0AH, 0DH,"ENTER NUMBER 1: $"
C DB 0AH, 0DH,"ENTER NUMBER 2: $" 
D DB 0AH, 0DH,"ADDITION: $" 
E DB 0AH, 0DH,"SUBSTRACTION: $"
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
    
    ;User input 2
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ;INPUT 2
    MOV AH,1
    INT 21H
    MOV CH, AL  
    
    ;Addition
    MOV AH,9
    LEA DX,D
    INT 21H 
    ;ADD
    ADD BH, CH ;BH=BH+CH
    SUB BH, 48 ; SUB BH,30H 
    MOV AH,2   ;FOR SINGLE OUTPUT
    MOV DL,BH
    INT 21H
    
    ;Substraction 
    MOV AH,9
    LEA DX,E
    INT 21H
    ;Substract
    SUB BH, CH
    ADD BH, 30H
    MOV AH,2   ;FOR SINGLE OUTPUT
    MOV DL,BH
    INT 21H
    
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END