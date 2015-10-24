with
Ada.Text_IO;

Package Body Project_Manager.Actions is

   Package Body Implementations is separate;

   Dependency_Number : Positive:= Positive'First;

   Procedure Set_Name (Token : in out Master_Token.Instance'Class) is
   Begin
      Ada.Text_IO.Put_Line("--Setting Name--");
      Result.Name:= String_Holder.To_Holder("Temp");
   End Set_Name;
--
--     Procedure Add_Dependency(Token : in out Instance'Class) is
--     Begin
--        Result.Dependencies.Append( "Dependency #" & Positive'Image(Dependency_Number) );
--     End Add_Dependency;

End Project_Manager.Actions;
