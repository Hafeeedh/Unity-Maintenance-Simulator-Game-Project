import { Head, Link, useForm } from '@inertiajs/react';
import { useEffect, useState } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBars, faHome, faUser, faCog } from '@fortawesome/free-solid-svg-icons';
const Sidebar = ({ Children, auth, expand }) => {
    const [ssi, setSsi] = useState(false);
    useEffect(() => {
    }, [ssi])
    const handlSideBar = () => {
        setSsi((prevState) => !prevState)
    }
    return (
    <>
     {ssi ? (
        <>

            <aside className="bg-gray-800 text-gray-500 sm:w-56">
                <nav>
                    <ul className="p-0 mmLi sm:w-56">
                        <li className='px-0 py-0' onClick={handlSideBar}><span className='text-white'><FontAwesomeIcon icon={faBars} /></span></li>
                        <li><Link href={route('basic-maintenance')}>Basic Maintenance</Link></li>
                        <li><Link href={route('car-analytics')}>Car Analytics</Link></li>
                        <li><Link href={route('connected-services')}>Connected Services</Link></li>
                        <li><Link href={route('reminder-notifications')}>Reminder Notifications</Link></li>
                        <li><Link href={route('full-maintenance-suite')}>Full Maintenance Suite</Link></li>
                        <li><Link href={route('customizable-maintenance-schedules')}>Customizable Schedules</Link></li>
                        <li><Link href={route('exclusive-discounts')}>Exclusive Discounts</Link></li>
                        <li><Link href={route('priority-customer-support')}>Priority Support</Link></li>
                        <li><Link href={route('advanced-maintenance-reports')}>Advanced Reports</Link></li>
                        {Children}
                    </ul>
                </nav>
                <div className='really-idk mx-auto flex bg-gray-800'>
                    <span>
                        <img src="" alt="" />
                    </span>
                    <ul>
                        <li className='bg-gray-800 ml-2 py-4 rounded hover:rounded-lg hover:bg-gray-600  px-12'><Link href={route('myaccount')}> {auth.user.name}</Link></li>
                    </ul>
                </div>
            </aside>
            <style>
                {`
        .really-idk{
    width: auto;
    position: fixed;
    height: 7rem;
    color:white;
    cursor:pointer;
    bottom: 0;
}
    .menu-content{
    width:100%;
    height:auto;
    background-color:transparent;

    }
    .mmLi li{
    display:flex;
    width:100%;
    height:auto;
    padding:20px;
    background-color:transparent;
    transition: all 300ms ease;
    }
    .mmLi ul{
    width:100%;
    height:auto;
    }
    .mmLi ul:hover{
    width:100%;
    height:auto;
    }
    
    .mmLi li:hover{
    background-color:black;
    color:white;
    cursor:pointer;
    }`}
            </style>



        </>) : (
        <>
            <aside className="bg-gray-800" >
                <nav>
                    <ul className="mmLi">
                        <li>
                            <span className='text-white mx-auto mt-4' onClick={handlSideBar}>
                                <FontAwesomeIcon icon={faBars} size="lg" />
                            </span>
                        </li>
                        <li className='text-white mx-5 mt-4'>
                            <Link href={route('basic-maintenance')}>
                                <FontAwesomeIcon icon={faCog} size="lg" />
                            </Link>
                        </li>
                        <li className='text-white mx-5 mt-4'>
                            <Link href={route('car-analytics')}>
                                <FontAwesomeIcon icon={faCog} size="lg" />
                            </Link>
                        </li>
                        <li className='text-white mx-5 mt-4'>
                            <Link href={route('connected-services')}>
                                <FontAwesomeIcon icon={faCog} size="lg" />
                            </Link>
                        </li>
                        <li className='text-white mx-5 mt-4'>
                            <Link href={route('reminder-notifications')}>
                                <FontAwesomeIcon icon={faCog} size="lg" />
                            </Link>
                        </li>
                        <li className='text-white mx-5 mt-4'>
                            <Link href={route('full-maintenance-suite')}>
                                <FontAwesomeIcon icon={faCog} size="lg" />
                            </Link>
                        </li>
                        <li className='text-white mx-5 mt-4'>
                            <Link href={route('customizable-maintenance-schedules')}>
                                <FontAwesomeIcon icon={faCog} size="lg" />
                            </Link>
                        </li>
                        <li className='text-white mx-5 mt-4'>
                            <Link href={route('exclusive-discounts')}>
                                <FontAwesomeIcon icon={faCog} size="lg" />
                            </Link>
                        </li>
                        <li className='text-white mx-5 mt-4'>
                            <Link href={route('priority-customer-support')}>
                                <FontAwesomeIcon icon={faCog} size="lg" />
                            </Link>
                        </li>
                        <li className='text-white mx-5 mt-4'>
                            <Link href={route('advanced-maintenance-reports')}>
                                <FontAwesomeIcon icon={faCog} size="lg" />
                            </Link>
                        </li>
                        {Children}
                    </ul>
                </nav>
                <div className='really-idk mx-auto text-white flex bg-gray-800'>
                    <span>
                        <img src="" alt="" />
                    </span>
                    <ul>
                        <li ><Link href={route('myaccount')}> {auth.user.name}</Link></li>
                    </ul>
                </div>
            </aside>
            <style>
                {`
                aside{
                    width:100%;
                    overflow:hidden;
                    padding-bottom:5rem;
                    color:#1f2937;
                }
                .really-idk{
                    width: 4rem;
                    position: fixed;
                    padding:0;
                    text-wrap: wrap;
                    height: 5rem;
                    cursor:pointer;
                    bottom: 0;
                    }
                    .menu-content{
                        width:100%;
                        height:auto;
                        background-color:transparent;
                        overflow:hiddin;

                    }
                    .mmLi li{
                        display:flex;
                        width:100%;
                        height:auto;
                        padding:10px;
                        overflow:hiddin;
                        background-color:transparent;
                        transition: all 300ms ease;
                    }
                    .mmLi ul{
                        width:100%;
                        height:auto;
                        overflow:hiddin;

                    }
                    .mmLi ul:hover{
                        width:100%;
                        height:auto;
                    }
                    
                    .mmLi li:hover{
                        background-color:black;
                        color:#1f2937;
                        cursor:pointer;
                    }`}
            </style>


        </>)}
    </>
    )
}
export default Sidebar