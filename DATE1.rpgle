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
                                                                                                                                       
                                                                                                    
dcl-s DateISO        date(*iso)   inz(*job);                                                        
dcl-s DateChar       char(6);                                                                       
dcl-s String         char(6)      inz('040356');                                                    
dcl-s Days           int(10);                                                                       
dcl-s CurrentDate    date(*iso)   inz(*job);                                                        
dcl-s CurrentTime    time;                                                                          
dcl-s Hour           packed(2:0);                                                                   
dcl-s Date           date(*iso);                                                                    
dcl-s Time           time;                                                                          
dcl-s Minutes        packed(2:0);                                                                   
dcl-s Year           packed(4:0);                                                                   
dcl-s TimeC          char(8);                                                                       
dcl-s TString        char(26);                                                                      
dcl-s TimeStr        char(10);                                                                      
dcl-s MoreDates      date(*iso)   inz(d'2007-03-09');                                               
                                                                                                    
                                                                                                    
       CurrentDate = d'2005-07-31' ;   // Setup Date                                                
       CurrentTime = t'15.59.00' ;     // Setup Time                                                
                                                                                                    
       Test(de) *DMY0 DateChar ;  //  Check Date is valid                                           
                                                                                                    
       If Not %Error;  //  Any Errors?                                                              
         CurrentDate = %Date( DateChar : *DMY0) ;                                                   
       EndIf;                                                                                       
                                                                                                    
         // Change date format from ISO format to DMY in character format                           
       DateChar = %Char( DateISO : *DMY0 ) ;   // DateChar is now 011204                            
                                                                                                    
         // Convert character to *ISO date format                                                   
       String = '040356' ;                                                                          
       DateISO = %Date( String : *DMY0 ) ;  // DateISO is now 1956-03-04                            
                                                                                                    
        // Add 10 days to DateISO                                                                   
       Days = 10 ;                                                                                  
       DateISO = DateISO + %Days( Days ) ;                                                          
                                                                                                    
         //  How many days between the DateISO & the current date?                                  
       Days = %Diff( CurrentDate : DateISO : *D ) ;                                                 
                                                                                                    
         //  Get the current time                                                                   
       CurrentTime = %Time() ;                                                                      
                                                                                                    
         //  Add 10 Hours to current time                                                           
       Hour = 10 ;                                                                                  
       CurrentTime = CurrentTime + %Hours( Hour ) ;                                                 
                                                                                                    
         // Extract Date/Time Portions                                                              
       Date = d'2004-07-17' ;                                                                       
       Time = t'15.18.41' ;                                                                         
                                                                                                    
       Year = %SubDt( Date : *Years ) ; // Year = 2004                                              
       Minutes = %SubDt( Time :*Mn ) ;  // Minutes = 18                                             
                                                                                                    
         // Convert character to time format                                                        
       TimeC = '11:12:56' ;                                                                         
       CurrentTime = %Time( TimeC : *HMS ) ;                                                        
                                                                                                    
         // Convert String to a Timestamp                                                           
       TString = '2004-07-10-15.24.56.000000' ;                                                     
       TimeStr = %Timestamp( TString ) ;                                                            
                                                                                                    
         // Extract the day from a date                                                             
       Days = %SubDt( DateISO : *D ) ;                                                              
                                                                                                    
       Return ;  //  All Done!                                                                      
