.model small
.stack 100h
.data ;VARIABLE

.code
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX    
    
    mov CX,0
    
    mov ah,2
    mov dl,"*"
    Top:
    int 21h
    jcxz exit
    loop top
    
    
    exit:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN