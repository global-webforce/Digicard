# Digicard
 

Known Bugs

Supabase "copy" async method
  - this method always returns an error even if the operation is succcessful

 "type 'Null' is not a subtype of type 'String' in type cast"

 as a workaround, we wrap it inside a try catch and if the error contains the said error,
 we will just assume that the method is successful and proceed to execute next codes



Supabase Password Reset Flow
 https://github.com/orgs/supabase/discussions/3360#discussioncomment-3947228