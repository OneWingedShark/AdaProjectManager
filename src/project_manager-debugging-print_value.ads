with
Project_Manager.Types,
Project_Manager.Master_Token.Nonterminal_Instance,
Project_Manager.Master_Token.List_Instance;

use
Project_Manager.Master_Token,
Project_Manager.Master_Token.Nonterminal_Instance;



procedure Project_Manager.Debugging.Print_Value
  (New_Token :    out Nonterminal_Instance.Class;
   Source    : in     List_Instance.Instance'Class;
   To_ID     : in     Project_Manager.Types.Token_ID);
