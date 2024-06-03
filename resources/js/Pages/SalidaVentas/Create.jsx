import { Head, Link, useForm } from "@inertiajs/react";
import { useState, useEffect } from "react";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import Productosmodal from "@/Components/Productosmodal";

export default function Create({ auth, nalmacenorigen, nalmacendestino, dclienteproveedors, dproductos }) {
  const { data, setData, post, errors } = useForm({
    factura: "",
    total: 0,
    nalmacenes_origen_id: "",
    nalmacenes_destino_id: "",
    dproveedor_destino_id: "",
    esventa:"",
    products: [] // Inicializar el array de productos aquí
  });

  const [selectedProducts, setSelectedProducts] = useState([]);
  const [isModalOpen, setIsModalOpen] = useState(false);

  useEffect(() => {
    // Calcular el total cada vez que cambian los productos seleccionados
    const total = selectedProducts.reduce((sum, product) => {
      return sum + product.cantidad * product.precio;
    }, 0);
    setData({
      ...data,
      total: total,
      products: selectedProducts
    });// Actualizar los productos en los datos del formulario
  }, [selectedProducts]);

  const handleSubmit = (e) => {
    e.preventDefault();
    post(route("dsalidaalmacens.store"));
  };

  const addProduct = (product) => {
    if (!selectedProducts.some((p) => p.id === product.id)) {
      setSelectedProducts((prevProducts) => [
        ...prevProducts,
        { ...product, cantidad: 1, precio: product.preciocosto },
      ]);
    }
  };

  const removeProduct = (productId) => {
    setSelectedProducts((prevProducts) =>
      prevProducts.filter((product) => product.id !== productId)
    );
  };

  const updateProductQuantity = (productId, cantidad) => {
    setSelectedProducts((prevProducts) =>
      prevProducts.map((product) =>
        product.id === productId ? { ...product, cantidad: parseInt(cantidad, 10) } : product
      )
    );
  };

  const updateProductPrice = (productId, precio) => {
    setSelectedProducts((prevProducts) =>
      prevProducts.map((product) =>
        product.id === productId ? { ...product, precio: parseFloat(precio) } : product
      )
    );
  };

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Crear salida de Almacen
        </h2>
      }
    >
      <Head title="Centro Comercial Arroyo Arenas" />
      <div className="py-12">
        <div className="max-w-full mx-auto sm:px-6 lg:px-8 space-y-6">
          <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
            <div className="flex flex-col md:flex-row justify-between space-y-6 md:space-y-0 md:space-x-6">
              {/* Tabla de productos seleccionados */}
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
                        Nombre
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
                          <input
                            type="number"
                            min="1"
                            value={product.cantidad}
                            onChange={(e) =>
                              updateProductQuantity(product.id, e.target.value)
                            }
                            className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                          />
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <input
                            type="number"
                            step="0.01"
                            min="0"
                            value={product.precio}
                            onChange={(e) =>
                              updateProductPrice(product.id, e.target.value)
                            }
                            className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                          />
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
              {/* Formulario */}
              <div className="w-full md:w-2/4">
                <div className="sm:flex sm:items-center">
                  <div className="sm:flex-auto">
                    <h1 className="text-base font-semibold leading-6 text-gray-900">
                      Crear Salida de Almacen
                    </h1>
                    <p className="mt-2 text-sm text-gray-700">
                      Crear una nueva salida de almacén.
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
                            readOnly
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
                            Almacenes disponibles origen
                          </label>
                          <select
                            value={data.nalmacenes_origen_id}
                            onChange={(e) =>
                              setData("nalmacenes_origen_id", e.target.value)
                            }
                            className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                          >
                            <option value="">Selecciona un almacén</option>
                            {nalmacenorigen.map((nalmacen) => (
                              <option key={nalmacen.id} value={nalmacen.id}>
                                {nalmacen.denominacion}
                              </option>
                            ))}
                          </select>
                          {errors.nalmacenes_origen_id && (
                            <p className="mt-2 text-sm text-red-600">
                              {errors.nalmacenes_origen_id}
                            </p>
                          )}
                        </div>
                        {data.esventa && (
                          <div>

                        <div className="mb-4">
                          <label className="block text-sm font-medium text-gray-700">
                            Almacenes disponibles de destino
                          </label>
                          <select
                            value={data.nalmacenes_destino_id}
                            onChange={(e) =>
                              setData("nalmacenes_destino_id", e.target.value)
                            }
                            className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                          >
                            <option value="">Selecciona un almacén</option>
                            {nalmacendestino.map((nalmacen) => (
                              <option key={nalmacen.id} value={nalmacen.id}>
                                {nalmacen.denominacion}
                              </option>
                            ))}
                          </select>
                          {errors.nalmacenes_destino_id && (
                            <p className="mt-2 text-sm text-red-600">
                              {errors.nalmacenes_destino_id}
                            </p>
                          )}
                        </div>
                          </div>

                        )}
                        <div>
                          <label className="block text-sm font-medium text-gray-700">
                            Es venta?
                          </label>
                          <div className="mt-2">
                            <label className="inline-flex items-center">
                              <input
                                type="checkbox"
                                name="esventa"
                                checked={data.esventa}
                                onChange={e => setData('esventa', e.target.checked)}
                                className="form-checkbox"
                              />
                              <span className="ml-2">Es venta</span>
                            </label>
                          </div>
                          {errors.esventa && <p className="mt-2 text-sm text-red-600">{errors.esventa}</p>}
                        </div>

                        {!data.esventa && (
                          <div>

                            <div className="mb-4">
                              <label className="block text-sm font-medium text-gray-700">
                                Destino de los productos
                              </label>
                              <select
                                value={data.dproveedor_destino_id}
                                onChange={(e) =>
                                  setData("dproveedor_destino_id", e.target.value)
                                }
                                className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                              >
                                <option value="">Selecciona un destinatario</option>
                                {dclienteproveedors.map((dclienteproveedor) => (
                                  <option
                                    key={dclienteproveedor.id}
                                    value={dclienteproveedor.id}
                                  >
                                    {dclienteproveedor.denominacion}
                                  </option>
                                ))}
                              </select>
                              {errors.dproveedor_destino_id && (
                                <p className="mt-2 text-sm text-red-600">
                                  {errors.dproveedor_destino_id}
                                </p>
                              )}
                            </div>
                          </div>
                        )}

                        {/* Botón para abrir el modal */}
                        <div className="mb-4">
                          <div></div>
                          <button
                            type="button"
                            onClick={() => setIsModalOpen(true)}
                            className="inline-flex items-center px-3 py-2 bg-blue-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-blue-500 active:bg-blue-700 focus:outline-none focus:border-blue-700 focus:ring focus:ring-blue-300 disabled:opacity-25 transition"
                          >
                            Añadir Productos Disponibles
                          </button>
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
      </div>

      {/* Productosmodal */}
      <Productosmodal isOpen={isModalOpen} setIsOpen={setIsModalOpen}>
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
                Precio
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
                  {dproducto.preciocosto}
                </td>
                <td className="px-6 py-4 whitespace-nowrap">
                  <button
                    type="button"
                    onClick={() => {
                      addProduct(dproducto);
                    }}
                    className="inline-flex items-center px-3 py-2 bg-green-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-green-500 active:bg-green-700 focus:outline-none focus:border-green-700 focus:ring focus:ring-green-300 disabled:opacity-25 transition"
                    disabled={selectedProducts.some(
                      (p) => p.id === dproducto.id
                    )}
                  >
                    Añadir
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </Productosmodal>
    </Authenticated>
  );
}
