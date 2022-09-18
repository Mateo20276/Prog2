unit cajaRegistradora;

interface

uses System.SysUtils,StrUtils;

type
  billetes = (B1000,B500,B200,B100,B50,B20,B10,M10,M5,M2,M1,M50c,M25c); // Enumerado
  sumabilletes = array [B1000..M25c] of Double;


  // Tad
  Tcaja = object
    private
      billetescaja : sumabilletes; // Aca se guardan los billetes de la caja

    public
      constructor Create();
      procedure cargar(index: billetes; Monto: Double);
      function DarVuelto(billetesacobrar: sumabilletes; Precio,MontoPagado: Double): sumabilletes;
      function saldoTotal(): Double;
      procedure getCajero(var copyCajero: sumabilletes);

  end;

const
  denominacion : sumabilletes = (1000,500,200,100,50,20,10,10,5,2,1,0.5,0.25);



implementation

constructor Tcaja.Create(); // Inicializa en 0 todos los billetes
  var
    i: billetes;

  begin
    for i:= B1000 to M25c do begin
        self.billetesCaja[i] := 0;
    end;

  end;


procedure Tcaja.cargar(index: billetes; Monto: Double); // Carga la caja
  var
    i : billetes;
  begin
    self.billetescaja[index] := self.billetescaja[index] + Monto;
  end;


function Tcaja.DarVuelto(billetesacobrar: sumabilletes; Precio,MontoPagado: Double): sumabilletes;
var
  cantidadacobrar : real;
  auxBilletesCaja: sumabilletes;
  vuelto : sumabilletes;
  i : billetes;

begin
  auxBilletesCaja := billetescaja; // Guardo una copia del cajero por si no hay suficiente dinero en caja para dar el vuelto y hay que devolver los billetes ingresados

  for i:= B1000 to M25c do
    begin
      vuelto[i] := 0; // Inicializa en 0 todos los billetes
      billetescaja[i] := billetescaja[i] + billetesacobrar[i]; // Ingresa los billetes con los que se realizo la paga
    end;

  cantidadacobrar := MontoPagado - Precio;

  for i := B1000 to M25c do begin
    while (cantidadacobrar >= denominacion[i]) and (billetescaja[i] > 0) do begin
        vuelto[i] := vuelto[i] + 1;
        cantidadacobrar := cantidadacobrar - denominacion[i];
        billetescaja[i] := billetescaja[i] - 1;
      end;
    end;

  if cantidadacobrar > 0 then begin // si el dinero en caja no alcanza para dar el vuelto
    vuelto[B1000] := -1; // Error
    billetescaja := auxBilletesCaja; // Restauro la caja a como estaba antes de ingresar el dinero del cliente
  end;

  result := vuelto;
end;



function Tcaja.saldoTotal(): Double;
  var
    i : billetes;
    sumatoria: Double;

  begin
    sumatoria := 0;
    for  i:= B1000 to M25c do begin
      sumatoria := sumatoria + self.billetescaja[i]*denominacion[i];
    end;

    result := sumatoria;
  end;


procedure Tcaja.getCajero(var copyCajero: sumabilletes);
  begin
    copyCajero := self.billetescaja;
  end;

end.
