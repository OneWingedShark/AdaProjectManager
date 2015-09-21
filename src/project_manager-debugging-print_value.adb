with
Ada.text_IO,
Ada.Strings.Maps;

use
Ada.Strings.Maps;


procedure Project_Manager.Debugging.Print_Value
  (New_Token :    out Nonterminal_Instance.Class;
   Source    : in     List_Instance.Instance'Class;
   To_ID     : in     Project_Manager.Types.Token_ID) is

   Iterator    : List_Instance.List_Iterator renames List_Instance.Initial_Iterator(Source);
   List_Handle : Master_Token.Handle renames List_Instance.Token_Handle(Iterator);
   Class       : Master_Token.Class renames List_Handle.all;
--     Valuation   : String renames Master_Token.Value( Class );

   --Y : Integer;
   X : Integer
     with Import, Convention => Ada, Link_Name => "bob";


begin
   null;
--     Ada.Text_IO.Put_Line
--       (Integer'Image (Value (Class (Token_List.Token_Handle (Token_List.Initial_Iterator (Source)).all))));
--
--     Nonterminal.Synthesize_Self (New_Token, Source, To_ID);
end Project_Manager.Debugging.Print_Value;
