.model small
.stack 100h
.data
a db 10,13, "Enter char: $"
b db 10,13, "$"
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bh,bl
    jg print
    jmp exit
    
    print:
    xchg bh,bl
    
    mov ah,9
    lea dx,b
    int 21h 
    
    mov ah,2
    mov dl,bh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main