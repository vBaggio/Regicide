unit Regicide.Model.Card;

interface

uses
  System.SysUtils;

type
  TSuit = (Spades, Hearts, Diamonds, Clubs, None);

const
  SUIT_NAMES: array[TSuit] of string = (
    'Spades',
    'Hearts',
    'Diamonds',
    'Clubs',
    ''
  );

  SUIT_ABVS: array[TSuit] of Char = (
    'S',
    'H',
    'D',
    'C',
    'N'
  );

type
  TRank = (Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Joker);

const
  RANK_NAMES: array[TRank] of string = (
    'Ace',
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
    'Joker'
  );

  RANK_ABVS: array[TRank] of Char = (
    'A',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
    'J',
    'Q',
    'K',
    'j'
  );

type
  TCard = class
  private
    FSuit: TSuit;
    FRank: TRank;
    function getCode: string;
  protected
    class function IsMonarch(ARank: TRank): Boolean;
  public
    constructor Create(ARank: TRank; ASuit: TSuit);

    function ToString: string; reintroduce;
    function Equals(ACard: TCard): Boolean; reintroduce;

    function Value: Integer;

    property Suit: TSuit read FSuit;
    property Rank: TRank read FRank;
    property Code: string read getCode;
  end;

implementation

{ TCard }

constructor TCard.Create(ARank: TRank; ASuit: TSuit);
begin
  inherited Create;
  FRank := ARank;
  FSuit := ASuit;
end;

function TCard.Equals(ACard: TCard): Boolean;
begin
  Result := (ACard.Suit = Self.FSuit) and (ACard.Rank = Self.FRank);
end;

function TCard.getCode: string;
begin
  Result := RANK_ABVS[FRank] + SUIT_ABVS[FSuit];
end;

class function TCard.IsMonarch(ARank: TRank): Boolean;
begin
  Result := ARank in [Jack, Queen, King];
end;

function TCard.ToString: string;
begin
  Result := RANK_NAMES[FRank];

  if FRank <> Joker then
    Result := Format('%s of %s', [Result, SUIT_NAMES[FSuit]]);
end;

function TCard.Value: Integer;
 begin
   case FRank of
     Ace:   Result := 1;
     Two:   Result := 2;
     Three: Result := 3;
     Four:  Result := 4;
     Five:  Result := 5;
     Six:   Result := 6;
     Seven: Result := 7;
     Eight: Result := 8;
     Nine:  Result := 9;
     Ten:   Result := 10;
     Jack:  Result := 10;
     Queen: Result := 15;
     King:  Result := 20;
     Joker: Result := 0;
     else   Result := 0;
   end;
 end;

end.
