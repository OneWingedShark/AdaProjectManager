Pragma Ada_2012;

with
Project_Manager.Types,
OpenToken.Token.Enumerated;

use
Project_Manager.Types;

Package Project_Manager.Master_Token is new
  OpenToken.Token.Enumerated(
    Token_ID       => Token_ID,
    First_Terminal => First_Terminal,
    Last_Terminal  => Last_Terminal,
    Token_Image    => Image
                            );
