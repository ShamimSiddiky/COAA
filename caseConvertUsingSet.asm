.MODEL SMALL
.STACK 100H
.DATA ;VARIABLE
A DB 0AH, 0DH,"Enter Char: $"  
B DB 0AH, 0DH,"Output: $"
.CODE
MAIN PROC
    ;1 FOR SINGLE USER INPUT
    ;2 FOR SINGLE OUTPUT
    ;9 FOR SRING OUTPUT
    
    MOV AX, @DATA
    MOV DS, AX    
    
    ;Enter char
    MOV AH,9
    LEA DX,A
    INT 21H
    
    ;take input
    mov ah,1
    int 21h
    mov bh,al
    ;Output
    MOV AH,9
    LEA DX,B
    INT 21H
    
    ;compare with A
    cmp bh,41h
    jl EXIT
    ;compare with Z
    cmp bh,5Ah
    jg COMPS
    
    or BH, 20h
    mov ah,2
    mov dl,bh
    int 21h
    jmp EXIT
    
    COMPS:
    ;compare with a
    cmp bh,61h
    jl EXIT
    ;compare with Z
    cmp bh,7Ah
    
    xor BH, 20h
    mov ah,2
    mov dl,bh
    int 21h

    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN