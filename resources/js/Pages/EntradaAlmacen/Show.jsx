import { Head, Link } from "@inertiajs/react";
import Authenticated from "@/Layouts/AuthenticatedLayout";

export default function Mostrar({ auth, dentradaalmacen, nalmacens, dclienteproveedors, dproductos }) {
  return (
    <Authenticated
      user={auth.user}
      header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">Detalle de Entrada de Almacén</h2>}
    >
      <Head title="Centro Comercial Arroyo Arenas" />
      <div className="py-12">
        <div className="max-w-full mx-auto sm:px-6 lg:px-8 space-y-6">
          <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
            <div className="flex flex-col md:flex-row justify-between space-y-6 md:space-y-0 md:space-x-6">
              {/* Detalles de la entrada de almacén */}
              <div className="w-full md:w-2/4">
                <h3 className="text-lg font-medium leading-6 text-gray-900">Detalles de la Entrada de Almacén</h3>
                <div className="mt-4">
                  <p><strong>Factura:</strong> {dentradaalmacen.factura}</p>
                  <p><strong>Total:</strong> ${dentradaalmacen.total}</p>
                  <p><strong>Almacén:</strong> {nalmacens.find(nalmacen => nalmacen.id === dentradaalmacen.nalmacens_id)?.denominacion}</p>
                  <p><strong>Proveedor:</strong> {dclienteproveedors.find(proveedor => proveedor.id === dentradaalmacen.dproveedor_origen_id)?.denominacion}</p>
                </div>
              </div>
              {/* Tabla de productos */}
              <div className="w-full md:w-2/4">
                <h3 className="text-lg font-medium leading-6 text-gray-900">Productos Asociados</h3>
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Denominación</th>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Cantidad</th>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Precio</th>
                      <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Subtotal</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {dentradaalmacen.dproductoentradas.map((product) => (
                      <tr key={product.id}>
                        <td className="px-6 py-4 whitespace-nowrap">{product.denominacion}</td>
                        <td className="px-6 py-4 whitespace-nowrap">{product.pivot.cantidad}</td>
                        <td className="px-6 py-4 whitespace-nowrap">${product.pivot.precio}</td>
                        <td className="px-6 py-4 whitespace-nowrap">${(product.pivot.cantidad * product.pivot.precio).toFixed(2)}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
            <div className="mt-6">
              <Link
                href={route("dentradaalmacens.index")}
                className="inline-flex items-center px-4 py-2 bg-indigo-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-indigo-500 active:bg-indigo-700 focus:outline-none focus:border-indigo-700 focus:ring focus:ring-indigo-300 disabled:opacity-25 transition"
              >
                Volver
              </Link>
            </div>
          </div>
        </div>
      </div>
    </Authenticated>
  );
}
