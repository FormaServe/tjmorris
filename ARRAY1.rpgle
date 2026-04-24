**free                                                                                              
                                                                                                    
dcl-ds emps dim(20) qualified;                                                                      
 name varchar(25);                                                                                  
id packed(9:0);                                                                                     
end-ds;                                                                                             
                                                                                                    
dcl-s Arr char(20) dim(10) ascend;                                                                  
dcl-s numEmps int(3) ;                                                                              
dcl-s n int(3) ;                                                                                    
                                                                                                    
   emps(1).name = 'Mary';                                                                           
   emps(1).id = 00138;                                                                              
   emps(2).name = 'Patrick';                                                                        
   emps(2).id = 10379;                                                                              
   emps(3).name = 'Juan';                                                                           
   emps(3).id = 06254;                                                                              
   numEmps = 3;                                                                                     
                                                                                                    
   // Search for employee 'Patrick'                                                                 
   n = %lookup('Patrick' : emps(*).name : 1 : numEmps);                                             
   // n = 2                                                                                         
                                                                                                    
   // Search for the employee with id 06254                                                         
   n = %lookup(06254 : emps(*).id : 1 : numEmps);                                                   
   // n = 3                                                                                         
                                                                                                    
   // Search for employee 'Bill' (not found)                                                        
   n = %lookup('Bill' : emps(*).name : 1 : numEmps);                                                
   // n = 0                                                                                         
                                                                                                    
return;                                                                                             
