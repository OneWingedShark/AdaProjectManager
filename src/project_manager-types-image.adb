Separate(Project_Manager.Types)
Function Image( Token : Token_ID ) return String is

   Function "+"(X:Token_ID) return String renames Token_ID'Image;
   Function Has_Prefix(S : String) return Boolean is (S(S'First+1) = '_')
     with Pre => S'Length > 2;

   Working : Constant String := +Token;

Begin
   Return Result : constant string :=
     (if Has_Prefix( Working )
      then Working(Working'First+2..Working'Last)
      else Working
     );
End Image;
