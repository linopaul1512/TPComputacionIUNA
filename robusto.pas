program CalculoSalarioNeto;

var
  horas, tarifa, tarifaExtra: Real;
  horasExtras, sueldoNormal, sueldoExtras: Real;
  salarioBruto, impuesto, salarioNeto: Real;

begin

  { Validacion robusta para las horas trabajadas }
  repeat
    Write('Ingrese el numero de horas trabajadas (>= 0): ');
    ReadLn(horas);
    if horas < 0 then
      WriteLn('[AVISO] Las horas no pueden ser negativas. Reintente.');
  until horas >= 0;

  { Validacion robusta para la tarifa por hora }
  repeat
    Write('Ingrese la tarifa normal por hora (> 0): ');
    ReadLn(tarifa);
    if tarifa <= 0 then
      WriteLn('[AVISO] La tarifa debe ser mayor que cero. Reintente.');
  until tarifa > 0;

  { Calculo del Salario Bruto desglosado }
  if horas <= 35 then
  begin
    horasExtras := 0;
    sueldoNormal := horas * tarifa;
    sueldoExtras := 0;
  end
  else
  begin
    horasExtras := horas - 35;
    tarifaExtra := tarifa * 1.5;
    sueldoNormal := 35 * tarifa;
    sueldoExtras := horasExtras * tarifaExtra;
  end;

  salarioBruto := sueldoNormal + sueldoExtras;

  { Calculo de Impuestos por Tramos }
  if salarioBruto <= 50 then
    impuesto := 0
  else if salarioBruto <= 90 then
    impuesto := (salarioBruto - 50) * 0.25
  else
    impuesto := 10 + ((salarioBruto - 90) * 0.45);

  { Calculo del Salario Neto }
  salarioNeto := salarioBruto - impuesto;

  { Presentacion de Resultados }
  WriteLn;
  WriteLn('Horas Extras         : ', horasExtras:0:2);
  WriteLn('Sueldo Base (Normal) : $', sueldoNormal:0:2);
  WriteLn('Sueldo Horas Extras  : $', sueldoExtras:0:2);
  WriteLn('Salario Bruto        : $', salarioBruto:0:2);
  WriteLn('Impuestos Retenidos  : $', impuesto:0:2);
  WriteLn('Salario Neto a Pagar : $', salarioNeto:0:2);
  WriteLn;
  Write('Presione Enter para salir...');
  ReadLn;
end.