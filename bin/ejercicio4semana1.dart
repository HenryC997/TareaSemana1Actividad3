import 'package:ejercicio4semana1/ejercicio4semana1.dart' as ejercicio4semana1;

void main() {
  // Agregar productos
  agregarProducto(Producto(
      nombre: 'Laptops',
      precio: 1050,
      cantidad: 10,
      categoria: 'Computadores'));
  agregarProducto(Producto(
      nombre: 'Routers', precio: 37, cantidad: 20, categoria: 'Redes'));
  agregarProducto(Producto(
      nombre: 'SSD', precio: 60, cantidad: 25, categoria: 'Almacenamiento'));

  // Buscar productos
  List<Producto> resultados = buscarProductos('Rout');
  print('Productos encontrados:');
  resultados.forEach((producto) => print('- ${producto.nombre}'));

  // Actualizar cantidad
  actualizarCantidad('SSD', 15);

  // Calcular valor total
  print('Valor total del inventario: \$${calcularValorTotal()}');

  // Mostrar productos por categoría
  mostrarProductosPorCategoria('Computadores');
}

class Producto {
  final String nombre;
  final double precio;
  int cantidad;
  final String categoria;

  Producto({
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.categoria,
  });
}

Map<String, Producto> inventario = {};

// Agregar un nuevo producto al inventario
void agregarProducto(Producto producto) {
  inventario[producto.nombre] = producto;
  print('Producto ${producto.nombre} agregado al inventario.');
}

// Buscar productos por nombre o categoría
List<Producto> buscarProductos(String busqueda, {bool porNombre = true}) {
  List<Producto> resultados = [];
  inventario.forEach((nombre, producto) {
    if (porNombre && nombre.toLowerCase().contains(busqueda.toLowerCase()) ||
        !porNombre &&
            producto.categoria.toLowerCase().contains(busqueda.toLowerCase())) {
      resultados.add(producto);
    }
  });
  return resultados;
}

// Actualizar la cantidad en stock de un producto
void actualizarCantidad(String nombre, int nuevaCantidad) {
  if (inventario.containsKey(nombre)) {
    inventario[nombre]!.cantidad = nuevaCantidad;
    print('Cantidad de ${nombre} actualizada.');
  } else {
    print('Producto no encontrado.');
  }
}

// Calcular el valor total del inventario
double calcularValorTotal() {
  double total = 0;
  inventario.values.forEach((producto) {
    total += producto.precio * producto.cantidad;
  });
  return total;
}

// Mostrar todos los productos de una categoría específica
void mostrarProductosPorCategoria(String categoria) {
  List<Producto> productos = buscarProductos(categoria, porNombre: false);
  if (productos.isEmpty) {
    print('No hay productos en la categoría $categoria.');
  } else {
    print('Productos en la categoría $categoria:');
    productos.forEach((producto) {
      print('- ${producto.nombre} (${producto.cantidad} en stock)');
    });
  }
}
