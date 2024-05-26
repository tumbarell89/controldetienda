import Pagination from "@/Components/Pagination";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head, Link, router } from "@inertiajs/react";
import ReactPaginate from 'react-paginate';

export default function Index({ auth, ntipogiros, children, queryParams = null, success }) {
  const handlePageClick = (data) => {
    const selectedPage = data.selected + 1;
    router.get(ntipogiros.path, { page: selectedPage });
  };

  const handleDelete = (id) => {
    if (window.confirm("Are you sure you want to delete this item?")) {
      router.delete(route('ntipogiros.destroy', id), {
        onSuccess: () => {
          // Handle any additional actions after successful deletion
        }
      });
    }
  };

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Gestion de clasificador de Tipos de Giros
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
                    Tipos de Giros
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">Lista de Tipos Giros</p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <a
                    type="button"
                    href={route('ntipogiros.create')} active={route().current('ntipogiros.create')}
                    className="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm
                     hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
                      focus-visible:outline-indigo-600"
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
                            Giro
                          </th>
                          <th
                            scope="col"
                            className="px-3 py-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          ></th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-200 bg-white">
                        {
                          ntipogiros.data.map((ntipogiro, index) => (
                            <tr key={ntipogiro.id} className="even:bg-gray-50">
                              <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900">
                                {index + 1}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {ntipogiro.denominacion}
                              </td>
                              <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                {ntipogiro.ngiro ? ntipogiro.ngiro.denominacion : 'N/A'}
                              </td>
                              <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900">
                                <a
                                  href={`/ntipogiros/${ntipogiro.id}`}
                                  className="text-gray-600 font-bold hover:text-gray-900 mr-2"
                                >
                                  Show
                                </a>
                                <a
                                  href={`/ntipogiros/${ntipogiro.id}/edit`}
                                  className="text-indigo-600 font-bold hover:text-indigo-900 mr-2"
                                >
                                  Edit
                                </a>
                                <button
                                  type="button"
                                  onClick={() => handleDelete(ntipogiro.id)}
                                  className="text-red-600 font-bold hover:text-red-900"
                                >
                                  Delete
                                </button>
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
                        pageCount={ntipogiros.last_page}
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
