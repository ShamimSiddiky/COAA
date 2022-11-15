.model small
.stack 100h
.data
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov cx,255
    
    mov ah,2
    mov dl,0
        
    top:
    int 21h
    inc dl 
    
    loop top
    
    ;exit
    mov ah,4ch
    int 21h
    main endp
end main