with
Project_Manager.Types,
Project_Manager.Tokenizer,
Project_Manager.Get_Grammer,
Project_Manager.Get_Syntax,
Project_Manager.Master_Token.Production,
Project_Manager.Master_Token.Production_List,
OpenToken.Production.Parser.LALR.Generator,
OpenToken.Production.Parser.LALR.Parser,
OpenToken.Production.Parser.LALR.Parser_Lists,
OpenToken.Production;

With
Ada.Text_IO;

Procedure APM is
   Use Project_Manager;

   Package Parser is new Master_Token.Production.Parser( Tokenizer => Tokenizer );
   package LALR_Package is new Parser.LALR( First_State_Index => 0 );
   package LALR_Generator is new LALR_Package.Generator(
      Token_Image_Width => Types.Token_ID'Width,
      Production_List   => Master_Token.Production_List
     );
   package Parser_Lists is new LALR_Package.Parser_Lists( First_Parser_Label => 0 );
   package LALR_Parser is new LALR_Package.Parser(
      First_Parser_Label => 0,
      Parser_Lists       => Parser_Lists
     );


    Parse_Table : LALR_Package.Parse_Table_Ptr :=
     LALR_Generator.Generate(
--          Known_Conflicts          => ,
        Trace                    => True,
--          Put_Parse_Table          => ,
        Ignore_Unknown_Conflicts => True,
        Ignore_Unused_Tokens     => True,
        Grammar                  => Get_Grammer
       );

   Test_Parser : Parser.Instance'Class :=
     LALR_Parser.Initialize(
        Max_Parallel         => 24,
        Terminate_Same_State => False,
        Analyzer             => Tokenizer.Initialize( Project_Manager.Get_Syntax ),
        Table                => Parse_Table
       );

   File_Name  : constant String := "Example.txt";
   Input_File : Ada.Text_IO.File_Type;
begin

   Ada.Text_IO.Put ("Parsing file " & File_Name & "...");
   Ada.Text_IO.Flush;

   Ada.Text_IO.Open (File => Input_File,
                     Name => File_Name,
                     Mode => Ada.Text_IO.In_File
                     );

   Parser.Parse(Test_Parser);
End APM;
