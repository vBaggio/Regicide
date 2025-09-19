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
  Regicide.Service.GameController in 'src\Regicide.Service.GameController.pas',
  Regicide.Service.ValueCalculation in 'src\Regicide.Service.ValueCalculation.pas';

begin
  try
    var LDeck := TMonarchDeck.Create;

    LDeck.AddCard(TCard.Create(King, Diamonds));
    LDeck.AddCard(TCard.Create(King, Clubs));

    LDeck.AddCard(TCard.Create(Jack, Spades));
    LDeck.AddCard(TCard.Create(Jack, Hearts));

    LDeck.AddCard(TCard.Create(Queen, Spades));
    LDeck.AddCard(TCard.Create(Queen, Hearts));

    LDeck.AddCard(TCard.Create(Jack, Diamonds));
    LDeck.AddCard(TCard.Create(Jack, Clubs));

    LDeck.AddCard(TCard.Create(Queen, Diamonds));
    LDeck.AddCard(TCard.Create(Queen, Clubs));

    LDeck.AddCard(TCard.Create(King, Spades));
    LDeck.AddCard(TCard.Create(King, Hearts));

    LDeck.Shuffle;
    
    while LDeck.CardCount > 0 do
    begin
      var LCard := LDeck.DrawCard;
      WriteLn(LCard.ToString);
      FreeandNil(LCard);
    end;
    
    FreeandNil(LDeck);
    Sleep(60 * 1000);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
