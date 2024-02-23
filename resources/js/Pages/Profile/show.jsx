import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link, useForm, usePage } from '@inertiajs/react';
import { useEffect, useState } from 'react';

const Show = ({ userID }) => {
    const { props } = usePage();
    const carDetails = { make: "(N/A)", model: "(N/A)", year: "(N/A)" };
    const colors = ['blue', 'green', 'red', 'yellow'];

    const [userInfo, setUserInfo] = useState({
        name: '',
        email: '',
        role: '',
    });
    const handluserinfo = (userName, userEmail, userRole) => {
        useEffect(() => {
            setUserInfo({
                name: userName,
                email: userEmail,
                role: userRole,
            }
            )
        }, [userInfo])
    }

    return (
        <AuthenticatedLayout
            user={props.auth.user}
            header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">User Account</h2>}
        >
            <Head title="My Account" />
            <ul className='bg-red-500 mx-auto'>{userID.map((user, index) => (

                <li key={index}>{handluserinfo(userID[1], userID[2], userID[3])}</li>

            ))
            }
            </ul>



            <div className="container mx-auto mt-6 p-6 bg-white dark:bg-gray-800 rounded-md shadow-md">

                <div className="mb-6">
                    <h1 className="text-2xl font-bold mb-4">{props.qt}</h1>
                </div>

                <div className="bg-white dark:bg-gray-800 p-6 rounded shadow-md mb-6">
                    <h2 className="text-lg font-bold mb-4">User Profile Information</h2>

                    <p className="mb-2"><strong>Name:</strong> {userInfo.name}</p>
                    <p className="mb-2"><strong>Email:</strong> {userInfo.email}</p>

                    <div className="flex flex-wrap">

                        {userInfo.role && (
                            <div className={`bg-${userInfo.role} text-white px-12 py-1 rounded-full mr-2 mb-2`}>
                                {userInfo.role}
                            </div>

                        )

                        }


                    </div>
                </div>

                <div className="bg-white dark:bg-gray-800 p-6 rounded shadow-md mb-6">
                    <h2 className="text-lg font-bold mb-4">Car Details</h2>
                    <p className="mb-2"><strong>Make:</strong> {carDetails.make}</p>
                    <p className="mb-2"><strong>Model:</strong> {carDetails.model}</p>
                    <p className="mb-2"><strong>Year:</strong> {carDetails.year}</p>
                </div>

                <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
                    <h2 className="text-lg font-bold mb-2">Maintenance History</h2>
                    <p>This section could display service records and reminders.</p>
                </div>

                <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
                    <h2 className="text-lg font-bold mb-2">Dashboard and Analytics</h2>
                    <p>This section could display mileage tracking, fuel efficiency, and maintenance costs.</p>
                </div>

                <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
                    <h2 className="text-lg font-bold mb-2">App Preferences</h2>
                    <p>This section could allow users to customize notification settings and app preferences.</p>
                </div>

                <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
                    <h2 className="text-lg font-bold mb-2">Security</h2>
                    <p>This section could allow users to change passwords and enable 2FA.</p>
                </div>

                <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
                    <h2 className="text-lg font-bold mb-2">Support and Help</h2>
                    <p>This section could display FAQs, a help center, and contact support information.</p>
                </div>

                <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
                    <h2 className="text-lg font-bold mb-2">Logout and Account Deactivation</h2>
                    <p>This section could include a logout button and an option for account deactivation.</p>
                </div>

                <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
                    <h2 className="text-lg font-bold mb-2">Connected Services</h2>
                    <p>This section could involve integration with auto repair shops or other connected services.</p>
                </div>

                <div className="dark:bg-gray-800 bg-white p-4 rounded shadow-md mb-4">
                    <h2 className="text-lg font-bold mb-2">Legal and Privacy</h2>
                    <p>This section could include links to terms of service and the privacy policy.</p>
                </div>
            </div>
            <style>
                {`
                .bg-admin{
                    background-color:blue;
                }
                .bg-client{
                    background-color:red;
                }
                .bg-employee{
                    background-color:green;
                }
                .bg-guest{
                    background-color:yellow;
                }
                
                `}
            </style>
        </AuthenticatedLayout>

    )
}
export default Show;