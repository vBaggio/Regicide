unit Regicide.Model.Hand;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Regicide.Model.Card;

type
  THand = class
  private
    FCards: TObjectList<TCard>;

  public
    constructor Create;
    destructor Destroy; override;

    function CardCount: Integer;
    function ContainsCard(ACard: TCard): Boolean;
    function Cards: TArray<TCard>;
    procedure AddCard(ACard: TCard); overload;
    procedure AddCard(ACards: TArray<TCard>); overload;
    function Discard(ACode: string): TCard; overload;
    function Discard(ACodes: TArray<string>): TArray<TCard>; overload;
    function Play(ACode: string): TCard; overload;
    function Play(ACodes: TArray<string>): TArray<TCard>; overload;
  end;

implementation

{ THand }

procedure THand.AddCard(ACard: TCard);
begin

end;

procedure THand.AddCard(ACards: TArray<TCard>);
begin

end;

function THand.CardCount: Integer;
begin

end;

function THand.Cards: TArray<TCard>;
begin

end;

function THand.ContainsCard(ACard: TCard): Boolean;
begin

end;

constructor THand.Create;
begin

end;

destructor THand.Destroy;
begin

  inherited;
end;

function THand.Discard(ACode: string): TCard;
begin

end;

function THand.Discard(ACodes: TArray<string>): TArray<TCard>;
begin

end;

function THand.Play(ACode: string): TCard;
begin

end;

function THand.Play(ACodes: TArray<string>): TArray<TCard>;
begin

end;

end.
