.model small
.stack 100h
.data
msg1 db "Input: $"
msg2 db "Output: $"



.code
    main proc
        mov ax, @data
        mov ds, ax
        
        xor ax, ax
        xor cx, cx
        
        mov ah, 9
        lea dx, msg1
        int 21h
        
        mov ah, 1
        while1:
            int 21h
            cmp al, 0DH
            je l0
            push ax
            inc cx
            jmp while1
            
        l0:
        mov ah, 2
        mov dl, 0Ah
        int 21h
        mov dl, 0Dh
        int 21h
        
        mov ah, 9
        lea dx, msg2
        int 21h
        xor dx, dx
        
        while2:
            mov ah, 2
            pop dx
            int 21h
            loop while2
 
        exit:
            mov ah, 4ch
            int 21h
            main endp
    end main