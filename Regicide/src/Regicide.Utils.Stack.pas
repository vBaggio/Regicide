unit Regicide.Utils.Stack;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TObjectStack<T: class> = class(TStack<T>)
  private
    FOwnsObjects: Boolean;
  public
    constructor Create(AOwnsObjects: Boolean = True);
    destructor Destroy; override;

    procedure Clear; reintroduce;
    function Pop: T; reintroduce;
    function Extract: T;

    procedure Shuffle;

    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
  end;

implementation

{ TObjectStack<T> }

constructor TObjectStack<T>.Create(AOwnsObjects: Boolean);
begin
  inherited Create;
  FOwnsObjects := AOwnsObjects;
end;

destructor TObjectStack<T>.Destroy;
begin
  Clear;
  inherited;
end;

procedure TObjectStack<T>.Clear;
var
  Item: T;
begin
  if FOwnsObjects then
  begin
    while Count > 0 do
    begin
      Item := inherited Pop;
      Item.Free;
    end;
  end
  else
    inherited Clear;
end;

function TObjectStack<T>.Pop: T;
begin
  Result := inherited Pop;
  if FOwnsObjects and (Result <> nil) then
    Result.Free;
end;

function TObjectStack<T>.Extract: T;
begin
  Result := inherited Pop;
end;

procedure TObjectStack<T>.Shuffle;
begin
  var Arr := Self.ToArray;
  inherited Clear;

  Randomize;
  for var I := High(Arr) downto Low(Arr) + 1 do
  begin
    var J := Random(I + 1);
    var Temp := Arr[I];
    Arr[I] := Arr[J];
    Arr[J] := Temp;
  end;

  for var I := Low(Arr) to High(Arr) do
    inherited Push(Arr[I]);
end;

end.
