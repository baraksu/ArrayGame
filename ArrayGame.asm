;----------------------------------------------------------------------------------------------------------------------------------------------------
; Made by © Yehonatan Gurfinkel
;----------------------------------------------------------------------------------------------------------------------------------------------------

.MODEL small
.STACK 100h

.DATA
	
	
	; K has the number of elements in the original array (Here it is 15).
	k db 15d

	; Array2 has k-1 elements.
	array2 db 14d dup (?)

	; Array1 has k elements.
	array1 db 15d dup (?)
	
	; Sum is used to calculate the sum of array2, which is needed to find the missing element.
	sum dw 0
	


	; Those are the messages I print to the screen.
	arrMsg db 'Here is Array2: ', '$'
	eleMsg db ', ', '$'
	endMsg db 13,10,'The missing number is: ', '$'
	 
	 
	 
	; Those are the messages I print to the screen.	
	primeMsg db 13,10,'And it is a prime number!', '$'
	compMsg db 13,10,'And it is a composite number!', '$'  



.CODE


Start:


    mov ax, @data
    mov ds, ax
    
	
    
    ; Here I push array1's offset (bx) and the size of array1 (cx) and call the function "SetArray1".  
    mov bx, offset array1   
    xor cx, cx  
    mov cl, k
    push bx 
    push cx
    call SetArray1
	
	
	
	; Here is print the message "".
	push ax
	push dx
	mov ah, 09h
	lea dx, arrMsg
	int 21h
	pop dx
    	pop ax	
    
	
	
	; Array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
	; Array2 = []
	
	
	; Here is a short explanation about "setArray2". For more information go to README.
	; The loop "setArray2" has 4 main parts:
	
	
	;	1. Chooses a random element between the first and the 15th element in array1.
	;	2. Puts this number in the 14th place in array2.
	;	3. Replaces the random number we have chosen in array1 with the 15th element of array1.
	;   	4. Prints the element we just added to array2 and adds it's value to sum.


	; Continue to do it for the 14th and 13th and 12th elements...
	
	
	
	mov cl, k
	dec cl
	setArray2: 
		
		
	    ; Chooses a random number from array1.
	    ranNum: 
            call Random

            ; This condition makes sure that the value is be greater then the current array size.
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
        
		
		
        ; This puts the taken random number and puts it in the last empty element of the array2.
        mov bx, offset array2
        add bx, cx
        sub bx, 1
        mov [bx], al
        
		
		
        ; Prints the number we have moved into array2.
        mov ah, 0
        push ax
        call PrintNumber
        
		
    
        ; Prints ", " (unless it is the last element).
        cmp cx, 1
        je dontP
        push ax
        push dx
        mov ah, 09h
        lea dx, eleMsg
        int 21h
        pop dx
        pop ax 
        
		
		
        dontP:
            ; The last thing we do is to add the element we have moved into array2, into SUM;
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
    
	
	
    ; Prints "The missing number is: ".
    push ax
    push dx
    mov ah, 09h
    lea dx, endMsg
    int 21h
    pop dx
    pop ax
    
	
	
    ; Prints the missing number. 
    push dx
    call PrintNumber
	
	
    ; Check if it is prime.
    push dx
    call IsPrime
     
     
          
Exit:
    mov ah, 4Ch
    mov al, 0
    int 21h
    
    


; SetArray1:
; Input: The offset of the array, and the size of the array.
; Proccess: The procedure goes in every element of the array one by one and sets their values: 1,2,3,4..     
; Output: Array1 will now be: { 1,2,3,4,5...k } 

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
     
    


; Random:
; Input: No input.
; Proccess: This procedure uses the function we have learnt to generate a random number between 0-15.      
; Output: The register dl will hold a random value between 0-15.

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
       
       


; PrintNumber:
; Input: A two digit decimal value.
; Proccess: The procedure compares the number to 10. If it is lower then 10 (0-9) it prints the digit. If it is higher or equal two 10, the procedure prints "1" and then subtract 10 from it and prints the digit.
; Output: The value of the input number is printed to the screen.

proc PrintNumber
    
    push dx
    push ax
    push cx   
    
    push bp
    mov bp, sp 
    
    mov dx, [bp+10]
    
    cmp dx, 10
    jl oneDigit
    
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

        
    

; PrintDigit:
; Input: A decimal value between 0-9.
; Proccess: The procedure adds 30h to the digit and prints the ascii digit of the new value.
; Output: The input digit will be printed to the screen (Instead of the ascii character that has it's value).
    
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
      
      
	  
      
; IsPrime:
; Input: A decimal number.
; Proccess: The procedure loops throguh every integer that is smaller then the number and check if the number is divisble by it. If it is - it is not prime.  If the procedure goed through all the numbers except "1" and none of them were divisble - it is a prime.
; Output: Prints "And it is a prime number!" if it is prime or "And it is a composite number!" if it is not.  

proc IsPrime
    
    push dx
    push cx 
    push ax 
    
    push bp
    mov bp, sp   
       
       
       
    mov cx, [bp+10]         
          
    primeCheck:
        
       cmp cx, 2
       je prime
      
       mov ax, [bp+10]
       dec cx
       div cl
       cmp ah, 0
       je composite
       inc cx
       loop primeCheck
           
       
           
           
    prime:
    	mov ah, 09h
    	lea dx, primeMsg
    	int 21h
        jmp endPrime 
        
       
    
    
    composite:
    	mov ah, 09h
    	lea dx, compMsg
    	int 21h 
           
    
    
    endPrime:
	pop bp
	pop ax
	pop cx
	pop dx 

	ret 2      
    
endp IsPrime	




END Start
