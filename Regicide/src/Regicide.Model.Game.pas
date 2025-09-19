unit Regicide.Model.Game;

interface

uses
  System.SysUtils,
  System.Generics.Collections,
  Regicide.Model.Player,
  Regicide.Model.Hand,
  Regicide.Model.Deck,
  Regicide.Model.Card,
  Regicide.Model.Card.Monarch,
  Regicide.Model.Deck.Monarch;

type
  TGame = class
  private
    FTavernDeck: TDeck;
    FDiscardPile: TDeck;
    FMonarchDeck: TMonarchDeck;
    FPlayers: TObjectList<TPlayer>;

    FCurrentMonarch: TMonarch;
    FCurrentPlayer: TPlayer;
    FPlayedCards: TObjectList<TCard>;
  end;


implementation

end.
