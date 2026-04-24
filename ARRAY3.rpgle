**Free                                                                                              
                                                                                                    
dcl-s Mth packed(5:2) dim(12);                                                                      
dcl-s Tab1 char(3) dim(12) CtData PerrCd( 1 )  ;                                                    
dcl-s supp char(25) dim(10) ;                                                                       
dcl-s x int(10) ;                                                                                   
dcl-s y packed(3:0) ;                                                                               
dcl-s w int(10) ;                                                                                   
dcl-s z packed(5:2) ;                                                                               
dcl-s part char(50) ;                                                                               
dcl-s found int(10) ;                                                                               
dcl-s total packed(5:2) ;                                                                           
dcl-s number int(10) ;                                                                              
dcl-s start int(10) ;                                                                               
dcl-s Array char(20) dim(10) ascend;                                                                
dcl-s ResultArr char(20) dim(10) ascend;                                                            
dcl-s Array2 char(20) dim(10) ascend;                                                               
dcl-s month char(3);                                                                                
dcl-s Array3 packed(9:2) dim(12) ;                                                                  
                                                                                                    
                                                                                                    
       Mth = 0 ;                                                                                    
                                                                                                    
       Mth(1) = 10 ;                                                                                
       Mth(2) = 20 ;                                                                                
       Mth(3) = 30 ;                                                                                
                                                                                                    
       Supp(1) = 'ABC' ;                                                                            
       Supp(2) = 'DEF' ;                                                                            
       Supp(3) = 'GHJ' ;                                                                            
                                                                                                    
       month = 'FEB' ;                                                                              
       Found = %LookUp( month : tab1) ; // look for direct match                                    
                                                                                                    
       Part = %SubArr(Supp : 2 ) ;                                                                  
                                                                                                    
        	// Copy part of an array to another array                                                  
       ResultArr = %SubArr( Array : Start : Number ) ;                                              
                                                                                                    
         // Copy part of an array to part of another array                                          
       %SubArr( Array : x : y ) = %SubArr( Array2 : Start : Number ) ;                              
                                                                                                    
         // Sort part of an Array                                                                   
       SortA %SubArr(Array : Start : Number ) ;                                                     
                                                                                                    
        // Total of an array                                                                        
       Total = %XFoot( Array3 ) ;                                                                   
                                                                                                    
       Return ;                                                                                     
                                                                                                    
** Table of Months                                                                                  
JAN                                                                                                 
FEB                                                                                                 
MAR                                                                                                 
APR                                                                                                 
MAY                                                                                                 
JUN                                                                                                 
JUL                                                                                                 
AUG                                                                                                 
SEP                                                                                                 
OCT                                                                                                 
NOV                                                                                                 
DEC                                                                                                 
