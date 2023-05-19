.MODEL small
.STACK 100h

.DATA
           
    k db 15d
    array2 db 14d dup (?)
    array1 db 15d dup (?)
    
    sum dw 0
    
    msg1 db 13,10,'The missing number is: ', '$'
    msg2 db ', ', '$'

.CODE

Start:

    mov ax, @data
    mov ds, ax
    
    
    ; The function accepts the array's offset and it's size, and fill its with the numbers: 1,2,3,4,5...k    
    mov bx, offset array1   
    xor cx, cx  
    mov cl, k
    
    push bx 
    push cx
    call SetArray1
    
    
	mov cl, k
	dec cl
	
	setArray2: 

	    ranNum: 
	        
	        ; The function random: This procedure generates a random number between 0 and 15 (15 is k) and puts it's value inside dl. 
            call Random

            ; This condition makes sure that the value wont be longer then the current array size.
            cmp dx, cx
            jge ranNum
        
        
        ; This moves the chosen random number into al and saves it's index at ah.
        mov bx, offset array1
        add bx, dx
        mov al, [bx]
        mov ah, bl
        
        ; This moves the last element of the array into the place we just took the number from.
        sub bx, dx  
        add bx, cx 
        mov dl ,[bx]
        mov bh, 0
        mov bl, ah
        mov [bx], dl
        
        ; This puts the taken random number and puts it in the last empty element of the second array.
        mov bx, offset array2
        add bx, cx
        sub bx, 1
        mov [bx], al
        
        ; Prints the number so the user could see array 2
        mov ah, 0
        push ax
        call PrintNumber
        
        cmp cx, 1
        je dontP
        
        ; Prints ", "
        push ax
        push dx
        mov ah, 09h
        lea dx, msg2
        int 21h
        pop dx
        pop ax 
        
        dontP:
            ; This adds the elemnt into SUM;
            add [sum], ax
        
        loop setArray2
        
    ; This calculates the sum of array1 using the formula (2*1+(k-1))*0.5k
    mov cl, k
    inc cl
    mov al, k
    mul cl
    shr ax, 1
        
    ; The difference between array1's sum and array2's sum is the missing number.
    sub ax, [sum] 
    
    push ax
    push dx
    mov ah, 09h
    lea dx, msg1
    int 21h
    pop dx
    pop ax
    
    push dx
    call PrintNumber
     
     
          
Exit:
    mov ah, 4Ch
    mov al, 0
    int 21h
    
    
    

proc SetArray1
    
    push dx
    push bx 
    push cx 
    
    push bp
    mov bp, sp 
    
    mov bx, [bp+12]
    mov cx, [bp+10]

    mov dx, 1
    
	setArr:
		mov [bx], dx
		inc bx
		inc dx
		loop setArr
    
    pop bp
    pop cx
    pop bx
    pop dx
    
    ret 4      
    
endp SetArray1
     
    

proc Random
    
    push ax 
    push cx  
    
    mov ah, 2ch
    int 21h
    mov dh, 0
    and dl, 00001111b
    
    pop cx
    pop ax
    
    ret     
    
endp Random 
       
       

proc PrintNumber
    
    push dx
    push ax
    push cx   
    
    push bp
    mov bp, sp 
    
    mov dx, [bp+10]
    
    ; If the number is bigger the 9 we can not print it as a number.
    cmp dx, 10
    jl oneDigit
    
    ; We will print "1" and then the second digit of the number. So if we wanna print 16 we will print 1 and then 6.
    twoDigit:
        mov bx, 1
        push bx
        call PrintDigit
        sub al, 10

    oneDigit:
        push ax
        call PrintDigit
    
    pop bp
    pop cx
    pop ax
    pop dx
    
    ret 2     
    
endp PrintNumber

        
        
proc PrintDigit
    
    push dx
    push ax   
    
    push bp
    mov bp, sp 
    
    mov dx, [bp+8]
    
    add dl, 30h
    mov ah, 02h
    int 021h
    
    pop bp
    pop ax
    pop dx
    
    ret 2     
    
endp PrintDigit
      
      
      
	
END Start