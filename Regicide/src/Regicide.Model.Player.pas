unit Regicide.Model.Player;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Regicide.Model.Card;

  type
  TPlayer = class
  private
    FID: Integer;
    FName: string;
    FHand: TObjectList<TCard>;

  public
    constructor Create(AID: Integer; AName: string);
    destructor Destroy; override;

    property ID: Integer read FID;
    property Name: string read FName;
    property Hand: TObjectList<TCard> read FHand;
  end;

implementation

{ TPlayer }

constructor TPlayer.Create(AID: Integer; AName: string);
begin
  FID := AID;
  FName := AName;
  FHand := TObjectList<TCard>.Create;
end;

destructor TPlayer.Destroy;
begin
  FreeAndNil(FHand);
  inherited;
end;

end.
