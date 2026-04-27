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
                                                                                                                                        
                                                                                                    
// customer file                                                                                    
dcl-f customer rename(custr:custRec);                                                               
Dcl-S CustomerAge Packed(3:0);                                                                      
                                                                                                    
// Define a standalone character variable with length                                               
Dcl-S numKeys packed(3:0);                                                                          
Dcl-DS custRecKeys likerec(custRec : *key) ;                                                        
                                                                                                    
// custRecKeys is a qualified data structure                                                        
custRecKeys.name = customer;                                                                        
custRecKeys.postcode = postcode;                                                                    
                                                                                                    
// The *KEY data structure is used as the search argument for CHAIN                                 
chain %kds(custRecKeys) custRec;                                                                    
                                                                                                    
// The number of keys can be a constant                                                             
chain %kds(custRecKeys : 2) custRec;                                                                
                                                                                                    
// The number of keys can be a variable or an expression                                            
numKeys = 1;                                                                                        
                                                                                                    
chain %kds(custRecKeys : numKeys) custRec;                                                          
chain %kds(custRecKeys : numKeys + 1) custRec;                                                      
                                                                                                    
*inlr = *On;                                                                                        
