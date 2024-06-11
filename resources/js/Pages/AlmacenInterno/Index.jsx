import Pagination from "@/Components/Pagination";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head, Link, router } from "@inertiajs/react";
import ReactPaginate from 'react-paginate';

export default function Index({ auth, dproductos, children, queryParams = null, success }) {
  const handlePageClick = (data) => {
    const selectedPage = data.selected + 1;
    router.get(dproductos.path, { page: selectedPage });
  };

  // Function to format the date
  const formatDate = (dateString) => {
    if (!dateString) return '';
    return new Date(dateString).toISOString().split('T')[0];
  };

  return (
    <Authenticated className="min-h-screen flex flex-col pt-80 sm:pt-20 px-60 bg-cover bg-center"
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Productos en el Almacen Interno
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
                    Productos en el alamcen interno
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">Lista de Tipos Giros en el alamcen interno</p>
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
                            Denominacion
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Precio de Costo
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Cantidad
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Codigo CUP
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Codigo de Producto
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Unidad de Medida
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Tipo de Giro
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Fecha de Creacion
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Fecha de actualizacion
                          </th>
                          <th
                            scope="col"
                            className="px-3 py-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          ></th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-200 bg-white">
                        {
                          dproductos.data.map((dproducto, index) => (
                            <tr key={dproducto.id} className="even:bg-gray-50">
                              <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900">
                                {index + 1}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dproducto.denominacion}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dproducto.preciocosto}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dproducto.cantidad}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dproducto.codigocup}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dproducto.codigoproducto}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dproducto.unidadmedida}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {dproducto.tipogiro ? dproducto.tipogiro : 'N/A'}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {formatDate(dproducto.created_at)}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {formatDate(dproducto.updated_at)}
                              </td>
                              <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900">
                                <a
                                  href={`/dalmaceninternos/${dproducto.id}`}
                                  className="text-gray-600 font-bold hover:text-gray-900 mr-2"
                                >
                                  Show
                                </a>
                              </td>
                            </tr>
                          ))
                        }
                      </tbody>
                    </table>
                    <div className="mt-4 px-4">
                      <ReactPaginate
                        previousLabel={'previous'}
                        nextLabel={'next'}
                        breakLabel={'...'}
                        breakClassName={'break-me'}
                        pageCount={dproductos.last_page}
                        marginPagesDisplayed={2}
                        pageRangeDisplayed={5}
                        onPageChange={handlePageClick}
                        containerClassName={'pagination'}
                        subContainerClassName={'pages pagination'}
                        activeClassName={'active'}
                      />
                    </div>
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
