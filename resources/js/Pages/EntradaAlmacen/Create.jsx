import { Head, Link, useForm } from "@inertiajs/react";
import { useState } from "react";
import Authenticated from "@/Layouts/AuthenticatedLayout";

export default function Create({
  auth,
  nalmacens,
  dclienteproveedors,
  dproductos,
}) {
  const { data, setData, post, errors } = useForm({
    factura: "",
    total: "",
    nalmacen_id: "",
    dclienteproveedor_id: "",
  });

  const [selectedProducts, setSelectedProducts] = useState([]);

  const handleSubmit = (e) => {
    e.preventDefault();
    // Submit the form data along with the selected products
    const formData = {
      ...data,
      products: selectedProducts,
    };
    post(route("nalmacens.store"), formData);
  };

  const addProduct = (product) => {
    setSelectedProducts((prevProducts) => [...prevProducts, product]);
  };

  const removeProduct = (productId) => {
    setSelectedProducts((prevProducts) =>
      prevProducts.filter((product) => product.id !== productId)
    );
  };

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Crear Entrada de Almacen
        </h2>
      }
    >
      <Head title="Centro Comercial Arroyo Arenas" />
      <div className="py-12">
        <div className="max-w-full mx-auto sm:px-6 lg:px-8 space-y-6">
          <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
            <div className="w-full">
              <div className="sm:flex sm:items-center">
                <div className="sm:flex-auto">
                  <h1 className="text-base font-semibold leading-6 text-gray-900">
                    Create Entrada de Almacen
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">
                    Create a new Entrada de Almacen.
                  </p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <Link
                    href={route("ngiros.index")}
                    className="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                  >
                    Back
                  </Link>
                </div>
              </div>

              <div className="flow-root">
                <div className="mt-8 overflow-x-auto">
                  <div className="max-w-xl py-2 align-middle">
                    <form onSubmit={handleSubmit}>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Factura
                        </label>
                        <input
                          type="text"
                          value={data.factura}
                          onChange={(e) => setData("factura", e.target.value)}
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                        {errors.factura && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.factura}
                          </p>
                        )}
                      </div>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Total
                        </label>
                        <input
                          type="number"
                          value={data.total}
                          onChange={(e) => setData("total", e.target.value)}
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                        {errors.total && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.total}
                          </p>
                        )}
                      </div>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Almacenes de entrada disponible
                        </label>
                        <select
                          value={data.nalmacens_id}
                          onChange={(e) =>
                            setData("nalmacens_id", e.target.value)
                          }
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        >
                          <option value="">Selecciona un almacén</option>
                          {nalmacens.map((nalmacen) => (
                            <option key={nalmacen.id} value={nalmacen.id}>
                              {nalmacen.denominacion}
                            </option>
                          ))}
                        </select>
                        {errors.nalmacens_id && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.nalmacens_id}
                          </p>
                        )}
                      </div>

                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Proveedor de productos
                        </label>
                        <select
                          value={data.dclienteproveedor_id}
                          onChange={(e) =>
                            setData("dclienteproveedor_id", e.target.value)
                          }
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        >
                          <option value="">Selecciona un proveedor</option>
                          {dclienteproveedors.map((dclienteproveedor) => (
                            <option
                              key={dclienteproveedor.id}
                              value={dclienteproveedor.id}
                            >
                              {dclienteproveedor.denominacion}
                            </option>
                          ))}
                        </select>
                        {errors.dclienteproveedor_id && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.dclienteproveedor_id}
                          </p>
                        )}
                      </div>

                      {/* Tabla de productos disponibles */}
                      <div className="mb-4">
                        <h3 className="text-lg font-medium leading-6 text-gray-900">
                          Productos disponibles
                        </h3>
                        <table className="min-w-full divide-y divide-gray-200">
                          <thead className="bg-gray-50">
                            <tr>
                              <th
                                scope="col"
                                className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                              >
                                Nombre
                              </th>
                              <th
                                scope="col"
                                className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                              >
                                Acción
                              </th>
                            </tr>
                          </thead>
                          <tbody className="bg-white divide-y divide-gray-200">
                            {dproductos.map((dproducto) => (
                              <tr key={dproducto.id}>
                                <td className="px-6 py-4 whitespace-nowrap">
                                  {dproducto.denominacion}
                                </td>
                                <td className="px-6 py-4 whitespace-nowrap">
                                  <button
                                    type="button"
                                    onClick={() => addProduct(dproducto)}
                                    className="inline-flex items-center px-3 py-2 bg-green-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-green-500 active:bg-green-700 focus:outline-none focus:border-green-700 focus:ring focus:ring-green-300 disabled:opacity-25 transition"
                                  >
                                    Añadir
                                  </button>
                                </td>
                              </tr>
                            ))}
                          </tbody>
                        </table>
                      </div>

                      {/* Tabla de productos seleccionados */}
                      <div className="mb-4">
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
                                Nombre
                              </th>
                              <th
                                scope="col"
                                className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                              >
                                Acción
                              </th>
                            </tr>
                          </thead>
                          <tbody className="bg-white divide-y divide-gray-200">
                            {selectedProducts.map((product) => (
                              <tr key={product.id}>
                                <td className="px-6 py-4 whitespace-nowrap">
                                  {product.denominacion}
                                </td>
                                <td className="px-6 py-4 whitespace-nowrap">
                                  <button
                                    type="button"
                                    onClick={() => removeProduct(product.id)}
                                    className="inline-flex items-center px-3 py-2 bg-red-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-red-500 active:bg-red-700 focus:outline-none focus:border-red-700 focus:ring focus:ring-red-300 disabled:opacity-25 transition"
                                  >
                                    Quitar
                                  </button>
                                </td>
                              </tr>
                            ))}
                          </tbody>
                        </table>
                      </div>

                      <div className="flex items-center justify-end mt-4">
                        <button
                          type="submit"
                          className="inline-flex items-center px-4 py-2 bg-indigo-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-indigo-500 active:bg-indigo-700 focus:outline-none focus:border-indigo-700 focus:ring focus:ring-indigo-300 disabled:opacity-25 transition"
                        >
                          Crear
                        </button>
                      </div>
                    </form>
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
