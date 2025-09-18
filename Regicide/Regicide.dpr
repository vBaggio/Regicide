program Regicide;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Regicide.Model.Card in 'src\Regicide.Model.Card.pas',
  Regicide.Model.Player in 'src\Regicide.Model.Player.pas',
  Regicide.Model.Deck in 'src\Regicide.Model.Deck.pas',
  Regicide.Utils.Stack in 'src\Regicide.Utils.Stack.pas',
  Regicide.Model.Hand in 'src\Regicide.Model.Hand.pas',
  Regicide.Model.Card.Monarch in 'src\Regicide.Model.Card.Monarch.pas',
  Regicide.Model.Interfaces in 'src\Regicide.Model.Interfaces.pas',
  Regicide.Model.Deck.Monarch in 'src\Regicide.Model.Deck.Monarch.pas',
  Regicide.Model.Game in 'src\Regicide.Model.Game.pas',
  Regicide.Service.GameController in 'src\Regicide.Service.GameController.pas';

begin
  try
    var LCard := TCard.Create(Joker, None);
    Writeln(LCard.ToString);
    Writeln(LCard.Code);
    Sleep(3000);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
