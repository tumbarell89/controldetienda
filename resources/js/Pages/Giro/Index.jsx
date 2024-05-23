import Pagination from "@/Components/Pagination";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head, Link, router } from "@inertiajs/react";
import ReactPaginate from 'react-paginate';



export default function Index({auth, ngiros, children, queryParams = null, success }){
  const handlePageClick = (data) => {
    const selectedPage = data.selected + 1;
    router.get(ngiros.path, { page: selectedPage });
  };

  const handleDelete = (id) => {
    if (window.confirm("Are you sure you want to delete this item?")) {
      router.delete(route('ngiros.destroy', id), {
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
          Gestion de claisificador de Giros
        </h2>
      }
    >
      <Head title="Centro Comercial Arroyo Arenas" />
      <div class="py-12">
        <div class="max-w-full mx-auto sm:px-6 lg:px-8 space-y-6">
          <div class="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
            <div class="w-full">
              <div class="sm:flex sm:items-center">
                <div class="sm:flex-auto">
                  <h1 class="text-base font-semibold leading-6 text-gray-900">
                    Giros
                  </h1>
                  <p class="mt-2 text-sm text-gray-700">Lista de Giros</p>
                </div>
                <div class="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <a
                    type="button"
                    href={route('ngiros.create')} active={route().current('ngiros.create')}
                    class="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm
                     hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
                      focus-visible:outline-indigo-600"
                  >
                    Add new
                  </a>
                </div>
              </div>

              <div class="flow-root">
                <div class="mt-8 overflow-x-auto">
                  <div class="inline-block min-w-full py-2 align-middle">
                    <table class="w-full divide-y divide-gray-300">
                      <thead>
                        <tr>
                          <th
                            scope="col"
                            class="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide
                             text-gray-500"
                          >
                            No
                          </th>

                          <th
                            scope="col"
                            class="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          >
                            Denominacion
                          </th>

                          <th
                            scope="col"
                            class="px-3 py-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          ></th>
                        </tr>
                      </thead>
                      <tbody class="divide-y divide-gray-200 bg-white">
                        {
                        ngiros.data.map((ngiro, index) => (

                          <tr key={ngiro.id} className="even:bg-gray-50">
                            <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900">
                              {index + 1}
                            </td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                              {ngiro.denominacion}
                            </td>
                            <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900">
                              {/* <form
                                action={`/ngiros/${ngiro.id}`}
                                method="POST"
                                onSubmit={(e) => {
                                  e.preventDefault();
                                  if (
                                    window.confirm("Are you sure to delete?")
                                  ) {
                                    fetch('/ngiros/${ngiro.id}', {
                                      method: "destroy",
                                      headers: {
                                        "Content-Type": "application/json",
                                        "X-CSRF-TOKEN": document
                                          .querySelector(
                                            'meta[name="csrf-token"]'
                                          )
                                          .getAttribute("content"),
                                      },
                                    }).then((response) => {
                                      if (response.ok) {
                                        // Handle the successful deletion (e.g., refresh the list)
                                      }
                                    });
                                  }
                                }}
                              > */}
                                <a
                                  href={`/ngiros/${ngiro.id}`}
                                  className="text-gray-600 font-bold hover:text-gray-900 mr-2"
                                >
                                  Show
                                </a>
                                <a
                                  href={`/ngiros/${ngiro.id}/edit`}
                                  className="text-indigo-600 font-bold hover:text-indigo-900 mr-2"
                                >
                                  Edit
                                </a>
                                <button
                                  type="button"
                                  onClick={() => handleDelete(ngiro.id)}
                                  className="text-red-600 font-bold hover:text-red-900"
                                >

                                  Delete
                                </button>
                              {/* </form> */}
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                        {/* <Pagination links={ngiros.meta.links} /> */}
                    <div className="mt-4 px-4">
                      <ReactPaginate
                        previousLabel={'previous'}
                        nextLabel={'next'}
                        breakLabel={'...'}
                        breakClassName={'break-me'}
                        pageCount={ngiros.last_page}
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
