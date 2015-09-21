with
OpenToken.Production.Print,
Project_Manager.Debugging.Print_Action,
Project_Manager.Master_Token.Production;

--  use
--  Project_Manager.Debugging;

package Project_Manager.Debugging.Print_Instance is
  new Master_Token.Production.Print(Print_Action => Debugging.Print_Action);
