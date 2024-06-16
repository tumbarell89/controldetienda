import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head, Link, router } from "@inertiajs/react";
import React, { useEffect, useState } from "react";
import Pagination from "@/Components/Pagination"; // Importar el nuevo componente

export default function Index({ auth, ngiros, flash }) {
  const [currentPage, setCurrentPage] = useState(ngiros.current_page);

  const handlePageClick = (data) => {
    const selectedPage = data.selected + 1;
    setCurrentPage(selectedPage);
    router.get(route('ngiros.index'), { page: selectedPage });
  };

  const handleDelete = (id) => {
    if (window.confirm("¿Está seguro que desea eliminar este elemento?")) {
      router.delete(route('ngiros.destroy', id), {
        onSuccess: () => {
          alert('Elemento eliminado correctamente');
        },
        onError: (errors) => {
          alert('Hubo un error al eliminar el elemento');
        }
      });
    }
  };

  useEffect(() => {
    if (flash.success) {
      alert(flash.success);
    }
    if (flash.error) {
      alert(flash.error);
    }
  }, [flash]);

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Gestión de Clasificador de Giros
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
                    Giros
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">Lista de Giros</p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <Link
                    href={route('ngiros.create')}
                    className="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                  >
                    Adicionar
                  </Link>
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
                            Denominación
                          </th>
                          <th
                            scope="col"
                            className="px-3 py-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                          ></th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-200 bg-white">
                        {ngiros.data.map((ngiro, index) => (
                          <tr key={ngiro.id} className="even:bg-gray-50">
                            <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900">
                              {index + 1 + ngiros.from - 1}
                            </td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                              {ngiro.denominacion}
                            </td>
                            <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900">
                              <Link
                                href={`/ngiros/${ngiro.id}`}
                                className="text-gray-600 font-bold hover:text-gray-900 mr-2"
                              >
                                Mostrar
                              </Link>
                              <Link
                                href={`/ngiros/${ngiro.id}/edit`}
                                className="text-indigo-600 font-bold hover:text-indigo-900 mr-2"
                              >
                                Editar
                              </Link>
                              <button
                                type="button"
                                onClick={() => handleDelete(ngiro.id)}
                                className="text-red-600 font-bold hover:text-red-900"
                              >
                                Eliminar
                              </button>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                    <Pagination
                      pageCount={ngiros.last_page}
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
    </Authenticated>
  );
}
