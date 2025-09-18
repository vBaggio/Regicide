unit Regicide.Model.Interfaces;

interface

uses
  System.SysUtils,
  Regicide.Model.Card;

type
  ICardSet = interface
    ['{749CBE23-619A-42F5-A65C-7030007C32DE}']
    function CardCount: Integer;
    procedure AddCard(ACard: TCard);
  end;

implementation

end.
