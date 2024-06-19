import { Head, Link, useForm } from "@inertiajs/react";
import Authenticated from "@/Layouts/AuthenticatedLayout";

export default function Editar({ auth, dproducto, ntipogiros, nunidadmedidas }) {
  const { data, setData, put, errors } = useForm({
    denominacion: dproducto.denominacion || "",
    preciocosto: dproducto.preciocosto || "",
    precioventa: dproducto.precioventa || "",
    codigocup: dproducto.codigocup || "",
    codigoproducto: dproducto.codigoproducto || "",
    nunidadmedida_id: dproducto.nunidadmedida_id || "",
    dtipogiros_id: dproducto.dtipogiros_id || "",
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    put(route("dproductos.update", dproducto.id));
  };

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Editar Producto
        </h2>
      }
    >
      <Head title="Editar Producto" />
      <div className="py-12">
        <div className="max-w-full mx-auto sm:px-6 lg:px-8 space-y-6">
          <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
            <div className="w-full">
              <div className="sm:flex sm:items-center">
                <div className="sm:flex-auto">
                  <h1 className="text-base font-semibold leading-6 text-gray-900">
                    Editar Producto
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">
                    Actualiza Producto
                  </p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <a
                    href={route("ntipogiros.index")}
                    className="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                  >
                    Volver
                  </a>
                </div>
              </div>

              <div className="flow-root">
                <div className="mt-8 overflow-x-auto">
                  <div className="max-w-xl py-2 align-middle">
                    <form onSubmit={handleSubmit}>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Denominación
                        </label>
                        <input
                          type="text"
                          value={data.denominacion}
                          onChange={(e) =>
                            setData("denominacion", e.target.value)
                          }
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                        {errors.denominacion && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.denominacion}
                          </p>
                        )}
                      </div>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Precio de Costo
                        </label>
                        <input
                          type="number"
                          value={data.preciocosto}
                          onChange={(e) =>
                            setData("preciocosto", e.target.value)
                          }
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                        {errors.preciocosto && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.preciocosto}
                          </p>
                        )}
                      </div>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Precio de Venta
                        </label>
                        <input
                          type="number"
                          value={data.precioventa}
                          onChange={(e) =>
                            setData("precioventa", e.target.value)
                          }
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                        {errors.precioventa && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.precioventa}
                          </p>
                        )}
                      </div>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Codigo CUP
                        </label>
                        <input
                          type="text"
                          value={data.codigocup}
                          onChange={(e) => setData("codigocup", e.target.value)}
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                        {errors.codigocup && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.codigocup}
                          </p>
                        )}
                      </div>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Codigo Producto
                        </label>
                        <input
                          type="text"
                          value={data.codigoproducto}
                          onChange={(e) =>
                            setData("codigoproducto", e.target.value)
                          }
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                        {errors.codigoproducto && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.codigoproducto}
                          </p>
                        )}
                      </div>
                      {/* <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Unidad de Medida
                        </label>
                        <input
                          type="text"
                          value={data.unidadmedida}
                          onChange={(e) =>
                            setData("unidadmedida", e.target.value)
                          }
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                        {errors.unidadmedida && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.unidadmedida}
                          </p>
                        )}
                      </div> */}

                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Unidad de Medida
                        </label>
                        <select
                          id="nunidadmedida_id"
                          name="nunidadmedida_id"
                          value={data.nunidadmedida_id}
                          onChange={(e) =>
                            setData("nunidadmedida_id", e.target.value)
                          }
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        >
                          <option value="">Selecciona un tipo de giro</option>
                          {nunidadmedidas.map((nunidadmedida) => (
                            <option key={nunidadmedida.id} value={nunidadmedida.id}>
                              {nunidadmedida.denominacion}
                            </option>
                          ))}
                        </select>
                        {errors.tipogiro_id && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.tipogiro_id}
                          </p>
                        )}
                      </div>
                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Tipo de Giro
                        </label>
                        <select
                          id="tipogiro_id"
                          name="tipogiro_id"
                          value={data.dtipogiros_id}
                          onChange={(e) =>
                            setData("dtipogiros_id", e.target.value)
                          }
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        >
                          <option value="">Selecciona un tipo de giro</option>
                          {ntipogiros.map((ntipogiro) => (
                            <option key={ntipogiro.id} value={ntipogiro.id}>
                              {ntipogiro.denominacion}
                            </option>
                          ))}
                        </select>
                        {errors.tipogiro_id && (
                          <p className="mt-2 text-sm text-red-600">
                            {errors.tipogiro_id}
                          </p>
                        )}
                      </div>

                      <div className="flex items-center justify-end mt-4">
                        <button
                          type="submit"
                          className="inline-flex items-center px-4 py-2 bg-indigo-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-indigo-500 active:bg-indigo-700 focus:outline-none focus:border-indigo-700 focus:ring focus:ring-indigo-300 disabled:opacity-25 transition"
                        >
                          Guardar cambios
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
