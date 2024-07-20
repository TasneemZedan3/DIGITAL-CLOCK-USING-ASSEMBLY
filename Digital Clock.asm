org 100h
;print mssg
lea dx, msg1
mov ah,9
int 21h
;fady el cx  
mov cx,0
;abda2 a-read 7arf 7arf
read:
mov ah,1
int 21h 

;check eno awel index mynf3sh 8er zero awo one
cmp cx,0
je check1
;check eno tani index lazem ykon ':'
cmp cx,2
je check3
;check eno el arakm fe el range el sa7
cmp cx,3
je check4
;check eno tani index lazem ykon ':'
cmp cx,5
je check3
;check eno el arakm fe el range el sa7
cmp cx,6
je check4
;=====================================
completeRead: 
inc cx
cmp al,48   ;a2al mn el zero symbols
jb error    
cmp al,58   ;akbr mn el 9 7rof
ja error    
sub al,48   ;convert (bageb el actual number mn el ascii)
mov ah,0
push ax 
cmp cx,8    ;iterate 8 times(ex: 10:15:28 "8 spaces")
jb read     ;yefdal ye-read l7ad ma nwsal le el 8

jmp print
;=====================================
check1:
cmp al,49
ja error2
jmp completeRead
         
check2:         
cmp al,57
ja error2
jmp completeRead

check3:
cmp al,58
jne error2
jmp completeRead

check4:
cmp al,53
ja error2
jmp completeRead
;===================================== 
;error low da5al 7aga 8er arakam         
error:
lea dx,err
mov ah,9
int 21h
;error low da5al rakam fe makan 8alat (ex:awel rakemn mynf3sh 8er 0,1)
error2:
lea dx ,err2
mov ah,9
int 21h 
;-------------------------------------------------------------------------------
print:
mov sRow,3 
sub scol,10
;stop print after the 8 iterations 
cmp cx,0
je exit
dec cx
;read from stack and print according to the given number
pop bx

cmp bx,0
je zero
cmp bx,1
je one
cmp bx,2
je two
cmp bx,3
je three
cmp bx,4
je four
cmp bx,5
je five
cmp bx,6
je six
cmp bx,7
je seven
cmp bx,8
je eight
cmp bx,9
je nine
cmp bx,58
je colon

sub sRow,2
;----------------------------------------
colon: 
mov sRow,3
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"0"
mov ah,2
int 21h

inc sRow  
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h
 
mov dl,"0"
mov ah,2
int 21h
          
add sCol,4 
jmp print 
;------------------------------------------
zero:
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h 

inc sCol
dec sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h

inc sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx," "
mov ah,2
int 21h

dec sCol
inc sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h  

inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h 

inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h  

dec sCol 
dec sRow 
inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h 

jmp print
;------------------------------------------
one: 
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"|"
mov ah,2
int 21h

inc sRow  
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h
 
mov dl,"|"
mov ah,2
int 21h
          
add sCol,4 
jmp print 

;------------------------------------------
two:  
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h

dec sCol
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h

dec sRow
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h

inc sRow
inc sRow
dec sCol 
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"|"
mov ah,2
int 21h

inc sCol
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h

add sCol,4 

jmp print
;------------------------------------------ 
three:
;dec sRow
mov dl,sCol ;6
mov dh,sRow ;3
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h

dec sCol
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h

dec sRow
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h

inc sRow
inc sRow
inc sCol 
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"|"
mov ah,2
int 21h

dec sCol
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h  

add sCol,4   

jmp print
;------------------------------------------
four:
;dec sRow
mov dl,sCol
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h

dec sCol
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h

dec sRow
inc sRow 
dec sCol
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"|"
mov ah,2
int 21h

inc  sRow
inc sCol
inc sCol  
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"|"
mov ah,2
int 21h 

add sCol,4
 
jmp print
;------------------------------------------
five:
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx," "
mov ah,2
int 21h

dec sCol
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h

dec sRow
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h

inc sRow
inc sRow
inc sCol 
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"|"
mov ah,2
int 21h

dec sCol
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h 

dec sRow
dec sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h  

add sCol,4  

jmp print
;------------------------------------------
six:
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h 

inc sCol
dec sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h

inc sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h

dec sCol
inc sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h  

inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h 

inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h  

add sCol,3    

jmp print
;------------------------------------------
seven: 
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"|"
mov ah,2
int 21h

dec sRow
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"|"
mov ah,2
int 21h

dec sCol
dec sRow
mov dl,sCol
mov dh,sRow
mov ah,2
int 10h

mov dl,"_"
mov ah,2
int 21h 

add sCol,4    

jmp print
;------------------------------------------
eight: 
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h 

inc sCol
dec sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h

inc sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h

dec sCol
inc sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h  

inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h 

inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h  

dec sCol 
dec sRow 
inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h 

add sCol,4   

jmp print
;------------------------------------------
nine: 
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h 

inc sCol
dec sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h

inc sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h

dec sCol
inc sRow
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx," "
mov ah,2
int 21h  

inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"_"
mov ah,2
int 21h 

inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h  

dec sCol 
dec sRow 
inc sCol
mov dl,sCol 
mov dh,sRow 
mov ah,2
int 10h

mov dx,"|"
mov ah,2
int 21h 

add sCol,3    
;------------------------------------------------------------------------------
jmp print

exit:
ret
msg1 db "Enter clock in this format hh:mm:ss$"  
err db "you can only enter numbers$"
err2 db "invalid entry$"
clock db '0' 
sCol db 70
sRow db 3