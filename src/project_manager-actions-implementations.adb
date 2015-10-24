Separate (Project_Manager.Actions)
Package Body Implementations is

   Generic
      Source : List_Instance.Instance'Class;
   Package Generic_Internals is
      Iterator    : List_Instance.List_Iterator renames List_Instance.Initial_Iterator(Source);
      List_Handle : Master_Token.Handle renames List_Instance.Token_Handle(Iterator);
      Class       : Master_Token.Class renames List_Handle.all;
   End Generic_Internals;


   procedure Project_Name ( New_Token : out nt.Class;
                            Source    : in  Token_List.Instance'Class;
                            To_ID     : in  PMT.Token_ID) is
      Package Internals is new Generic_Internals( Source );
      use Internals;
   begin
      declare
         Package Token_List renames Master_Token.List_Instance;
         T : Master_Token.Handle := Token_List.Token_Handle( Iterator );
      begin
         Ada.Text_IO.New_Line;
         Ada.Text_IO.Put_Line( "---Name: ("& types.Image(T.ID) &')' );
         Ada.Text_IO.Put_Line( "---Name: ("& T.all.Image &')' );
      end;

      Nonterminal_Instance.Synthesize_Self (New_Token, Source, To_ID);
   End Project_Name;

End Implementations;
