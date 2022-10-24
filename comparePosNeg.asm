.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE 
A DB 0AH,0DH,"Enter a number: $"
B DB 0AH,0DH,"Positive$" 
C DB 0AH,0DH,"Negative$"

.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX    
    
    LEA DX,A
    MOV AH,09H
    INT 21H
    
    ;INPUT
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV CL, 2DH         ;HEX OF - SYMBOL
    CMP CL, BH
    
    JE E-INPUT          ;IF EQUAL TAKE ANOTHER INPUT FOR THE DIGIT
    JNE BASE            ;ELSE EXECUTE BASE LOGIC
    
    E-INPUT:
        MOV AH,1
        INT 21H
        MOV BH,AL
        NEG BH          ;NEGATIVE OF THE INPUT NUMBER
        JMP BASE        ;EXECUTE BASE LOGIC
    
    BASE:
        SUB BH, 30H     ;CONVERT TO DECIMAL
        MOV CH, BH
        CMP CH, 0
        JGE POSITIVE
        JL  NEGATIVE
    
    POSITIVE:
        LEA DX,B
        MOV AH,09H
        INT 21H
        JMP EXIT
        
    NEGATIVE:
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