import { useState } from 'react';
import ApplicationLogo from '@/Components/ApplicationLogo';
import Dropdown from '@/Components/Dropdown';
import NavLink from '@/Components/NavLink';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink';
import { Link } from '@inertiajs/react';

export default function Authenticated({ user, header, children }) {
    const [showingNavigationDropdown, setShowingNavigationDropdown] = useState(false);

    return (
        // <div className="min-h-screen bg-primary">
        <div
          className="min-h-screen flex flex-col pt-6 sm:pt-0 bg-cover bg-center"
          style={{ backgroundImage: `url('/logo2.png')` }}
        >
            <nav className="bg-primary border-b bg-primary">
                <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div className="flex justify-between h-16">
                        <div className="flex">
                            {
                            <><div className="shrink-0 flex items-center">
                                    <Link href="/">
                                        <ApplicationLogo className="h-10 w-25 fill-current text-gray-800" />
                                    </Link>
                                </div>
                                   <div className="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex">
                                        <NavLink href={route('dashboard')} active={route().current('dashboard')}>
                                            Principal
                                        </NavLink>
                                        <NavLink href={route('dalmaceninternos.index')} active={route().current('dalmaceninternos.index')}>
                                            Almacen Interno
                                        </NavLink>
                                        <NavLink href={route('dalmacenventas.index')} active={route().current('dalmacenventas.index')}>
                                            Almacen de venta
                                        </NavLink>
                                        <NavLink href={route('dentradaalmacens.index')} active={route().current('dentradaalmacens.index')}>
                                            Entrada de almacen
                                        </NavLink>
                                        <NavLink href={route('dsalidaalmacens.index')} active={route().current('dsalidaalmacens.index')}>
                                            Salida de almacen
                                        </NavLink>
                                        <NavLink href={route('dventas.index')} active={route().current('dventas.index')}>
                                            Venta
                                        </NavLink>
                                    </div>

                                    </>}
                        </div>

                        <div className="hidden sm:flex sm:items-center sm:ms-6">
                            <div className="ms-3 relative">
                                <Dropdown>
                                    <Dropdown.Trigger>
                                        <span className="inline-flex rounded-md">
                                            <button
                                                type="button"
                                                className="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150"
                                            >
                                                {user.name}

                                                <svg
                                                    className="ms-2 -me-0.5 h-4 w-4"
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    viewBox="0 0 20 20"
                                                    fill="currentColor"
                                                >
                                                    <path
                                                        fillRule="evenodd"
                                                        d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                                        clipRule="evenodd"
                                                    />
                                                </svg>
                                            </button>
                                        </span>
                                    </Dropdown.Trigger>

                                    <Dropdown.Content>
                                        <Dropdown.Link href={route('logout')} method="post" as="button">
                                            Salir
                                        </Dropdown.Link>
                                        <Dropdown.Link href={route('profile.edit')}>Configurar usuario</Dropdown.Link>
                                        <Dropdown.Link href={route('dproductos.index')}>Productos</Dropdown.Link>
                                        <Dropdown.Link href={route('dclienteproveedors.index')}>Cliente Proveedor</Dropdown.Link>
                                        <Dropdown.Link href={route('ngiros.index')}>Giro</Dropdown.Link>
                                        <Dropdown.Link href={route('ntipogiros.index')}>Tipos de Giro</Dropdown.Link>
                                        <Dropdown.Link href={route('dclienteproveedors.embarazadas')}>Plantilla de embarazadas</Dropdown.Link>
                                    </Dropdown.Content>
                                </Dropdown>
                            </div>
                        </div>

                        <div className="-me-2 flex items-center sm:hidden">
                            <button
                                onClick={() => setShowingNavigationDropdown((previousState) => !previousState)}
                                className="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out"
                            >
                                <svg className="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                                    <path
                                        className={!showingNavigationDropdown ? 'inline-flex' : 'hidden'}
                                        strokeLinecap="round"
                                        strokeLinejoin="round"
                                        strokeWidth="2"
                                        d="M4 6h16M4 12h16M4 18h16"
                                    />
                                    <path
                                        className={showingNavigationDropdown ? 'inline-flex' : 'hidden'}
                                        strokeLinecap="round"
                                        strokeLinejoin="round"
                                        strokeWidth="2"
                                        d="M6 18L18 6M6 6l12 12"
                                    />
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>

                <div className={(showingNavigationDropdown ? 'block' : 'hidden') + ' sm:hidden'}>
                    <div className="pt-2 pb-3 space-y-1">
                        <ResponsiveNavLink href={route('dashboard')} active={route().current('dashboard')}>
                            Principal
                        </ResponsiveNavLink>
                    </div>

                    <div className="pt-4 pb-1 border-t border-gray-200">
                        <div className="px-4">
                            <div className="font-medium text-base text-gray-800">{user.name}</div>
                            <div className="font-medium text-sm text-gray-500">{user.email}</div>
                        </div>

                        <div className="mt-3 space-y-1">
                            <ResponsiveNavLink href={route('profile.edit')}>Profile</ResponsiveNavLink>
                            <ResponsiveNavLink method="post" href={route('logout')} as="button">
                                Salir
                            </ResponsiveNavLink>
                        </div>
                    </div>
                </div>
            </nav>

            {header && (
                <header className="bg-white shadow">
                <div className="max-w-7xl mx-auto py-6 px-4 sm:px-6
                      lg:px-8 text-3xl font-serif font-bold ">
                        {/* <h1 className='text-primary
                      shadow-dark-700 shadow-2xl'>Centro Comercial Arroyo Arenas</h1> */}
                      <h1 class="text-5xl font-extrabold text-primary drop-shadow-lg shadow-black">Centro Comercial Arroyo Arenas</h1>
                      </div>
            </header>


            )}

            <main className="py-12 min-h-screen flex-col pt-6 bg-cover bg-center"
          style={{ backgroundImage: `url('/logo2.png')` }}>{children}</main>
        </div>
    );
}
