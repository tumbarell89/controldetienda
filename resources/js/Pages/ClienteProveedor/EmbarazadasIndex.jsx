import React, { useRef } from "react";
import { Head, Link, router } from "@inertiajs/react";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import ReactPaginate from "react-paginate";
import { DownloadTableExcel } from 'react-export-table-to-excel';

export default function EmbarazadasIndex({ auth, embarazadas }) {
    const tableRef = useRef(null);

    const handlePageClick = (data) => {
        const selectedPage = data.selected + 1;
        router.get(embarazadas.path, { page: selectedPage });
    };

    return (
        <Authenticated
            user={auth.user}
            header={
                <h2 className="font-semibold text-xl text-gray-800 leading-tight">
                    Lista de Embarazadas
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
                                        Lista de Embarazadas
                                    </h1>
                                    <p className="mt-2 text-sm text-gray-700">
                                        Clientes y Proveedores Embarazadas
                                    </p>
                                </div>
                                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none flex space-x-2">
                                    <DownloadTableExcel
                                        filename="embarazadas"
                                        sheet="embarazadas"
                                        currentTableRef={tableRef.current}
                                    >
                                        <button className="block rounded-md bg-green-600 py-2 px-4 text-center text-sm font-semibold text-white shadow-sm hover:bg-green-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-green-600">
                                            Exportar Excel
                                        </button>
                                    </DownloadTableExcel>
                                    {/* <Link
                                        href={route("dclienteproveedors.exportPDF")}
                                        className="block rounded-md bg-red-600 py-2 px-4 text-center text-sm font-semibold text-white shadow-sm hover:bg-red-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-red-600"
                                    >
                                        Exportar PDF
                                    </Link> */}
                                </div>
                            </div>
                            <div className="flow-root">
                                <div className="mt-8 overflow-x-auto">
                                    <div className="inline-block min-w-full py-2 align-middle">
                                        <table className="w-full divide-y divide-gray-300" id="embarazadas" ref={tableRef}>
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
                                                        className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                                                    >
                                                        Carnet de Identidad
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        className="py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"
                                                    >
                                                        Fecha de Creado
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody className="divide-y divide-gray-200 bg-white">
                                                {embarazadas.data.map((embarazada, index) => (
                                                    <tr key={embarazada.id} className="even:bg-gray-50">
                                                        <td className="whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900">
                                                            {index + 1}
                                                        </td>
                                                        <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                                            {embarazada.denominacion}
                                                        </td>
                                                        <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                                            {embarazada.carnetidentidad}
                                                        </td>
                                                        <td className="whitespace-nowrap px-3 py-4 text-sm text-gray-500">
                                                            {new Date(embarazada.created_at).toLocaleDateString()}
                                                        </td>
                                                    </tr>
                                                ))}
                                            </tbody>
                                        </table>
                                        <div className="mt-4 px-4">
                                            <ReactPaginate
                                                previousLabel={"previous"}
                                                nextLabel={"next"}
                                                breakLabel={"..."}
                                                breakClassName={"break-me"}
                                                pageCount={embarazadas.last_page}
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
        </Authenticated>
    );
}
