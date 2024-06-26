import { Head, Link } from '@inertiajs/react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { usePage } from '@inertiajs/react';

const Account = () => {
  const { user, qt } = usePage().props;
  const carDetails = { make: "(N/A)", model: "(N/A)", year: "(N/A)" };
  const roles = ['admin', 'client', 'employee', 'Guest'];
  const colors = ['blue', 'green', 'red', 'yellow'];

  return (
    <div className='dark:text-white dark:bg-gray-900'>
      <AuthenticatedLayout
        user={user}
        header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">My Account</h2>}
      >
        <Head title="My Account" />
        <div className="container mx-auto mt-6 p-6 bg-white dark:bg-gray-800 rounded-md shadow-md">

          <div className="mb-6">
            <h1 className="text-2xl font-bold mb-4">{qt}</h1>
          </div>

          <div className="bg-white dark:bg-gray-800 p-6 rounded shadow-md mb-6">
            <h2 className="text-lg font-bold mb-4">User Profile Information</h2>
            <p className="mb-2"><strong>Name:</strong> {user.name}</p>
            <p className="mb-2"><strong>Email:</strong> {user.email}</p>

            <div className="flex flex-wrap">
              {roles.map((role, index) => (<>
                {user.role === role && (
                  <div key={index} className={`bg-${colors[index].toLowerCase()}-500 text-white px-12 py-1 rounded-full mr-2 mb-2`}>
                    {role}
                  </div>
                )}

              </>

              ))}
            </div>
          </div>



          <Link href='/dashboard'>
          <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
            <h2 className="text-lg font-bold mb-2">Dashboard and Analytics</h2>
            <p>This section could display mileage tracking, fuel efficiency, and maintenance costs.</p>
          </div></Link>

          <Link href='/profile'>
          <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
            <h2 className="text-lg font-bold mb-2">Security</h2>
            <p>This section could allow users to change passwords and enable 2FA.</p>
          </div></Link>
        </div>
      </AuthenticatedLayout>
    </div>
  );
}

export default Account;
