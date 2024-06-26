// resources/js/Pages/AssetBundles/Show.jsx
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import React from 'react';

const Show = ({ assetBundle, auth }) => {
  return (
    <div>
      <AuthenticatedLayout
        user={auth.user}
        header={
          <h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            Dashboard - {auth.user.role}
          </h2>
        }
      >
        <div className="my-4">
          <h1 className="text-2xl font-semibold mb-4">AssetBundle Details</h1>
          <div className="bg-white dark:bg-gray-800 p-4 rounded-md shadow-md">
            <p className="text-lg font-semibold mb-2">Name: {assetBundle.name}</p>
            {/* Display other details as needed */}
          </div>
        </div>
      </AuthenticatedLayout>
    </div>
  );
};

export default Show;
