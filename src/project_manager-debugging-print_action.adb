with
Ada.Text_IO;

procedure Project_Manager.Debugging.Print_Action (Item : in Synthesize) is
begin
   null;
   Ada.Text_IO.Put_Line("Item: " & Item.To_ID);
end Project_Manager.Debugging.Print_Action;
