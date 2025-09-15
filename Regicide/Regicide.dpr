program Regicide;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Regicide.Model.Card in 'src\Regicide.Model.Card.pas',
  Regicide.Model.Player in 'src\Regicide.Model.Player.pas',
  Regicide.Model.Deck in 'src\Regicide.Model.Deck.pas',
  Regicide.Utils.Stack in 'src\Regicide.Utils.Stack.pas';

begin
  try
    var LCard := TCard.Create(Ten, Hearts);
    Writeln(LCard.ToString);
    Writeln(LCard.Code);
    Sleep(3000)
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
