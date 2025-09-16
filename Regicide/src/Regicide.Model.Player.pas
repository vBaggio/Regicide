unit Regicide.Model.Player;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Regicide.Model.Card, Regicide.Model.Hand;

  type
  TPlayer = class
  private
    FID: Integer;
    FName: string;
    FHand: THand;

  public
    constructor Create(AID: Integer; AName: string);
    destructor Destroy; override;

    function ToString: string; reintroduce;

    property ID: Integer read FID;
    property Name: string read FName;
    property Hand: THand read FHand;
  end;

implementation

{ TPlayer }

constructor TPlayer.Create(AID: Integer; AName: string);
begin
  FID := AID;
  FName := AName;
  FHand := THand.Create;
end;

destructor TPlayer.Destroy;
begin
  FreeAndNil(FHand);
  inherited;
end;

function TPlayer.ToString: string;
begin
  Result := FName;
end;

end.
