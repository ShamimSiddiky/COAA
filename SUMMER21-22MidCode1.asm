.model small
.stack 100h
.data
a db 10,13,"Enter input: $" 
b db 10,13,"It is a number$"
c db 10,13,"Not a number$"
.code
main proc
    mov ax,@data
    mov ds,ax
    ;print msg1
    mov ah,9
    lea dx,a
    int 21h
    ;take input
    mov ah,1
    int 21h
    mov bh,al
    ;compare with 0
    cmp bh,30h
    jl notNumber
    ;compare with 9
    cmp bh,39h
    jg notNumber
    ;print msg2
    mov ah,9
    lea dx,b
    int 21h 
    
    jmp exit 
    
    notNumber:
    mov ah,9
    lea dx,c  
    int 21h
  
    exit:
    mov ah,4ch
    int 21h
    main endp
end main