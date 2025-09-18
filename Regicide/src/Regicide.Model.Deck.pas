unit Regicide.Model.Deck;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Regicide.Model.Card, Regicide.Utils.Stack,
  Regicide.Model.Interfaces;

type
  TDeck = class(TInterfacedObject, ICardSet)
  private
    FCards: TObjectStack<TCard>;
    FIsFaceUp: Boolean;
    function ContainsCard(ACard: TCard): Boolean;
  protected
    function Cards: TObjectStack<TCard>;
  public
    constructor Create(AIsFaceUp: Boolean = False);
    destructor Destroy; override;

    procedure Shuffle;
    function PeekTopCard: TCard;
    function DrawCard: TCard;
    procedure AddCard(ACard: TCard);
    function CardCount: Integer;
  end;

implementation

{ TDeck }

procedure TDeck.AddCard(ACard: TCard);
begin
  if not ContainsCard(ACard) then
    FCards.Push(ACard);
end;

function TDeck.CardCount: Integer;
begin
  Result := FCards.Count;
end;

function TDeck.Cards: TObjectStack<TCard>;
begin
  Result := FCards;
end;

constructor TDeck.Create(AIsFaceUp: Boolean);
begin
  FIsFaceUp := AIsFaceUp;
  FCards := TObjectStack<TCard>.Create(True);
end;

destructor TDeck.Destroy;
begin
  FreeAndNil(FCards);
  inherited;
end;

function TDeck.DrawCard: TCard;
begin
  if FCards.IsEmpty then
    Result := nil
  else
    Result := FCards.Extract;
end;

function TDeck.PeekTopCard: TCard;
begin
  if FIsFaceUp then
    Result := FCards.Peek
  else
    Result := Nil;
end;

function TDeck.ContainsCard(ACard: TCard): Boolean;
begin
  Result := False;

  for var LCard in FCards do
  begin
    Result := LCard.Equals(ACard);

    if Result then
      break;
  end;
end;

procedure TDeck.Shuffle;
begin
  FCards.Shuffle;
end;

end.


