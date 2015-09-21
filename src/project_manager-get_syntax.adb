with
Ada.Characters.Handling,
Ada.Strings.Maps.Constants,
Project_Manager.Master_Token,
Project_Manager.Types,

-- OpenToken Dependencies.
OpenToken.Recognizer.String,
OpenToken.Recognizer.Character_Set,
OpenToken.Recognizer.Nothing,
OpenToken.Recognizer.Line_Comment,
OpenToken.Recognizer.End_Of_File,
OpenToken.Recognizer.Identifier,
OpenToken.Recognizer.String,
OpenToken.Recognizer.Separator,
OpenToken.Recognizer.Keyword;

use
Ada.Strings.Maps,
Ada.Strings.Maps.Constants,
Project_Manager.Master_Token,
Project_Manager.Types;

Function Project_Manager.Get_Syntax Return Project_Manager.Tokenizer.Syntax is

   Function To_Upper( S : String ) return String is
      Use Ada.Characters.Handling;
   begin
      Return Result : String := S do
         for Ch of Result loop
            Ch:= To_Upper(Ch);
         end loop;
      end return;
   end To_Upper;

   Package R renames OpenToken.Recognizer;
   Function Keyword( S : String; Case_Sensitive : Boolean := False ) return Tokenizer.Recognizable_Token is
     ( Tokenizer.Get (R.Keyword.Get(S, Case_Sensitive  => Case_Sensitive)) );
   Function Separator( S : String ) return Tokenizer.Recognizable_Token is
     ( Tokenizer.Get (R.Separator.Get(S)) );

   Default : constant Tokenizer.Recognizable_Token:=
     Project_Manager.Tokenizer.Get (OpenToken.Recognizer.Nothing.Get);


begin
   Return Result : constant Project_Manager.Tokenizer.Syntax :=
     (
      t_Project		=> Keyword("Project"),
      t_Is		=> Keyword("Is"),
      t_Type		=> Keyword("Type"),
      t_End		=> Keyword("End"),
      t_with		=> Keyword("With"),

      t_Comment		=> Tokenizer.Get(R.Line_Comment.Get("--", True)),
      Whitespace	=> Tokenizer.Get(R.Character_Set.Get
                                          (R.Character_Set.Standard_Whitespace)
                                             ),
      Name		=> Tokenizer.Get(
                                 R.Identifier.Get(
                                  Start_Chars   => Letter_Set,
                                  Body_Chars    => Alphanumeric_Set or To_Set('_'),
                                  Has_Separator => False
                                 )
                                ),
      Bad_Token		=> Default,
      End_of_File	=> Tokenizer.Get(R.End_Of_File.Get(True))

     );

--     Return (Others => Default);
End Project_Manager.Get_Syntax;
