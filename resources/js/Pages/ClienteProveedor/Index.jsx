import Pagination from "@/Components/Pagination";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head, Link, router } from "@inertiajs/react";
import ReactPaginate from 'react-paginate';

export default function Index({ auth, dclienteproveedors, children, queryParams = null, success }) {
  const handlePageClick = (data) => {
    const selectedPage = data.selected + 1;
    router.get(dclienteproveedors.path, { page: selectedPage });
  };

  const handleDelete = (id) => {
    if (window.confirm("Are you sure you want to delete this item?")) {
      router.delete(route('dclienteproveedors.destroy', id), {
        onSuccess: () => {
          // Handle any additional actions after successful deletion
        }
      });
    }
  };

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
          Gestion de Clientes y Proveedores
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
                    Clientes y Proveedores
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">Lista de Clientes y Proveedores</p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <a
                    type="button"
                    href={route("dclienteproveedors.create")}
                    active={route().current("dclienteproveedors.create")}
                    className="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                  >
                    Add new
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
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
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
                            Tipocliente
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Esembarazada
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Carnetidentidad
                          </th>
                          <th
                            scope="col"
                            className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Activo
                          </th>

                          <th
                            scope="col"
                            className="px-3 py-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          ></th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-200 bg-white">
                        {dclienteproveedors.data.map((dclienteproveedor, index) => (
                          <tr key={dclienteproveedor.id} className="even:bg-gray-50">
                            <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900">
                              {index + 1}
                            </td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                              {dclienteproveedor.denominacion}
                            </td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                              {dclienteproveedor.tipocliente === 2 ? 'Cliente' : 'Proveedor'}
                            </td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                              {dclienteproveedor.tipocliente === 2 ? renderIcon(dclienteproveedor.esembarazada): ''}
                            </td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                              {dclienteproveedor.tipocliente === 2 ? dclienteproveedor.carnetidentidad : ''}
                            </td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                              {renderIcon(dclienteproveedor.activo)}
                            </td>

                            <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900">
                              <a
                                href={`/dclienteproveedors/${dclienteproveedor.id}`}
                                className="text-gray-600 font-bold hover:text-gray-900 mr-2"
                              >
                                Show
                              </a>
                              <a
                                href={`/dclienteproveedors/${dclienteproveedor.id}/edit`}
                                className="text-indigo-600 font-bold hover:text-indigo-900 mr-2"
                              >
                                Edit
                              </a>
                              <button
                                type="button"
                                onClick={() => handleDelete(dclienteproveedor.id)}
                                className="text-red-600 font-bold hover:text-red-900"
                              >
                                Delete
                              </button>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                    {/* <Pagination links={dclienteproveedors.meta.links} /> */}
                    <div className="mt-4 px-4">
                      <ReactPaginate
                        previousLabel={"previous"}
                        nextLabel={"next"}
                        breakLabel={"..."}
                        breakClassName={"break-me"}
                        pageCount={dclienteproveedors.last_page}
                        marginPagesDisplayed={2}
                        pageRangeDisplayed={5}
                        onPageChange={handlePageClick}
                        containerClassName={"pagination"}
                        subContainerClassName={"pages pagination"}
                        activeClassName={"active"}
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
