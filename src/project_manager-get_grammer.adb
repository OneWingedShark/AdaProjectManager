With
Ada.Text_IO,
Project_Manager.Actions,
OpenToken.Token.Sequence,
OpenToken.Token.Selection,
OpenToken.Token.List_Mixin,
OpenToken.Token.Enumerated.Integer,

     Project_Manager.Debugging.Print_Value,
     Project_Manager.Types,
     Project_Manager.Master_Token,
     Project_Manager.Tokenizer,

Project_Manager.Master_Token.List_Instance,
Project_Manager.Master_Token.Nonterminal_Instance,
Project_Manager.Master_Token.Production_List,
Project_Manager.Master_Token.Production;

Function Project_Manager.Get_Grammer return Project_Manager.Master_Token.Production_List.Instance is
   Package Nonterminal     renames Project_Manager.Master_Token.Nonterminal_Instance;
   Package Token_List      renames Project_Manager.Master_Token.List_Instance;
   Package Production_List renames Project_Manager.Master_Token.Production_List;

   Use Project_Manager.Types, Project_Manager.Master_Token;

   --------------------------------------
   use type Production.Instance;        --  "<="
   use type Production_List.Instance;   --  "and"
   use type Production.Right_Hand_Side; --  "+"
   use type Token_List.Instance;        --  "&"

   package Integer_Token  is new Master_Token.Integer;
--     package Operation_List is new OpenToken.Token.List_Mixin (Integer_Token.Instance, Integer_Token.Instance);
--
--     procedure Times_Element
--       (Match   : in out Operation_List.Instance;
--        Element : in     Integer_Token.Class)
--     is begin
--        Match.Value := Match.Value * Element.Value;
--     end Times_Element;

   d_Project	: aliased Master_Token.class := Master_Token.Get(t_Project);
   d_Is		: aliased Master_Token.class := Master_Token.Get(t_Is);
   d_Type	: aliased Master_Token.class := Master_Token.Get(t_Type);
   d_End	: aliased Master_Token.class := Master_Token.Get(t_End);
   d_with	: aliased Master_Token.class := Master_Token.Get(t_with);
   d_Comment	: aliased Master_Token.class := Master_Token.Get(t_Comment);
      --Whitespace

   -- Token : in out Instance'Class
   Procedure Build_Name( Token : in out Master_Token.Instance'Class ) is
   Begin
      Ada.Text_IO.Put_Line("!!!!!!!!! TEST !!!!!!!!!!");
   End Build_Name;


   Name          : aliased Master_Token.class := Master_Token.Get(Types.Name, "NAME", Build => Build_Name'Unrestricted_Access);


--     procedure Print (Item : in Nonterminal_Instance.Synthesize) renames Debugging.Print_Action;
--   procedure Print (Item : in Instance) is null;--renames Project_Manager.Debugging.Print_Instance.Print;
--       procedure Print (Item : in Production.Right_Hand_Side) is null; --renames Project_Manager.Debugging.Print_Instance.Print;
procedure Print  (New_Token :    out Nonterminal_Instance.Class;
   Source    : in     List_Instance.Instance'Class;
   To_ID     : in     Project_Manager.Types.Token_ID) renames Project_Manager.Debugging.Print_Value;

   package Sequence	renames OpenToken.Token.Sequence;
   package Selection	renames OpenToken.Token.Selection;


   package Nonterminals is
      package Actions renames Project_Manager.Actions;

      nt_Prime                  : aliased Nonterminal.Class  := Nonterminal.Get (S_Prime);
      nt_Start                  : aliased Nonterminal.Class  := Nonterminal.Get (S_Start);
      nt_Project                : aliased Nonterminal.Class  := Nonterminal.Get (P_Project);

      nt_Project_Header         : aliased Nonterminal.Class  := Nonterminal.Get (p_Project_Header);
      nt_Project_Name           : aliased Nonterminal.Class  := Nonterminal.Get (p_Project_Name, Build => Actions.Set_Name'Access);
      nt_Project_Body           : aliased Nonterminal.Class  := Nonterminal.Get (p_Project_Body);



--      nt_Context_List           : aliased Nonterminal.Class  := Nonterminal.Token_List.Print.Print
--        Specification         : aliased Nonterminal.Class  := Nonterminal.Get (p_Specification);
--        Import_Declaration    : aliased Nonterminal.Class  := Nonterminal.Get (p_Import_Declaration);
--        Structure_Declaration : aliased Nonterminal.Class  := Nonterminal.Get (p_Structure_Declaration);
--        Structure_Statement   : aliased Nonterminal.Class  := Nonterminal.Get (p_Structure_Statement);
--        Production            : aliased Nonterminal.Class  := Nonterminal.Get (p_Production);
--        Attribute_Production  : aliased Nonterminal.Class  := Nonterminal.Get (p_attribute_production);
--        Attribute             : aliased Nonterminal.Class  := Nonterminal.Get (p_attribute);
--        Class_Production      : aliased Nonterminal.Class  := Nonterminal.Get (p_class_production);
--
--        t_Colon  : aliased IDL.Enumerations.Tokens.Class := IDL.Enumerations.Tokens.Get( Colon );
--        t_Equals : aliased IDL.Enumerations.Tokens.Class := IDL.Enumerations.Tokens.Get( Equal );
--
      EOF                   : aliased Master_Token.Class := Master_Token.Get (End_Of_File);
   end Nonterminals;

--OpenToken.Production.Nonterminal.Token_List.Print.Print
   --use Production, Production_List, Nonterminal, Token_List;
   use type Token_List.Instance;
   use type Production.Right_Hand_Side;
   use type Production.Instance;
   use type Production_List.Instance;
   use Nonterminals;
Begin
   Return Grammar : constant Production_List.Instance:=
     nt_Prime		<= nt_Start & EOF                  + Print'Access     and
     nt_Start           <= nt_Project                                         and
     nt_Project		<= nt_Project_Header & d_is & d_end + Master_Token.Nonterminal_Instance.Synthesize_Self and
     nt_Project_Header	<= d_project & nt_Project_Name + Master_Token.Nonterminal_Instance.Synthesize_Self and
--       nt_Project_Body	<= Master_Token.Nonterminal_Instance.Synthesize_Self and
     nt_Project_Name	<= Name + Actions.Project_Name
       --Master_Token.Nonterminal_Instance.Synthesize_Self
       --Name + Print'Access

   do
      null;
--        Nonterminal.Token_List.Print.Print(Grammar);
--        Master_Token.List_Instance.Print( Grammar );
   end return;
End Project_Manager.Get_Grammer;
