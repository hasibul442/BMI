include "emu8086.inc" 

    
.model small
.stack 100h
.data     
.code
main proc
MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H
          
          
    mov ax, @data
    mov ds, ax
    define_scan_num 
 define_clear_screen
;================== Welcome page ====================== 
    
    GOTOXY 20, 5  
    printn "||======================================||"
    GOTOXY 20, 6
    printn "||                                      ||"
    GOTOXY 20, 7
    printn "||      **   BMI CALCULATOR  **         ||"
    GOTOXY 20, 8
    printn "||                                      ||"
    GOTOXY 20, 9
    printn "||______________________________________||"
    GOTOXY 20, 10
    printn "||                                      ||"
    GOTOXY 20, 11
    printn "||       => SCIENTIFIC WARRIORS <=      ||"
    GOTOXY 20, 12
    printn "||                                      ||"
    GOTOXY 20, 13
    printn "||======================================||"
    
    ;space:
    ;printn ""
    ;loop space
     
    call clear_screen
    mov cx, 0
    
MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H
    GOTOXY 0, 1     ;welcome complt
      
    MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h      
 ;===================================================================
  GOTOXY 30, 2
    printn "INFO: 1 fit = 30cm"  
       
 GOTOXY 15, 5
PRINT 'Give your Hight in cm:  '         
    CALL SCAN_NUM                         
    MOV [0200h],CX                       
    MOV AX,CX                             
                             
 
  
    GOTOXY 15, 7
    PRINT 'Give Weight in kg:  ' 
    CALL SCAN_NUM                       
    MOV [0202h],CX                       
    MOV CX,0h 
    
                      MOV BX,[0202h] 
                      DIV BX          
                      ;MOV [0204h],AX 
                      ;MOV [0206h],DX
                      mov dx,ax
                      
                      cmp dx, 1
                      JE Over
                      
                      cmp dx, 2
                      JE Over
                      
                      cmp dx, 3
                      JE Perfect
    
                     cmp dx, 4
                      JE Under
                      
                      cmp dx, 5
                      JE Under
                      
     
    Under:
    GOTOXY 35, 11
        print "your Weight is: Under Weight "
        jmp press
  Perfect:
  GOTOXY 35, 11
       print "your Weight is: Perfect Weight "
       jmp press 
    Over:
    GOTOXY 35, 11
       print "your Weight is: Over Weight "
       jmp press 
       
       
       press:
       
       GOTOXY 2,14
       print "1. TO see The Instruction for gain the perfect weight if you are Under Weight."
       
       
       GOTOXY 2,16 
       print "2. TO see The Instruction for gain the perfect weight if you are Over Weight."
      GOTOXY 27, 23
      
    print "Press any key for next page.."
    mov ah, 0
    int 16h
    
       call clear_screen


MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H
          MOV AX,0h   
          MOV BX,0h
          MOV CX,0h
          MOV DX,0h 
 
       GOTOXY 27, 2
    print "Press key 1 or 2 see.."
    mov ah, 01h
    int 21h
    
    
    cmp al, '1'
    JE P1
    cmp al,'2'
    JE P2
    
    P1:
    
    GOTOXY 2, 4
    print "1.Eat more and sleep 8hrs a day"
    GOTOXY 2, 6
    print "2.Absorb high calorie food(Potato, Brown Rice,Chicken breast,CheckPeas,Almond,Sweet potato etc.)" 
    GOTOXY 2, 9
    print "3.Drink at least 3L water per day"
    GOTOXY 2, 11
    print "4.Eat vegetables"
    GOTOXY 2, 13
    print "5.One glass of Milk and one whole Egg each Day"
    GOTOXY 27, 23
    print "Press any key to exit.."
    jmp exit
    
    P2:
     
    GOTOXY 2, 4
    print "1.Try to follow a low calorie Healthy Diet"
    GOTOXY 2, 6
    print "2.Eat high protein and avoid Fast food"
    GOTOXY 2, 8
    print "3.Do some Workout for weight lose(Walking,Crunching,Running,Ropping)"
    GOTOXY 2, 10
    print "4.Eat vegetables containing Omega3 "
    GOTOXY 27, 23
    print "Press any key to exit.." 
    jmp exit
    
    exit:
    mov ah, 0
    int 16h
    call clear_screen
    
;==================== Credit ========================= 
MOV AH, 06h    ; Scroll up function
XOR AL, AL     ; Clear entire screen
XOR CX, CX     ; Upper left corner CH=row, CL=column
MOV DX, 184FH  ; lower right corner DH=row, DL=column 
MOV BH, 1Eh    ; YellowOnBlue
INT 10H
    
    GOTOXY 36, 2
    printn "Credits"
    GOTOXY 34, 3
    print "-----------"  
    
    GOTOXY 28, 13
    printn "Nupur Chandra Pal"
    GOTOXY 30, 15
    printn "ID: 152-15-5762"
    
    GOTOXY 50, 18
    printn "Sanjoy Kumar Ghosh"
    GOTOXY 52, 20
    printn "ID: 152-15-5957"
    
    GOTOXY 6, 18
    printn "Md. Zahidul Hasan"
    GOTOXY 7, 20
    printn "ID: 152-15-5547"
    
    GOTOXY 47, 6
    printn "Mohammad Hasibul Hasan"
    GOTOXY 50, 8
    printn "ID: 152-15-5859"
    
    GOTOXY 6, 6
    printn "Monzurul Haque Nobel"  
    GOTOXY 7, 8
    printn "ID: 152-15-5546" 
    
    
    GOTOXY 27, 23
    print "Press any key to exit.."
    mov ah, 0
    int 16h                                                                  
    mov ah, 4ch
    int 21h 

end main