unit Regicide.Model.Card;

interface

uses
  System.SysUtils;

type
  TSuit = (Spades, Hearts, Diamonds, Clubs);

const
  SUIT_NAMES: array[TSuit] of string = (
    'Spades',
    'Hearts',
    'Diamonds',
    'Clubs'
  );

type
  TRank = (Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace);

const
  RANK_NAMES: array[TRank] of string = (
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
    'Jack',
    'Queen',
    'King',
    'Ace'
  );

type
  TCard = class
  private
    FSuit: TSuit;
    FRank: TRank;

  public
    constructor Create(ASuit: TSuit; ARank: TRank);
    function ToString: string; reintroduce;
    function Equals(ACard: TCard): Boolean; reintroduce;

    property Suit: TSuit read FSuit;
    property Rank: TRank read FRank;
  end;

implementation

{ TCard }

constructor TCard.Create(ASuit: TSuit; ARank: TRank);
begin
  inherited Create;
  FSuit := ASuit;
  FRank := ARank;
end;

function TCard.Equals(ACard: TCard): Boolean;
begin
  Result := (ACard.Suit = Self.FSuit) and (ACard.Rank = Self.FRank);
end;

function TCard.ToString: string;
begin
  Result := Format('%s of %s', [RANK_NAMES[FRank], SUIT_NAMES[FSuit]]);
end;

end.
