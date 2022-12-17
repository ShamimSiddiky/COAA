.model small
.stack 100h
.data
msg1 dw 10,13, "Enter a number: $" 
msg2 dw 10,13, "Enter numbers only $"
msg3 dw 10,13, "The number is odd $"
msg4 dw 10,13, "The numbers even $"

.code
main proc
    mov ax,@data
    mov ds, ax 
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,31h
    jl invalid
    cmp al,39h
    jg invalid
    jmp valid
    
    invalid:
    mov ah,9
    lea dx,msg2
    int 21h
    jmp exit
    
    valid:
    TEST AL,1
    JZ EVEN      
    ;print odd
    LEA DX,msg3         
    MOV AH,9           
    INT 21H
    JMP EXIT 
    
    EVEN:         
    MOV AH,9
    LEA DX,msg4         
    INT 21H
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main