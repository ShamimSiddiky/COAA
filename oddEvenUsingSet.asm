.MODEL SMALL
.STACK 100H
.DATA
A DB 10,13,'Enter a number(1-9): $'
B DB 0DH,0AH, 'Result: EVEN$'
C DB 0DH,0AH, 'Result: ODD$'
  
.CODE
MAIN PROC
    MOV AX, @DATA       
    MOV DS,AX        
    ;Enter a number
    MOV AH,9
    LEA DX,A                    
    INT 21H            
    ;Take input
    MOV AH,1            
    INT 21H            
    TEST AL,1
    JZ EVEN      
    ;print odd
    LEA DX,C         
    MOV AH,9           
    INT 21H
    JMP EXIT 
    
    EVEN:         
    MOV AH,9
    LEA DX,B         
    INT 21H 
    
    EXIT:
    MOV AH,4CH
    INT 21H           
    MAIN ENDP
END MAIN