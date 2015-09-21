With
Project_Manager.Master_Token,
Project_Manager.Master_Token.List_Instance,
Project_Manager.Master_Token.Nonterminal_Instance,
OpenToken.Production;

Package Project_Manager.Master_Token.Production is new OpenToken.Production(
           Token       => Master_Token,
           Token_List  => List_Instance,
           Nonterminal => Nonterminal_Instance
                                                  );
