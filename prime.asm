.MODEL small
.STACK 100h

.DATA
  
    primeMsg db 13,10,'And it is a prime number!', '$'
	compMsg db 13,10,'And it is a composite number!', '$'  
  
     
.CODE
     
Start:

    mov ax, @data
    mov ds, ax
    
         
    mov ax, 13d
    push ax
    call IsPrime
     
     
          
Exit:
    mov ah, 4Ch
    mov al, 0
    int 21h
    
    


; IsPrime:
; Input: A decimal number.
; Proccess: The procedure loops throguh every integer that is smaller then the number and check if the number is divisble by it. If it is - it is not prime.     
; Output: "And it is a prime number!" if it is prime and "And it is a composite number!e" if it is not.  

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