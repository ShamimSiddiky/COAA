.model small
.stack 100h
.data
a dw "?$"
b dw 10,13,"The difference of $"
c dw " and $"
d dw " is $"
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;print ?
    mov ah,9
    lea dx,a
    int 21h
    ;1st input
    mov ah,1
    int 21h
    mov bh,al
    ;2nd input
    mov ah,1
    int 21h
    mov bl,al
    ;print first msg
    mov ah,9
    lea dx,b
    int 21h
    ;display 1st number
    mov ah,2 
    mov dl,bh
    int 21h
    ;print and
    mov ah,9
    lea dx,c
    int 21h
    ;print 2nd number
    mov ah,2 
    mov dl,bl
    int 21h
    ;print is msg
    mov ah,9
    lea dx,d
    int 21h
    ;substract
    sub bh,bl
    add bh,48
    
    mov ah,2
    mov dl,bh
    int 21h

    ;exit
    mov ah,4ch
    int 21h
    main endp
end main