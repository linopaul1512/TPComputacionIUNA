Algoritmo CalculoSalarioSemanalRobusto


Variables
    horas, tarifa, tarifaExtra: Real
    horasExtras, sueldoNormal, sueldoExtras: Real
    salarioBruto, impuesto, salarioNeto: Real
Inicio
    // Validacion robusta para horas trabajadas
    Repetir
        Escribir "Ingrese el numero de horas trabajadas (>= 0):"
        Leer horas
        Si horas < 0 Entonces
            Escribir "Error: Las horas trabajadas no pueden ser negativas. Intente de nuevo."
        FinSi
    Hasta que horas >= 0

    // Validacion robusta para tarifa normal
    Repetir
        Escribir "Ingrese la tarifa normal por hora (> 0):"
        Leer tarifa
        Si tarifa <= 0 Entonces
            Escribir "Error: La tarifa debe ser mayor que cero. Intente de nuevo."
        FinSi
    Hasta que tarifa > 0

    // Calculo del Salario Bruto desglosado
    Si horas <= 35 Entonces
        horasExtras := 0
        tarifaExtra := 0
        sueldoNormal := horas * tarifa
        sueldoExtras := 0
    Sino
        horasExtras := horas - 35
        tarifaExtra := tarifa * 1.5
        sueldoNormal := 35 * tarifa
        sueldoExtras := horasExtras * tarifaExtra
    FinSi

    salarioBruto := sueldoNormal + sueldoExtras

    // Calculo de Impuestos por Tramos
    Si salarioBruto <= 50 Entonces
        impuesto := 0
    Sino
        Si salarioBruto <= 90 Entonces
            impuesto := (salarioBruto - 50) * 0.25
        Sino
            impuesto := 10 + ((salarioBruto - 90) * 0.45)
        FinSi
    FinSi

    // Calculo del Salario Neto
    salarioNeto := salarioBruto - impuesto

    // Salida de resultados formateada
    Escribir "Horas Extras       : ", horasExtras:0:2
    Escribir "Sueldo Normal      : $", sueldoNormal:0:2
    Escribir "Sueldo Extras      : $", sueldoExtras:0:2
    Escribir "Salario Bruto      : $", salarioBruto:0:2
    Escribir "Impuestos Retenidos: $", impuesto:0:2
    Escribir "Salario Neto       : $", salarioNeto:0:2
Fin
