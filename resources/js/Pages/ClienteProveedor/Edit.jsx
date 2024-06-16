import React from 'react';
import { Head, Link, useForm } from '@inertiajs/react';
import Authenticated from '@/Layouts/AuthenticatedLayout';

export default function Editar({ auth, dclienteproveedor }) {
  const { data, setData, put, errors } = useForm({
    denominacion: dclienteproveedor.denominacion || '',
    tipocliente: String(dclienteproveedor.tipocliente) || '',
    esembarazada: dclienteproveedor.esembarazada || false,
    activo: dclienteproveedor.activo || false,
    carnetidentidad: dclienteproveedor.carnetidentidad || ''
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    put(route('dclienteproveedors.update', dclienteproveedor.id));
  };

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Editar Dclienteproveedor
        </h2>
      }
    >
      <Head title="Editar Dclienteproveedor" />
      <div className="py-12">
        <div className="max-w-full mx-auto sm:px-6 lg:px-8 space-y-6">
          <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
            <div className="w-full">
              <div className="sm:flex sm:items-center">
                <div className="sm:flex-auto">
                  <h1 className="text-base font-semibold leading-6 text-gray-900">Editar Dclienteproveedor</h1>
                  <p className="mt-2 text-sm text-gray-700">Editar the details of the Dclienteproveedor.</p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <Link
                    href={route('dclienteproveedors.index')}
                    className="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                  >
                    Regresar
                  </Link>
                </div>
              </div>

              <div className="flow-root">
                <div className="mt-8 overflow-x-auto">
                  <div className="max-w-xl py-2 align-middle">
                    <form onSubmit={handleSubmit} encType="multipart/form-data">
                      <div className="space-y-6">
                        <div>
                          <label htmlFor="denominacion" className="block text-sm font-medium text-gray-700">
                            Denominacion
                          </label>
                          <input
                            id="denominacion"
                            name="denominacion"
                            type="text"
                            value={data.denominacion}
                            onChange={e => setData('denominacion', e.target.value)}
                            className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                            autoComplete="denominacion"
                            placeholder="Denominacion"
                          />
                          {errors.denominacion && <p className="mt-2 text-sm text-red-600">{errors.denominacion}</p>}
                        </div>

                        <div>
                          <label className="block text-sm font-medium text-gray-700">
                            Tipo Cliente
                          </label>
                          <div className="mt-2 space-y-2">
                            <div>
                              <label className="inline-flex items-center">
                                <input
                                  type="radio"
                                  name="tipocliente"
                                  value="1"
                                  checked={data.tipocliente === 1}
                                  onChange={e => setData('tipocliente', e.target.value)}
                                  className="form-radio"
                                />
                                <span className="ml-2">Proveedor</span>
                              </label>
                            </div>
                            <div>
                              <label className="inline-flex items-center">
                                <input
                                  type="radio"
                                  name="tipocliente"
                                  value="2"
                                  checked={data.tipocliente === 2}
                                  onChange={e => setData('tipocliente', e.target.value)}
                                  className="form-radio"
                                />
                                <span className="ml-2">Cliente</span>
                              </label>
                            </div>
                          </div>
                          {errors.tipocliente && <p className="mt-2 text-sm text-red-600">{errors.tipocliente}</p>}
                        </div>

                        {data.tipocliente === 2 && (
                          <div>
                            <div>
                              <label htmlFor="carnetidentidad" className="block text-sm font-medium text-gray-700">
                                Carnet de Identidad
                              </label>
                              <input
                                id="carnetidentidad"
                                name="carnetidentidad"
                                type="text"
                                value={data.carnetidentidad}
                                onChange={e => setData('carnetidentidad', e.target.value)}
                                className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                                placeholder="Carnet de Identidad"
                              />
                              {errors.carnetidentidad && <p className="mt-2 text-sm text-red-600">{errors.carnetidentidad}</p>}
                            </div>
                            <div>
                              <label htmlFor="esembarazada" className="block text-sm font-medium text-gray-700">
                                Es Embarazada
                              </label>
                              <input
                                id="esembarazada"
                                name="esembarazada"
                                type="checkbox"
                                checked={data.esembarazada}
                                onChange={e => setData('esembarazada', e.target.checked)}
                                className="mt-1 block rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                              />
                              {errors.esembarazada && <p className="mt-2 text-sm text-red-600">{errors.esembarazada}</p>}
                            </div>
                          </div>
                        )}

                        <div>
                          <label htmlFor="activo" className="block text-sm font-medium text-gray-700">
                            Activo
                          </label>
                          <input
                            id="activo"
                            name="activo"
                            type="checkbox"
                            checked={data.activo}
                            onChange={e => setData('activo', e.target.checked)}
                            className="mt-1 block rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                          />
                          {errors.activo && <p className="mt-2 text-sm text-red-600">{errors.activo}</p>}
                        </div>

                        <div className="flex items-center gap-4">
                          <button
                            type="submit"
                            className="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                          >
                            Submit
                          </button>
                        </div>
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
