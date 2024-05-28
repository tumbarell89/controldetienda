import { Head, Link, useForm } from "@inertiajs/react";
import Authenticated from "@/Layouts/AuthenticatedLayout";

export default function Create({ auth, ntipogiros }) {
  const { data, setData, post, errors } = useForm({
    denominacion: "",

    dtipogiro_id: "", // Cambiamos `id_giro` a `giro_id` para que sea más claro
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    post(route("dproductos.store"));
  };

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Crear Producto
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
                    Create Producto
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">
                    Create a new Producto.
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
                      <div className="mb-4">
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
                      </div>

                      <div className="mb-4">
                        <label className="block text-sm font-medium text-gray-700">
                          Tipo de Giro
                        </label>
                        <select
                          value={data.tipogiro_id}
                          onChange={(e) =>
                            setData("tipogiro_id", e.target.value)
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
