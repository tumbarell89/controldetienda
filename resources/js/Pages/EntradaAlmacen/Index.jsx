import Pagination from "@/Components/Pagination";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head, Link, router } from "@inertiajs/react";
import { useState } from "react";

export default function Index({ auth, dentradaalmacens, children, queryParams = null, success }) {
  const [currentPage, setCurrentPage] = useState(dentradaalmacens.current_page);

  const handlePageClick = (data) => {
    const selectedPage = data.selected + 1;
    setCurrentPage(selectedPage);
    router.get(dentradaalmacens.path, { page: selectedPage });
  };

  const handleDelete = (id) => {
    if (window.confirm("¿Está seguro que desea eliminar este elemento?")) {
      router.delete(route('dentradaalmacens.destroy', id), {
        onSuccess: () => {
          alert('kkkk');
        },
        onError: (errors) => {
          if (errors.products) {
              alert(errors.products);
          } else {
              alert('Ocurrió un error al eliminar la entrada de almacén.');
          }
      }
      });
    }
  };

  const handleComplete = (id) => {
    if (window.confirm("¿Está seguro que desea cerrar la factura?")) {
      router.put(route('dentradaalmacens.complete', id), {
        onSuccess: () => {
        }
      });
    }
  };

  // Function to format the date
  const formatDate = (dateString) => {
    if (!dateString) return '';
    return new Date(dateString).toISOString().split('T')[0];
  };

  const renderIcon = (value) => {
    if (value === 1) {
      return <span className="text-green-600">✔️</span>;
    } else if (value === 0) {
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
          Gestión de Productos
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
                    Gestión de Entradas de productos al Almacén
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">Lista de Facturas entradas</p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <a
                    type="button"
                    href={route('dentradaalmacens.create')} active={route().current('dentradaalmacens.create')}
                    className="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm
                     hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
                      focus-visible:outline-indigo-600"
                  >
                    Adicionar
                  </a>
                </div>
              </div>

              <div className="flow-root">
                <div className="mt-8 overflow-x-auto">
                  <div className="inline-block min-w-full py-2 align-middle">
                    <table className="w-full divide-y divide-gray-300">
                      <thead>
                        <tr>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide
                             text-gray-500"
                          >
                            No
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Factura
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Total
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Proveedor
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Almacén
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Cerrado
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Fecha de Creación
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Fecha de Actualización
                          </th>
                          <th
                            scope="col"
                            className="px-3 py-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          ></th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-200 bg-white">
                        {
                          dentradaalmacens.data.map((dentradaalmacen, index) => (
                            <tr key={dentradaalmacen.id} className="even:bg-gray-50">
                              <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900">
                                {index + 1}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dentradaalmacen.factura}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dentradaalmacen.total}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dentradaalmacen.dclienteproveedor.denominacion}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dentradaalmacen.nalmacen.denominacion}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                              {renderIcon(dentradaalmacen.estado)}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {formatDate(dentradaalmacen.created_at)}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {formatDate(dentradaalmacen.updated_at)}
                              </td>
                              <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900">
                                <a
                                  href={`/dentradaalmacens/${dentradaalmacen.id}`}
                                  className="text-gray-600 font-bold hover:text-gray-900 mr-2"
                                >
                                  Mostrar
                                </a>
                                {dentradaalmacen.estado !== 1 && (
                                  <a
                                    href={`/dentradaalmacens/${dentradaalmacen.id}/edit`}
                                    className="text-indigo-600 font-bold hover:text-indigo-900 mr-2"
                                  >
                                    Editar
                                  </a>
                                )}
                                <button
                                  type="button"
                                  onClick={() => handleDelete(dentradaalmacen.id)}
                                  className="text-red-600 font-bold hover:text-red-900"
                                >
                                  Eliminar
                                </button>
                                {dentradaalmacen.estado !== 1 && (
                                <button
                                  type="button"
                                  onClick={() => handleComplete(dentradaalmacen.id)}
                                  className="text-green-600 font-bold hover:text-red-900 pl-2"
                                >
                                  Completar
                                </button>
                              )}
                              </td>
                            </tr>
                          ))
                        }
                      </tbody>
                    </table>
                    <Pagination
                      pageCount={dentradaalmacens.last_page}
                      onPageChange={handlePageClick}
                      currentPage={currentPage}
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      {children}
    </Authenticated>
  );
}
