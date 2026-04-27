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
                                                                                                                                       
                                                                                                    
dcl-s string char(8) ;                                                                              
dcl-s time time ;                                                                                   
                                                                                                    
string = '12:34 PM';                                                                                
time =  %time(string:*USA);                                                                         
                                                                                                    
// time = t'12.34.00'                                                                               
dsply time;                                                                                         
                                                                                                    
                                                                                                    
//                                                                                                  
return;                                                                                             
