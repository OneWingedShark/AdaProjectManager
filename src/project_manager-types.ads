Package Project_Manager.Types with Pure is

   Type Token_ID is(
                    -----------------
                    --  TERMINALS  --
                    -----------------

                    -- Keywords
                    t_Project,
                    t_Is,
                    t_Type,
                    t_End,
                    t_with,

                    -- Misc
                    t_Comment,
                    Whitespace,
                    Name,
                    Bad_Token,
                    End_of_File,

                    ---------------------
                    --  NON-TERMINALS  --
                    ---------------------

                    S_Prime,
                    S_Start,
                    p_Project,

                    --------------------------
                    --  AUX. NON-TERMINALS  --
                    --------------------------

                    p_Project_Header,
                    p_Project_Name,
                    p_Project_Body

                   );


   Function Image( Token : Token_ID ) return String;

   First_Terminal   : Constant Token_ID;
   Last_Terminal    : Constant Token_ID;

Private

   First_Terminal   : Constant Token_ID := Token_ID'First;
   Last_Terminal    : Constant Token_ID := End_of_File;

End Project_Manager.Types;
