**free                                                                                              
                                                                                                    
dcl-s Arr char(20) dim(10) ascend;                                                                  
dcl-s n int(3) ;                                                                                    
                                                                                                    
                                                                                                    
         arr(1) = 'Cornwall';   // setup the array                                                  
         arr(2) = 'Kingston';                                                                       
         arr(3) = 'London';                                                                         
         arr(4) = 'Paris';                                                                          
         arr(5) = 'Scarborough';                                                                    
         arr(6) = 'York';                                                                           
                                                                                                    
         n = %Elem( Arr ) ;  // n = 10                                                              
                                                                                                    
         n = %LOOKUP('Paris':arr);                                                                  
         // n = 4                                                                                   
                                                                                                    
         n = %LOOKUP('Thunder Bay':arr);                                                            
         // n = 0 (not found)                                                                       
                                                                                                    
         n = %LOOKUP('Kingston':arr:3);                                                             
         // n = 0 (not found after start index)                                                     
                                                                                                    
         n = %LOOKUPLE('Paris':arr);                                                                
         // n = 4                                                                                   
                                                                                                    
         n = %LOOKUPLE('Milton':arr);                                                               
         // n = 3                                                                                   
                                                                                                    
         n = %LOOKUPGT('Sudbury':arr);                                                              
         // n = 6                                                                                   
                                                                                                    
         n = %LOOKUPGT('Yorks':arr:2:4);                                                            
        // n = 0 (not found between elements 2 and 4)                                               
                                                                                                    
       Return;                                                                                      
