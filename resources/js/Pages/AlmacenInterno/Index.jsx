import Pagination from "@/Components/Pagination";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head, Link, router } from "@inertiajs/react";
import { useState, useRef } from "react";
import { DownloadTableExcel } from 'react-export-table-to-excel';

export default function Index({ auth, dproductos, children, queryParams = null, success }) {
  const [currentPage, setCurrentPage] = useState(dproductos.current_page);
  const tableRef = useRef(null);

  const handlePageClick = (data) => {
    const selectedPage = data.selected + 1;
    setCurrentPage(selectedPage);
    router.get(dproductos.path, { page: selectedPage });
  };

  // Function to format the date
  const formatDate = (dateString) => {
    if (!dateString) return '';
    return new Date(dateString).toISOString().split('T')[0];
  };

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Productos en el Almacén Interno
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
                    Productos en el almacén interno
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">Lista de productos en el almacén interno</p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none flex space-x-2">
                  <DownloadTableExcel
                    filename="AlmacenInterno"
                    sheet="AlmacenInterno"
                    currentTableRef={tableRef.current}
                  >
                    <button className="block rounded-md bg-green-600 py-2 px-4 text-center text-sm font-semibold text-white shadow-sm hover:bg-green-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600">
                      Exportar Excel
                    </button>
                  </DownloadTableExcel>
                </div>
              </div>
              <div className="flow-root">
                <div className="mt-8 overflow-x-auto">
                  <div className="inline-block min-w-full py-2 align-middle">
                    <table className="w-full divide-y divide-gray-300" ref={tableRef} >
                      <thead>
                        <tr>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">No</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Denominación</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Precio de Costo</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Precio de Venta</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Cantidad</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Código CUP</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Código de Producto</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Unidad de Medida</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Tipo de Giro</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Fecha de Creación</th>
                          <th scope="col" className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500">Fecha de Actualización</th>
                          <th scope="col" className="px-3 py-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"></th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-200 bg-white">
                        {dproductos.data.map((dproducto, index) => (
                          <tr key={dproducto.id} className="even:bg-gray-50">
                            <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900">{index + 1}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{dproducto.denominacion}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{dproducto.preciocosto}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{dproducto.precioventa}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{dproducto.cantidad}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{dproducto.codigocup}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{dproducto.codigoproducto}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{dproducto.unidadmedida}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{dproducto.tipogiro ? dproducto.tipogiro : 'N/A'}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{formatDate(dproducto.created_at)}</td>
                            <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">{formatDate(dproducto.updated_at)}</td>
                            <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900">
                              <a href={`/dalmaceninternos/${dproducto.id}`} className="text-gray-600 font-bold hover:text-gray-900 mr-2">Mostrar</a>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                    <Pagination
                      pageCount={dproductos.last_page}
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
