unit Regicide.Model.Hand;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Regicide.Model.Card;

type
  THand = class
  private
    FCards: TObjectList<TCard>;
    function ExtractByCode(ACode: string): TCard;
    
  public
    constructor Create;
    destructor Destroy; override;

    function CardCount: Integer;
    function ContainsCard(ACard: TCard): Boolean;
    function Cards: TArray<TCard>;
    procedure AddCard(ACard: TCard);
    function ExtractCard(ACode: string): TCard; overload;
    function ExtractCard(ACard: TCard): TCard; overload;
  end;

implementation

{ THand }

procedure THand.AddCard(ACard: TCard);
begin
  if not ContainsCard(ACard) then
    FCards.Add(ACard);
end;

function THand.CardCount: Integer;
begin
  Result := FCards.Count;
end;

function THand.Cards: TArray<TCard>;
begin
  Result := FCards.ToArray;
end;

function THand.ContainsCard(ACard: TCard): Boolean;
begin
  Result := FCards.IndexOf(ACard) > -1;
end;

constructor THand.Create;
begin
  FCards := TObjectList<TCard>.Create(True);
end;

destructor THand.Destroy;
begin
  FreeandNil(FCards);
  inherited;
end;

function THand.ExtractByCode(ACode: string): TCard;
begin
  Result := nil;
  
  var LFound := False;
  for var LCard in FCards do
  begin
    LFound := LCard.Code = ACode;

    if LFound then
    begin
      Result := FCards.Extract(LCard);
      break;
    end;
  end;

  if not LFound then
    raise Exception.Create('Card not present in Hand');
end;

function THand.ExtractCard(ACard: TCard): TCard;
begin
  if Self.ContainsCard(ACard) then
    Result := FCards.Extract(ACard)
  else
    raise Exception.Create('Card not present in Hand')
end;

function THand.ExtractCard(ACode: string): TCard;
begin
  Result := ExtractByCode(ACode);  
end;

end.
