**free                                                                                              
                                                                                                    
//    FormaServe IBM i Training Exercises                                                           
//                                                                                                  
//    For full disclaimer see                                                                       
//      https://www.formaserve.co.uk/training-disclaimer.html                                       
//                                                                                                  
//    © - FormaServe Systems Ltd.  1990 - 2026                                                      
//    www.FormaServe.co.uk                                                                          
                                                                                                    
ctl-opt option(*nodebugio:*srcstmt:*nounref) dftactgrp(*no)                                         
        Copyright( '(c) Copyright FormaServe Systems Ltd.  1990' );                                 
                                                                                                    
dcl-ds PgmDs psds qualified ;                                                                       
  PgmName *proc ;                                                                                   
end-ds ;                                                                                            
                                                                                                    
dcl-f exsfd1 workstn indds(Dspf) sfile(SC01:s1RRN) ;                                                
dcl-f memberp usage(*update) keyed rename(memberp : memberr);                                       
                                                                                                    
dcl-c MaxSfl 9999 ;                                                                                 
                                                                                                    
dcl-ds Dspf qualified ;                                                                             
  Exit ind pos(3) ;                                                                                 
  Refresh ind pos(5) ;                                                                              
  Create ind pos(6);                                                                                
  SflDspCtl ind pos(30) ;                                                                           
  SflDsp ind pos(31) ;                                                                              
end-ds ;                                                                                            
                                                                                                    
Q#PNAM = PgmDs.PgmName ;                                                                            
setll *loval memberr ;                                                                              
                                                                                                    
// load table records into subfile                                                                  
LoadSubfile() ;                                                                                     
                                                                                                    
// do forever!                                                                                      
dow (1 = 1) ;                                                                                       
                                                                                                    
  write sc01f ;                                                                                     
  exfmt Sc01c ;                                                                                     
                                                                                                    
  if (Dspf.Exit) ;                                                                                  
    leave ;                                                                                         
  elseif (Dspf.Refresh) ;                                                                           
    setll *loval memberr ;                                                                          
    LoadSubfile() ;                                                                                 
    iter ;                                                                                          
  elseif (Dspf.Create) ;                                                                            
    CreateMember() ;                                                                                
  endif ;                                                                                           
                                                                                                    
  if (Dspf.SflDsp) ;                                                                                
    ReadSubfile() ;                                                                                 
  endif ;                                                                                           
                                                                                                    
enddo ;                                                                                             
                                                                                                    
*inlr = *on ;                                                                                       
                                                                                                    
dcl-proc LoadSubfile ;                                                                              
                                                                                                    
  Dspf.SflDspCtl = *off ;                                                                           
  Dspf.SflDsp = *off ;                                                                              
                                                                                                    
  write Sc01c ;                                                                                     
                                                                                                    
  Dspf.SflDspCtl = *on ;                                                                            
                                                                                                    
  s1Opt = ' ' ;                                                                                     
                                                                                                    
  for s1RRN = 1 to MaxSfl ;                                                                         
    read memberr ;                                                                                  
                                                                                                    
    if (%eof) ;                                                                                     
      leave ;                                                                                       
    endif ;                                                                                         
                                                                                                    
    s1mid = member_id;                                                                              
    s1fir = first_name;                                                                             
    s1sur = last_name ;                                                                             
    s1eml = email ;                                                                                 
    s1dat = %char(join_date);                                                                       
    s1sts = statu00001 ;                                                                            
    s1nam = %trim(first_name) + ' ' + %trim(last_name) ;                                            
    s1Email = %trim(email);                                                                         
    s1Status = statu00001 ;                                                                         
                                                                                                    
    write SC01 ;                                                                                    
  endfor ;                                                                                          
                                                                                                    
  if (s1RRN > 1) ;                                                                                  
    Dspf.SflDsp = *on ;                                                                             
  endif;                                                                                            
end-proc ;                                                                                          
                                                                                                    
dcl-proc ReadSubfile ;                                                                              
                                                                                                    
  dow (1 = 1) ;                                                                                     
    readc SC01 ;                                                                                    
    if (%eof) ;                                                                                     
      leave ;                                                                                       
    endif ;                                                                                         
                                                                                                    
    select ;                                                                                        
    when s1Opt = '2';                                                                               
      SaveMemberDetail();                                                                           
                                                                                                    
    When s1Opt = '4';                                                                               
      If ConfirmDelete(S1MID);                                                                      
                                                                                                    
      ENDIF;                                                                                        
                                                                                                    
    When s1Opt = '5';                                                                               
      DisplayDetails();                                                                             
                                                                                                    
    ENDSL;                                                                                          
                                                                                                    
    //Do something depending on value in s1Opt                                                      
                                                                                                    
    s1Opt = ' ' ;                                                                                   
    update SC01 ;                                                                                   
  enddo ;                                                                                           
end-proc ;                                                                                          
                                                                                                    
Dcl-Proc SaveMemberDetail;                                                                          
                                                                                                    
END-PROC;                                                                                           
                                                                                                    
                                                                                                    
Dcl-Proc CreateMember;                                                                              
                                                                                                    
END-PROC;                                                                                           
                                                                                                    
Dcl-Proc ConfirmDelete;                                                                             
  Dcl-Pi *N Ind;                                                                                    
    memberId Packed(19:0) Const;                                                                    
  End-Pi;                                                                                           
                                                                                                    
  Dcl-S confirmed Ind Inz(*Off);                                                                    
  Dcl-S done Ind Inz(*Off);                                                                         
  dcl-s mbrkey like(member_id);                                                                     
                                                                                                    
  CNFNAME = S1nam;                                                                                  
  CNFOPT = *Blanks;                                                                                 
  CNFMSG = *Blanks;                                                                                 
  CNFMID = s1Mid ;                                                                                  
                                                                                                    
  Dow not done;                                                                                     
                                                                                                    
    ExFmt MBRDLT;                                                                                   
                                                                                                    
    If *In03;                                                                                       
      done = *On;                                                                                   
    Else;                                                                                           
      Select;                                                                                       
      When CNFOPT = 'Y';                                                                            
        confirmed = *On;                                                                            
        done = *On;                                                                                 
        mbrkey = s1mid ;                                                                            
        // update file                                                                              
        Chain mbrkey memberr ;                                                                      
        // still got a record?                                                                      
        if %found() ;                                                                               
          statu00001 = 'I' ;                                                                        
          update memberr ;                                                                          
        ENDIF;                                                                                      
                                                                                                    
      When CNFOPT = 'N' or %Trim(CNFOPT) = *Blanks;                                                 
        done = *On;                                                                                 
      Other;                                                                                        
        CNFMSG = 'Enter Y or N.';                                                                   
      EndSl;                                                                                        
    EndIf;                                                                                          
  EndDo;                                                                                            
                                                                                                    
  Return confirmed;                                                                                 
                                                                                                    
End-Proc;                                                                                           
                                                                                                    
                                                                                                    
Dcl-Proc DisplayDetails;                                                                            
                                                                                                    
  Dcl-S confirmed Ind Inz(*Off);                                                                    
  Dcl-S done Ind Inz(*Off);                                                                         
  dcl-s mbrkey like(member_id);                                                                     
                                                                                                    
  DSPMSG = *Blanks;                                                                                 
  dspMID = s1Mid ;                                                                                  
  dspEML = S1EML;                                                                                   
  dspdat = %char(%date(s1dat : *iso- ) : *dmy/) ;                                                   
  dspnam = s1nam;                                                                                   
                                                                                                    
  if %trim(s1sts) = 'A' ;                                                                           
    dspsts = 'Active';                                                                              
  else ;                                                                                            
    dspsts = 'Inactive';                                                                            
  ENDIF;                                                                                            
                                                                                                    
  ExFmt DSPMBR;                                                                                     
                                                                                                    
  Return ;                                                                                          
                                                                                                    
End-Proc;                                                                                           
