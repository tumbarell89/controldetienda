import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';

export default function Dashboard({ auth,children }) {
    return (
        <AuthenticatedLayout
            user={auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">Principal</h2>}
        >
            <Head title="Centro Comercial Arroyo Arenas" />

            <div className="py-12">
                <div className="max-w-2xl mx-auto sm:px-2 lg:px-2">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div className="p-6 text-gray-900">Controlar las ventas y el inventario por mejores resultados!!</div>
                    </div>
                </div>
            </div>
            {children}
        </AuthenticatedLayout>
    );
}
