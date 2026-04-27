**free

//    FormaServe IBM i Training Exercises
//
//    For full disclaimer see
//      https://www.formaserve.co.uk/training-disclaimer.html
//
//    © - FormaServe Systems Ltd.  1990 - 2026
//    www.FormaServe.co.uk
                                          
// -------------------------------------------------------------
// CentreString() – centres a string within a given length
// Parameters:
//    inString   - string to centre
//    outLen     - total length of returned string
// Returns:
//    centred string padded with spaces
// Useage:
// dcl-s centred varchar(50);
// centred = CentreString('Hello', 20);
// Result: "       Hello        "
// -------------------------------------------------------------

dcl-proc CentreString export;
   dcl-pi *n varchar(500);
      inString   varchar(500) const;
      outLen     int(10)      const;
   end-pi;

   dcl-s trimmed   varchar(500);
   dcl-s result    varchar(500);
   dcl-s padLeft   int(10);
   dcl-s strLen    int(10);

   // Trim input
   trimmed = %trim(inString);
   strLen  = %len(trimmed);

   // If longer than target, return trimmed
   if strLen >= outLen;
      return trimmed;
   endif;

   // Calculate left padding
   padLeft = (outLen - strLen) / 2;

   // Build left padding using %subst on a long space literal
   result = %subst('                                                  ' : 1 : padLeft)
            + trimmed;

   // Pad right to full length
   result = %subst(result + '                                                  ' : 1 : outLen);

   return result;

end-proc;
