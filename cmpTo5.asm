.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE 
A DB 0AH,0DH,"Enter a number $"
B DB 0AH,0DH,"Greater than 5 $"   
C DB 0AH,0DH,"Less than 5 $"  
D DB 0AH,0DH,"Equal to 5 $"

.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX    
    
    MOV CL,5
    
    ;PRINT 
    LEA DX,A
    MOV AH,09H
    INT 21H
    
    ;INPUT 
    MOV AH,1
    INT 21H
    MOV DL,AL
    SUB DL, 30H
    
    CMP CL, DL
    JE EQUAL
    JG LOWER
    JL GREATER 
    
    EQUAL:
        LEA DX,D
        MOV AH,09H
        INT 21H
        JMP EXIT
        
    GREATER:
        LEA DX,B
        MOV AH,09H
        INT 21H
        JMP EXIT
        
    LOWER:
        LEA DX,C
        MOV AH,09H
        INT 21H
        JMP EXIT
    
    EXIT:
    ;Exit Code
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN