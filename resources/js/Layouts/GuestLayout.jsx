import ApplicationLogo from '@/Components/ApplicationLogo';
import { Link } from '@inertiajs/react';

export default function Guest({ children }) {
    return (
        // <div className="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-primary">
        <div
          className="min-h-screen flex flex-col pt-80 sm:pt-20 px-60 bg-cover bg-center"
          style={{ backgroundImage: `url('/logo2.png')` }}
        >
          <div>
                {/* <Link href="/">
                    <ApplicationLogo className="w-40 h-40 fill-current text-gray-50" />
                </Link> */}
            </div>

            <div className="w-full sm:max-w-md mt-6 px-6 py-4 bg-white shadow-md overflow-hidden sm:rounded-lg">
                {children}
            </div>
        </div>
    );
}
