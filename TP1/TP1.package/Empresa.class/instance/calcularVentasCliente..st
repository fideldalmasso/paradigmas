operaciones con clientes
calcularVentasCliente: dni
	"Retorna el monto total vendido al cliente"

| aux montoTotal |

aux:= (listaClientes at:dni) compras.
montoTotal:= 0.

aux do: [ :i | montoTotal:= montoTotal + (i totalAbonado)].

^montoTotal.


