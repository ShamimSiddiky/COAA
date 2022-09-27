.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"Name: Siddiky $"  
B DB 0AH, 0DH,"Id: 20-42649-1 $" 
C DB 0AH, 0DH,"Dept: CSE $"
D DB 0AH, 0DH,"Course: COAA $"
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
               
    ;NEW LINE B
    MOV AH,9
    LEA DX,B
    INT 21H
     
    ;NEW LINE C
    MOV AH,9
    LEA DX,C
    INT 21H 
    
    ;NEW LINE D
    MOV AH,9
    LEA DX,D
    INT 21H
     
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END