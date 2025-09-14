unit Regicide.Model.Card;

interface

uses
  System.SysUtils;

type
  TSuit = (Spades, Hearts, Diamonds, Clubs);
  TRank = (Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace);

  TCard = class
  private
    FSuit: TSuit;
    FRank: TRank;

  public
    constructor Create(ASuit: TSuit; ARank: TRank);

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

end.
