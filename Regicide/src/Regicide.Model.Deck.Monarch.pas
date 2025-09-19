unit Regicide.Model.Deck.Monarch;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Regicide.Model.Card, Regicide.Model.Card.Monarch,
  Regicide.Utils.Stack,
  Regicide.Model.Deck;

type
  TMonarchDeck = class(TDeck)
    public
      constructor Create;

      procedure Shuffle; override;
      function DrawCard: TMonarch;
  end;

implementation

{ TMonarchDeck }

constructor TMonarchDeck.Create;
begin
  inherited Create(False);
end;

function TMonarchDeck.DrawCard: TMonarch;
begin
  Result := TMonarch(inherited DrawCard);
end;

procedure TMonarchDeck.Shuffle;
begin
  if Self.CardCount <=1 then
    Exit;

  var LJack  := TDeck.Create(False);
  var LQueen := TDeck.Create(False);
  var LKing  := TDeck.Create(False);
  try
    while Self.CardCount > 0 do
    begin
      var LCard := Self.DrawCard;

      case LCard.Rank of
        Jack:  LJack.AddCard(LCard);
        Queen: LQueen.AddCard(LCard);
        King:  LKing.AddCard(LCard);
        else
          LCard.Free;
      end;
    end;

    var LpEmptyDeck :=
      procedure(ADeck: TDeck)
      begin
        ADeck.Shuffle;
        while ADeck.CardCount > 0 do
          Self.AddCard(ADeck.DrawCard);
      end;

    LpEmptyDeck(LKing);
    LpEmptyDeck(LQueen);
    LpEmptyDeck(LJack);

  finally
    FreeAndNil(LJack);
    FreeAndNil(LQueen);
    FreeAndNil(LKing);
  end;
end;

end.
