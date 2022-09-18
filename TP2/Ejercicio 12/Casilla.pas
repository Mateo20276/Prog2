unit Casilla;

interface

type
  TCasilla = object
    private
      posX: Integer;
      posY: Integer;
      tipo: Char;            // M=mina, D=documento, S=segura
      visitada: Boolean;
    public
      constructor Create(aPosX, aPosY: Integer; aTipo: Char);
      function getX(): Integer;
      function getY(): Integer;
      function getTipo(): Char;
      function fueVisitada(): Boolean;         // true=visitada, false=no visitada
      procedure setVisitada(aVisitada: Boolean);
  end;

implementation

{ TCasilla }

constructor TCasilla.Create(aPosX, aPosY: Integer; aTipo: Char);
begin
  self.posX := aPosX;
  self.posY := aPosY;
  self.tipo := aTipo;
  self.visitada := False;
end;

function TCasilla.fueVisitada: Boolean;
begin
  result := self.visitada;
end;

function TCasilla.getTipo: Char;
begin
  result := self.tipo;
end;

function TCasilla.getX: Integer;
begin
  result := self.posX;
end;

function TCasilla.getY: Integer;
begin
  result := self.posY;
end;

procedure TCasilla.setVisitada(aVisitada: Boolean);
begin
  self.visitada := aVisitada;
end;

end.
