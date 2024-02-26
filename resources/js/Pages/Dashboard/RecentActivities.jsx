// resources/js/Components/Dashboard/RecentActivities.jsx
import React, {useEffect, useState } from 'react';
import { Head, Link, useForm, usePage } from '@inertiajs/react';
const RecentActivities = ({ activities, display }) => {
  const [acts,setActs]=useState([null]);
  const [webSocketLive,setwebSocketLive]=useState(null);
  const [message,setMessage]=useState('(N/A)');
  const {props}=usePage();

  useEffect(()=>{
    setActs((prevActs) => [...prevActs, display.message.message]);
     },[display.message])
  return (
    <div className="bg-white h-56 overflow-y-auto dark:bg-gray-800 p-4 rounded-md shadow-md">
      <h2 className="text-lg font-semibold mb-2">Recent Activities</h2>
      {/*display.message.message &&(<h2 className="text-lg font-semibold mb-2">{display.message.message}</h2>)*/}
      <ul>
      {acts.map((element,idex) =>( 
        <li key={idex}>{element}</li>
      ))}
      </ul>
  </div>
  );
};

export default RecentActivities;
