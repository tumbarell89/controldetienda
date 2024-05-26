import React from 'react';
import { Head, useForm } from '@inertiajs/react';
import Authenticated from '@/Layouts/AuthenticatedLayout';

export default function Edit({ auth, ntipogiro, ngiros }) {
  const { data, setData, put, errors } = useForm({
    denominacion: ntipogiro.denominacion || '',
    ngiros_id: ntipogiro.ngiros_id || '', // Cambiar 'giro_id' a 'ngiros_id'
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    put(route('ntipogiros.update', ntipogiro.id));
  };

  return (
    <Authenticated
      user={auth.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Editar Tipo de Giro
        </h2>
      }
    >
      <Head title="Editar Tipo de Giro" />
      <div className="py-12">
        <div className="max-w-full mx-auto sm:px-6 lg:px-8 space-y-6">
          <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
            <div className="w-full">
              <div className="sm:flex sm:items-center">
                <div className="sm:flex-auto">
                  <h1 className="text-base font-semibold leading-6 text-gray-900">Editar Tipo de Giro</h1>
                  <p className="mt-2 text-sm text-gray-700">Actualiza el Tipo de Giro.</p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <a
                    href={route('ntipogiros.index')}
                    className="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                  >
                    Volver
                  </a>
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
                          <label htmlFor="giro_id" className="block text-sm font-medium text-gray-700">
                            Giro
                          </label>
                          <select
                            id="giro_id"
                            name="giro_id"
                            value={data.ngiros_id}
                            onChange={e => setData('ngiros_id', e.target.value)}
                            className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                          >
                            <option value="" disabled>Seleccione un giro</option>
                            {ngiros.map((ngiro) => (
                              <option key={ngiro.id} value={ngiro.id}>
                                {ngiro.denominacion}
                              </option>
                            ))}
                          </select>
                          {errors.ngiros_id && <p className="mt-2 text-sm text-red-600">{errors.ngiros_id}</p>}
                        </div>

                        <div className="flex items-center gap-4">
                          <button
                            type="submit"
                            className="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                          >
                            Actualizar
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
