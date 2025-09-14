unit Regicide.Model.Deck;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Regicide.Model.Card, Regicide.Utils.Stack;

type
  TDeck = class
  private
    FCards: TObjectStack<TCard>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Shuffle;
    function DrawCard: TCard;
    procedure AddCard(ACard: TCard); overload;
    procedure AddCard(ACards: TArray<TCard>);
    function CardCount: Integer;
    function ContainsCard(ACard: TCard): Boolean;
  end;

implementation

{ TDeck }

procedure TDeck.AddCard(ACards: TArray<TCard>);
begin

end;

procedure TDeck.AddCard(ACard: TCard);
begin
  //validation...

  FCards.Push(ACard);
end;

function TDeck.CardCount: Integer;
begin
  Result := FCards.Count;
end;

constructor TDeck.Create;
begin
  FCards := TObjectStack<TCard>.Create(True);
end;

destructor TDeck.Destroy;
begin
  FreeAndNil(FCards);
  inherited;
end;

function TDeck.DrawCard: TCard;
begin
  Result := FCards.Extract;
end;

function TDeck.ContainsCard(ACard: TCard): Boolean;
begin

end;

procedure TDeck.Shuffle;
begin
  FCards.Shuffle;
end;

end.


