unit Regicide.Model.Deck.Monarch;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Regicide.Model.Card, Regicide.Utils.Stack,
  Regicide.Model.Deck;

type
  TMonarchDeck = class(TDeck)
    public
      constructor Create;

      procedure Suffle; override;
  end;

implementation

{ TMonarchDeck }

constructor TMonarchDeck.Create;
begin
  inherited Create(False);
end;

procedure TMonarchDeck.Suffle;
begin
  inherited;

end;

end.
