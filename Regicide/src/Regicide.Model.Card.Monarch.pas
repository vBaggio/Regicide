unit Regicide.Model.Card.Monarch;

interface

uses
  System.SysUtils,
  Regicide.Model.Card;

  type TMonarch = class(TCard)
    public
      constructor Create(ARank: TRank; ASuit: TSuit); reintroduce;

      function Health: Integer;
  end;

implementation

{ TMonarch }

constructor TMonarch.Create(ARank: TRank; ASuit: TSuit);
begin
  if not Self.IsMonarch(ARank) then
    raise Exception.Create('Rank ' + RANK_NAMES[ARank] + ' is not a Monarch.');

  inherited Create(ARank, ASuit);
end;

function TMonarch.Health: Integer;
begin
  case Self.Rank of
    Jack:   Result := 20;
    Queen:  Result := 30;
    King:   Result := 40;
    else    Result := 0;
  end;
end;

end.
