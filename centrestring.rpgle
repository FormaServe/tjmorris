// -------------------------------------------------------------
// CentreString() – centres a string within a given length
// Parameters:
//    inString   - string to centre
//    outLen     - total length of returned string
// Returns:
//    centred string padded with spaces
// -------------------------------------------------------------
dcl-proc CentreString export;
   dcl-pi *n varchar(500);
      inString   varchar(500) const;
      outLen     int(10)      const;
   end-pi;

   dcl-s trimmed     varchar(500);
   dcl-s work        varchar(500);
   dcl-s padLeft     int(10);
   dcl-s strLen      int(10);

   // Trim the input
   trimmed = %trim(inString);
   strLen  = %len(trimmed);

   // If the string is longer than the target, just return it
   if strLen >= outLen;
      return trimmed;
   endif;

   // Calculate left padding
   padLeft = (outLen - strLen) / 2;

   // Build the centred string
   work = %subst(%xlate(x'00':x'20':trimmed) : 1 : strLen); // ensure clean chars
   work = %trimr(%char(' ':padLeft)) + trimmed;

   // Pad right to full length
   return %subst(work + %char(' ' : outLen) : 1 : outLen);

end-proc;
