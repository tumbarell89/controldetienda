import { Head, Link } from "@inertiajs/react";
import Authenticated from "@/Layouts/AuthenticatedLayout";

export default function Mostrar({ auth, dsalidaalmacen, nalmacenorigen, nalmacendestino, dclienteproveedors }) {

  const renderIcon = (value) => {
    if (value === true) {
      return <span className="text-green-600">✔️</span>;
    } else if (value === false) {
      return <span className="text-red-600">❌</span>;
    } else {
      return null;
    }
  };

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Detalles de la Salida de Almacén
        </h2>
      }
    >
      <Head title="Centro Comercial Arroyo Arenas" />
      <div className="py-12">
        <div className="max-w-full mx-auto sm:px-6 lg:px-8 space-y-6">
          <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
            <div className="flex flex-col md:flex-row justify-between space-y-6 md:space-y-0 md:space-x-6">
              {/* Tabla de productos */}
              <div className="w-full md:w-2/4">
                <h3 className="text-lg font-medium leading-6 text-gray-900">
                  Productos seleccionados
                </h3>
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th
                        scope="col"
                        className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Denominación
                      </th>
                      <th
                        scope="col"
                        className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Cantidad
                      </th>
                      <th
                        scope="col"
                        className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                      >
                        Precio
                      </th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {dsalidaalmacen.dproductosalidas.map((product) => (
                      <tr key={product.id}>
                        <td className="px-6 py-4 whitespace-nowrap">
                          {product.denominacion}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          {product.pivot.cantidad}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          {product.pivot.precio}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              {/* Detalles */}
              <div className="w-full md:w-2/4">
                <div className="sm:flex sm:items-center">
                  <div className="sm:flex-auto">
                    <h1 className="text-base font-semibold leading-6 text-gray-900">
                      Detalles de la Salida de Almacén
                    </h1>
                    <p className="mt-2 text-sm text-gray-700">
                      Información sobre la salida de almacén seleccionada.
                    </p>
                  </div>
                  <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                    <Link
                      href={route("dsalidaalmacens.index")}
                      className="block rounded-md bg-indigo-600 py-2 px-4 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                    >
                      Volver
                    </Link>
                  </div>
                </div>

                <div className="flow-root">
                  <div className="mt-8 overflow-x-auto">
                    <div className="max-w-xl py-2 align-middle">
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Factura
                        </label>
                        <input
                          type="text"
                          value={dsalidaalmacen.factura}
                          readOnly
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                      </div>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Total
                        </label>
                        <input
                          type="number"
                          value={dsalidaalmacen.total}
                          readOnly
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                      </div>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Almacén de Origen
                        </label>
                        <input
                          type="text"
                          value={
                            nalmacenorigen.find((nalmacen) => nalmacen.id === dsalidaalmacen.nalmacenes_origen_id)?.denominacion || ""
                          }
                          readOnly
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                      </div>
                      {dsalidaalmacen.esventa && (
                        <div className="mb-4">
                          <label className="block text-sm font-medium text-gray-700">
                            Almacén de Destino
                          </label>
                          <input
                            type="text"
                            value={
                              nalmacendestino.find((nalmacen) => nalmacen.id === dsalidaalmacen.nalmacenes_destino_id)?.denominacion || ""
                            }
                            readOnly
                            className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                          />

                        </div>
                      )}
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Es venta?
                        </label>
                        { renderIcon(dsalidaalmacen.esventa)}
                      </div>
                      {!dsalidaalmacen.esventa && (
                        <div className="mb-4">
                          <label className="block text-sm font-medium text-gray-700">
                            Destino de los productos
                          </label>
                          <input
                            type="text"
                            value={
                              dclienteproveedors.find((dclienteproveedor) => dclienteproveedor.id === dsalidaalmacen.dproveedor_destino_id)?.denominacion || ""
                            }
                            readOnly
                            className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                          />
                        </div>
                      )}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </Authenticated>
  );
}
