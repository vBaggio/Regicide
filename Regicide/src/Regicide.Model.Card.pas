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

  SUIT_ABVS: array[TSuit] of Char = (
    'S',
    'H',
    'D',
    'C'
  );

type
  TRank = (Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King);

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
    'King'
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
    'K'
  );

type
  TCard = class
  private
    FSuit: TSuit;
    FRank: TRank;
    function getCode: string;
  public
    constructor Create(ARank: TRank; ASuit: TSuit); overload;
    constructor Create(ACode: string); overload;

    function ToString: string; reintroduce;
    function Equals(ACard: TCard): Boolean; reintroduce;

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

constructor TCard.Create(ACode: string);
begin
  inherited Create;

  if Length(ACode) <> 2 then
    raise Exception.CreateFmt('Invalid card code: "%s"', [ACode]);

  var LRankChar := ACode[1];
  var LSuitChar := ACode[2];

  var LRankFound := False;
  for var LRank := Low(TRank) to High(TRank) do
  begin
    LRankFound := RANK_ABVS[LRank] = LRankChar;
    if LRankFound then
    begin
      FRank := LRank;
      LRankFound := True;
      Break;
    end;
  end;

  if not LRankFound then
    raise Exception.CreateFmt('Invalid rank in card code: "%s"', [ACode]);

  var LSuitFound := False;
  for var LSuit := Low(TSuit) to High(TSuit) do
  begin
    LSuitFound := SUIT_ABVS[LSuit] = LSuitChar;

    if LSuitFound then
    begin
      FSuit := LSuit;
      Break;
    end;
  end;

  if not LSuitFound then
    raise Exception.CreateFmt('Invalid suit in card code: "%s"', [ACode]);
end;

function TCard.Equals(ACard: TCard): Boolean;
begin
  Result := (ACard.Suit = Self.FSuit) and (ACard.Rank = Self.FRank);
end;

function TCard.getCode: string;
begin
  Result := RANK_ABVS[FRank] + SUIT_ABVS[FSuit];
end;

function TCard.ToString: string;
begin
  Result := Format('%s of %s', [RANK_NAMES[FRank], SUIT_NAMES[FSuit]]);
end;

end.
