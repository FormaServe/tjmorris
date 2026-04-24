**free                                                                                              
                                                                                                    
dcl-s string char(26);                                                                              
dcl-s DateISO date(*iso) inz(*job);                                                                 
dcl-s date date ;                                                                                   
dcl-s timestamp timestamp ;                                                                         
dcl-s timest timestamp ;                                                                            
                                                                                                    
string = '1960-09-29-12.34.56.000000';                                                              
                                                                                                    
// timest now contains z'1960-09-29-12.34.56.000000'                                                
timest =  %timestamp(string);                                                                       
                                                                                                    
date = d'2001-03-05';                                                                               
timest =  %timestamp(date);                                                                         
// timest now contains z'2001-03-05-00.00.00.000000'                                                
                                                                                                    
dsply (%timestamp(*SYS));                                                                           
// It displays 2014-06-27-01.02.03.421345                                                           
                                                                                                    
dsply (%timestamp(*SYS : 1));                                                                       
// It displays 2014-06-27-01.02.03.4                                                                
                                                                                                    
dsply (%timestamp(*SYS : 0));                                                                       
// It displays 2014-06-27-01.02.03                                                                  
                                                                                                    
dsply (%timestamp(*UNIQUE));                                                                        
// It displays 2014-06-27-01.02.03.923481000244                                                     
                                                                                                    
return ;                                                                                            
