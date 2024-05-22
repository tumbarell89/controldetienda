import Pagination from "@/Components/Pagination";
import Authenticated from "@/Layouts/AuthenticatedLayout";
import { Head, Link, useForm } from "@inertiajs/react";
import ReactPaginate from 'react-paginate';

export default function Index({ auth, ngiros, children, queryParams = null, success }) {
  const handlePageClick = (data) => {
    const selectedPage = data.selected + 1;
    Inertia.get(ngiros.path, { page: selectedPage });
  };

  const { data, setData, post, errors } = useForm({
    _method: 'PATCH',
    ...queryParams // assuming queryParams contain the necessary fields for the form
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    post(route('ngiros.update', ngiros.id));
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
      <div className="py-12">
        <div className="max-w-full mx-auto sm:px-6 lg:px-8 space-y-6">
          <div className="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
            <div className="w-full">
              <div className="sm:flex sm:items-center">
                <div className="sm:flex-auto">
                  <h1 className="text-base font-semibold leading-6 text-gray-900">
                    Update Ngiro
                  </h1>
                  <p className="mt-2 text-sm text-gray-700">
                    Update existing Ngiro.
                  </p>
                </div>
                <div className="mt-4 sm:ml-16 sm:mt-0 sm:flex-none">
                  <Link
                    href={route('ngiros.index')}
                    className="block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                  >
                    Back
                  </Link>
                </div>
              </div>

              <div className="flow-root">
                <div className="mt-8 overflow-x-auto">
                  <div className="max-w-xl py-2 align-middle">
                    <form method="POST" onSubmit={handleSubmit} encType="multipart/form-data">
                      {Object.keys(data).map(key => (
                        <input
                          key={key}
                          type="hidden"
                          name={key}
                          value={data[key]}
                        />
                      ))}
                      <input
                        type="hidden"
                        name="_method"
                        value="PATCH"
                      />
                      <div>
                        <label className="block text-sm font-medium text-gray-700">Denominacion</label>
                        <input
                          type="text"
                          name="denominacion"
                          value={data.denominacion || ''}
                          onChange={(e) => setData('denominacion', e.target.value)}
                          className="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                        />
                        {errors.denominacion && <div className="text-red-600">{errors.denominacion}</div>}
                      </div>
                      <button
                        type="submit"
                        className="mt-4 inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                      >
                        Update
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/* {ngiros.meta && ngiros.meta.links && (
            <Pagination links={ngiros.meta.links} />
          )} */}
        </div>
      </div>
      {children}
    </Authenticated>
  );
}
