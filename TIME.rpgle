**free                                                                                              
                                                                                                    
dcl-s string char(8) ;                                                                              
dcl-s time time ;                                                                                   
                                                                                                    
string = '12:34 PM';                                                                                
time =  %time(string:*USA);                                                                         
                                                                                                    
// time = t'12.34.00'                                                                               
dsply time;                                                                                         
                                                                                                    
                                                                                                    
//                                                                                                  
return;                                                                                             
