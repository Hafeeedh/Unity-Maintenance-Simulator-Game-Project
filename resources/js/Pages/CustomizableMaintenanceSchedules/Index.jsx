import React, { useState, useEffect } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';

const CustomizableMaintenanceSchedulesIndex = ({ auth, Schedules }) => {
    const [maintenanceSchedules, setMaintenanceSchedules] = useState(Schedules);

    useEffect(() => {
        setMaintenanceSchedules(Schedules);
    }, [Schedules]);

    const handleCreateSchedule = () => {
        console.log('Creating a new maintenance schedule...');
        // Placeholder for creating a new maintenance schedule
    };

    const handleEditSchedule = (scheduleId) => {
        console.log(`Editing maintenance schedule with ID: ${scheduleId}`);
        // Placeholder for editing an existing maintenance schedule
    };

    const handleDeleteSchedule = (scheduleId) => {
        console.log(`Deleting maintenance schedule with ID: ${scheduleId}`);
        // Placeholder for deleting an existing maintenance schedule
    };

    return (
        <div>
            <AuthenticatedLayout
                user={auth.user}
                header={<h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">Customizable Maintenance Schedules</h2>}
            >
                <Head title="Customizable Maintenance Schedules" />
                <div className="my-4 p-6 bg-white dark:bg-gray-800 dark:text-gray-200 rounded-md shadow-md">
                    <h1 className="text-2xl font-semibold mb-4">Manage Your Maintenance Schedules</h1>

                    <section className="mb-8">
                        <h2 className="text-xl font-semibold mb-2">Your Custom Maintenance Schedules</h2>
                        {maintenanceSchedules.length === 0 ? (
                            <p className="text-gray-600 dark:text-gray-300">No maintenance schedules found.</p>
                        ) : (
                            <ul className="space-y-4">
                                {maintenanceSchedules.map((schedule) => (
                                    <li key={schedule.id} className="bg-gray-100 dark:bg-gray-700 p-4 rounded-md flex items-center justify-between">
                                        <div>
                                            <h3 className="text-lg font-semibold mb-2">{schedule.title}</h3>
                                            <p className="text-sm text-gray-500">{`Start Date: ${schedule.start_date} | End Date: ${schedule.end_date}`}</p>
                                            <p className="text-sm text-gray-500">{`Description: ${schedule.description}`}</p>
                                        </div>
                                        <div className="flex space-x-2">
                                            <button
                                                onClick={() => handleEditSchedule(schedule.id)}
                                                className="text-blue-500 hover:underline"
                                            >
                                                Edit
                                            </button>
                                            <button
                                                onClick={() => handleDeleteSchedule(schedule.id)}
                                                className="text-red-500 hover:underline"
                                            >
                                                Delete
                                            </button>
                                        </div>
                                    </li>
                                ))}
                            </ul>
                        )}
                    </section>

                    <section>
                        <h2 className="text-xl font-semibold mb-2">Create a New Maintenance Schedule</h2>
                        <button
                            onClick={handleCreateSchedule}
                            className="bg-blue-500 text-white px-4 py-2 rounded-full hover:bg-blue-600"
                        >
                            Create Schedule
                        </button>
                    </section>
                </div>
            </AuthenticatedLayout>
        </div>
    );
};

export default CustomizableMaintenanceSchedulesIndex;
