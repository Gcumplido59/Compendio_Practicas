module uart(
    input         clk,                // Reloj del sistema (50 MHz)
    input         rst,                // Reset asíncrono (activo en bajo)
    input  [7:0]  sw,                 // Datos a transmitir (desde switches)
    input         btn,                // Botón para iniciar la transmisión
    output [7:0]  led,                // LEDs para visualizar los 8 bits de datos recibidos
    output        led_parity          // LED para visualizar el bit de paridad
);

  // Conexión interna entre UART Tx y Rx
  wire serial_line;
  wire [7:0] received_data;
  wire parity_error;
  wire received_parity;

  // Instancia del módulo UART Transmisor
  uart_tx uart_transmitter (
    .data(sw),
    .send_data(~btn),
    .rst(rst),
    .clk(clk),
    .serial_out(serial_line)
  );

  // Instancia del módulo UART Receptor (ahora con salida parity_bit)
  uart_rx uart_receiver (
    .clk(clk),
    .serial_in(serial_line),
    .rst(rst),
    .parallel_out(received_data),
    .parity_error(parity_error),
    .parity_bit(received_parity)
  );

  // Asignación de señales a salidas físicas:
  // - Los 8 LEDs muestran los datos recibidos.
  // - El LED led_parity muestra el bit de paridad recibido (se debe conectar al LED 8).
  assign led = received_data;
  assign led_parity = received_parity;

endmodule
