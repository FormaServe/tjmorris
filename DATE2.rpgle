**free

//    FormaServe IBM i Training Exercises
//
//    For full disclaimer see
//      https://www.formaserve.co.uk/training-disclaimer.html
//
//    © - FormaServe Systems Ltd.  1990 - 2026
//    www.FormaServe.co.uk

ctl-opt option(*nodebugio:*srcstmt:*nounref)
        Copyright( '(c) Copyright FormaServe Systems Ltd.  1990' )
        BndDir( 'ILEBND' : 'QC2LE' )  ;
                                                                                                                                       
                                                                                                    
// --- Declare date variables ---                                                                   
dcl-s Today       date;                                                                             
dcl-s MyTime      time;                                                                             
dcl-s MyTS        timestamp;                                                                        
dcl-s DateStr     char(10);                                                                         
dcl-s EurStr      char(10);                                                                         
dcl-s AgeInDays   int(10);                                                                          
                                                                                                    
// --- Get current date / time ---                                                                  
Today  = %date();                                                                                   
MyTime = %time();                                                                                   
MyTS   = %timestamp();                                                                              
                                                                                                    
// --  Convert date -> character (ISO) ---                                                          
DateStr = %char(Today : *ISO);  // '2024-03-15'                                                     
                                                                                                    
// --- Convert date -> character (EUR) ---                                                          
EurStr  = %char(Today : *EUR);  // '15.03.2024'                                                     
                                                                                                    
// --- Convert character -> date ---                                                                
Today   = %date('2024-03-15' : *ISO);                                                               
                                                                                                    
// --- Date arithmetic ---                                                                          
Today  += %days(30);     // add 30 days                                                             
Today  += %months(3);    // add 3 months                                                            
Today  -= %years(1);     // subtract 1 year                                                         
                                                                                                    
// --- Difference between dates ---                                                                 
AgeInDays = %diff(Today : %date('2000-01-01':*ISO) : *DAYS);                                        
                                                                                                    
return ;                                                                                            
