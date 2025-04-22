## Introducción
Este proyecto implementa un **CLI en Ruby** para procesar un archivo CSV con transacciones bancarias y generar un reporte con:

- **Balance Final**: suma de montos de créditos menos débitos.
- **Transacción de Mayor Monto**: ID y monto de la transacción más alta.
- **Conteo de Transacciones**: número de transacciones de cada tipo (Crédito, Débito).


## Instrucciones de Ejecución

1. **Instalar la gema necesaria**
   ```
   gem install smarter_csv (mejor opcion que 'csv' gema)
   ```
2. **Dar permisos de ejecución al script**
   ```
   chmod +x bin/transaction_report.rb
   ```
3. **Ejecutar el reporte**
   ```
   ruby bin/transaction_report.rb data.csv
   ```


## Enfoque y Solución
Se siguieron principios de diseñño como responsabilidad única y código modular para facilitar pruebas , escalabilidad y mantenimiento.

- **Lectura de datos**: Se utiliza `SmarterCSV` para procesar el archivo CSV.
- **Transformación**: Cada fila se convierte en una instancia de la clase `Transaction`.
- **Análisis**: La clase `TransactionAnalyzer` calcula el balance final, la mayor transacción y hace un conteo de los tipos de transacciones.
- **Reporte**: `ReportFormatter`Imprime el resultado final en la consola.
- **Orquestación**: `ReportRunner` Es el objeto orquestador conecta cada clase.



## Estructura del Proyecto

```
interbank-academy-25/
├── bin/
│   └── transaction_report.rb   # Script ejecutable para iniciar el CLI
├── lib/
│   ├── csv_transaction_reader.rb  # Lectura y parseo de CSV
│   ├── transaction_analyzer.rb    # Lógica de cálculo de métricas
│   ├── report_formatter.rb        # Formato e impresión del reporte
│   ├── report_runner.rb           # Orquestador del flujo CLI
│   └── transaction.rb             # Modelo Transaction
├── data.csv                    # Archivo de ejemplo con transacciones
└── README.md                   # Documentación del proyecto
```
