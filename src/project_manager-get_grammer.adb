With
OpenToken.Token.List_Mixin,
OpenToken.Token.Enumerated.Integer,

     Project_Manager.Types,
     Project_Manager.Master_Token,
     Project_Manager.Tokenizer,
     Project_Manager.Get_Syntax,

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

   d_is          : aliased Master_Token.class := Master_Token.Get(t_Is);
   d_end         : aliased Master_Token.class := Master_Token.Get(t_End);
   Name          : aliased Master_Token.class := Master_Token.Get(Types.Name);
   Times         : aliased Master_Token.Class := Nonterminal.Get (p_Project);
   Terminals     : constant Tokenizer.Syntax := Get_Syntax;

   package Nonterminals is
      nt_Prime                  : aliased Nonterminal.Class  := Nonterminal.Get (S_Prime);
      nt_Start                  : aliased Nonterminal.Class  := Nonterminal.Get (S_Start);
      nt_Project                : aliased Nonterminal.Class  := Nonterminal.Get (p_Project);
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


   --use Production, Production_List, Nonterminal, Token_List;
   use type Token_List.Instance;
   use type Production.Right_Hand_Side;
   use type Production.Instance;
   use type Production_List.Instance;
   use Nonterminals;
Begin
   Return Grammar : constant Production_List.Instance:=
     nt_Prime		<= nt_Start & EOF                       and
     nt_Start           <= nt_project & Name & d_is & d_end;
--       Token		<= Punctuation				and
--       Token		<= Whitespace				and
--
--       Basic_Token	<= Keyword				and
--       Basic_Token	<= Name					and
--       Basic_Token	<= Integer_Type				and
--       Basic_Token	<= Rational_Type			and
--       Basic_Token	<= String_Type				and
--
--       Name;--	<= t_Colon & t_Equals;
--       --S_Prime       <= Specification & EOF and
--       --Specification <= EOF + Nonterminal.Synthesize_Self;
End Project_Manager.Get_Grammer;
