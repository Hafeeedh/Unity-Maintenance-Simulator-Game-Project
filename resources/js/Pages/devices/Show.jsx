// resources/js/Pages/devices/Show.jsx
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import React, { useEffect, useRef, useState } from 'react';
import QRCode from 'qrcode.react';
import { useForm } from '@inertiajs/react';

const Show = ({ device, auth }) => {
  const [formatData, setFormatData] = useState('');
  const canvasRef = useRef(null);
  const [requestSent, setRequestSet] = useState(false);
  const purchased = true;
  const installded = false;


  const { data, setData, post, processing } = useForm({
    device: device,
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    handleDevieRequest();
  };

  useEffect(() => {
    Object.entries(device).map((elemnt, index) => {
      setFormatData((formatData) => [...formatData, index + " : " + elemnt + "\n"]);
    })
  }, [device])

  function formatedData(data) {
    let ready = "Devices:\n";
    data.forEach(element => {
      ready += "\n" + element;
    });
    return ready;
  }
  useEffect(() => {
    canvasRef.current = document.getElementsByTagName('canvas')[0];
  })
  const handleDownload = (name) => {
    const canvas = canvasRef.current;
    const ctx = canvas.getContext('2d');

    const dataUrl = canvas.toDataURL('image/png');

    const link = document.createElement('a');
    link.href = dataUrl;
    link.download = name + '.png';

    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }

  const handleDevieRequest = () => {
    setRequestSet(true);
    setTimeout(() => {
      setRequestSet(false);
      post(route('requestDevice.store'));
    }, 2000)
    console.log(device)
  }
  return (
    <div className='dark:text-white'>
      <AuthenticatedLayout
        user={auth.user}
        header={
          <h2 className="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            Dashboard - {auth.user.role}
          </h2>
        }
      >
        {requestSent && <div className='relative text-center slide-down bg-green-500 w-auto h-auto p-4 mx-auto'>Request Sent</div>}
        <div className="my-4 max-w-md mx-auto bg-white dark:bg-gray-800 p-6 rounded-md shadow-md mb-4 transition duration-300 ease-in-out transform hover:shadow-lg hover:scale-105">
          <h1 className="text-2xl font-semibold mb-4">Device Details</h1>
          {auth.user.role === "admin" || (purchased && installded && auth.user.role === "client") ? (<>
            <div className='absolute top-0 right-4 mt-4 '>Detach</div>
          </>) : (<>
            {(auth.user.role === "client" && (!installded && purchased)) || (auth.user.role === "employee" && !installded) ? (<>
              <div className='absolute top-0 right-4 mt-4 '>Pending</div>
            </>) : (<>
              {(auth.user.role === "employee" && installded) || (auth.user.role === "client" && (installded && purchased)) ? (<>
                <div className='absolute top-0 right-4 mt-4 '>Detach</div>
              </>) : (<>
                <div className='absolute top-0 right-4 mt-4 '>Attach</div>
              </>)}
            </>)}
          </>)}

          <div className="bg-white dark:bg-gray-800 p-6 rounded-md shadow-md">
            <ul className="space-y-4">
              <li className="text-lg font-semibold">{`Serial Number: ${device.serial_number}`}</li>
              <li className="text-lg font-semibold">{`Type: ${device.type}`}</li>
              <li>
                {auth.user.role === "admin" || (purchased && installded && auth.user.role === "client") ? (<>
                  <p className="text-sm text-gray-500">{`Installation Date: ${device.installation_date}`}</p>
                  <p className="text-sm text-gray-500">{`Device Price : $...`}</p>
                </>) : (<>
                  {(auth.user.role === "client" && (!installded && purchased)) || (auth.user.role === "employee" && !installded) ? (<>
                    <p className="text-sm text-gray-500">{`Installation pending..`}</p>
                  </>) : (<>
                    {(auth.user.role === "employee" && installded) || (auth.user.role === "client" && (installded && purchased)) ? (<>
                      <p className="text-sm text-gray-500">{`Installation Date: ${device.installation_date}`}</p>
                    </>) : (<>

                      <p className="text-sm text-gray-500">{`Device Price : $...`}</p>
                    </>)}
                  </>)}
                </>)}
              </li>
            </ul>

            {formatData && (
              <div className="mt-6">
                <div className='border flex justify-center bg-gray-100 p-4'>
                  {<QRCode value={formatedData(formatData)} renderAs="canvas" />}
                </div>
                <button
                  className='p-2 dark:text-white hover:bg-orange-500 bg-gray-900 uppercase mt-4 rounded'
                  onClick={(e) => { e.preventDefault(); handleDownload(device.serial_number) }}
                >
                  Download
                </button>

                <form onSubmit={handleSubmit} className='relative h-6'>

                  <button
                    className='absolute p-1 dark:text-white hover:bg-green-500 bg-orange-500 uppercase right-0 rounded'
                  >
                    Request
                  </button>
                </form>

              </div>
            )}
          </div>
        </div>
        <style>
          {`
        
          .slide-down {
            animation: slideDown 0.5s ease-in;
          }
          
          @keyframes slideDown {
            from {
              transform: translateY(-100%);
              opacity: 0;
            }
            to {
              transform: translateY(0);
              opacity: 1;
            }
          }
          
          
          `}
        </style>
      </AuthenticatedLayout>
    </div>

  );
};

export default Show;
