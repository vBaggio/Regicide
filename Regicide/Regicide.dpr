program Regicide;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Regicide.Model.Card in 'src\Regicide.Model.Card.pas',
  Regicide.Model.Player in 'src\Regicide.Model.Player.pas';

begin
  try
    Writeln('Hello');
    Sleep(3000)
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
