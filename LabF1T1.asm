.model small
.stack 100h
.data 
A DW 10,13,"Enter a num: $"
.code
main proc 
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
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
    
    BASE: 
    MOV AH,0
    NEG AL
    CMP AX,0
    JNLE EXIT
    MOV BH,0
    MOV BL,-1
    
    Exit:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN