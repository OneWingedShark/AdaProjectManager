with
Project_Manager.Master_Token.Nonterminal_Instance,
Project_Manager.Master_Token.List_Instance,
Project_Manager.Types,
Ada.Containers.Indefinite_Holders,
Ada.Containers.Indefinite_Vectors;

Package Project_Manager.Actions is
   Use Project_Manager.Master_Token;
   Package NT renames Nonterminal_Instance;

   procedure Set_Name (Token : in out Master_Token.Instance'Class);
--     procedure Add_Dependency(Token : in out Instance'Class);


--------------------------------------------------------------------------------

   Package String_List is new Ada.Containers.Indefinite_Vectors(Positive,String);
   Package String_Holder is new Ada.Containers.Indefinite_Holders(String);

   Type Result_Type is record
      Name         : String_Holder.Holder;
      Dependencies : String_List.Vector;
   end record;

   Function Get_Result return Result_Type;


   Project_Name : constant NT.Synthesize;

Private
   Result : Result_Type;

   package Implementations is
      package PMT	 renames Project_Manager.Types;
      package Token_List renames List_Instance;

      procedure Project_Name( New_Token : out nt.Class;
                              Source    : in  Token_List.Instance'Class;
                              To_ID     : in  PMT.Token_ID);
   end Implementations;

   Package I renames Implementations;

   Project_Name : constant nt.Synthesize:= I.Project_Name'Access;
--------------------------------------------------------------------------------
--   Synthesize
--------------------------------------------------------------------------------
--     type Synthesize is access procedure (New_Token : out Class;
--                                          Source    : in  Token_List.Instance'Class;
--                                          To_ID     : in  Token_ID);

   Function Get_Result return Result_Type is (Result);
End Project_Manager.Actions;
