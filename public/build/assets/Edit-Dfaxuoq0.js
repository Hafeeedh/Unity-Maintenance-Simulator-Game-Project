import{r as o,j as e}from"./app-BUPJ0MyC.js";import{A as c}from"./AuthenticatedLayout-Cml3nqo3.js";import"./ApplicationLogo-DNpt8IG0.js";import"./transition-DtOdZKmH.js";const b=({reminder:a,user:r})=>{const[t,l]=o.useState({title:a.title,description:a.description,date:a.date}),s=d=>{const{name:n,value:m}=d.target;l({...t,[n]:m})},i=d=>{d.preventDefault(),console.log(t)};return e.jsx("div",{children:e.jsx(c,{user:r,header:"Reminders",children:e.jsxs("div",{className:"max-w-2xl mx-auto dark:bg-gray-800 p-4 mt-4",children:[e.jsx("h1",{className:"text-2xl font-semibold mb-4 dark:text-gray-200",children:"Edit Reminder"}),e.jsxs("form",{onSubmit:i,className:"space-y-4 p-4 dark:text-gray-900",children:[e.jsxs("div",{children:[e.jsx("label",{htmlFor:"title",className:"block dark:text-gray-300 text-sm font-medium text-gray-700",children:"Title:"}),e.jsx("input",{type:"text",id:"title",name:"title",value:t.title,onChange:s,className:"mt-1 p-2 border rounded-md w-full"})]}),e.jsxs("div",{children:[e.jsx("label",{htmlFor:"description",className:"block dark:text-gray-300 text-sm font-medium text-gray-700",children:"Description:"}),e.jsx("textarea",{id:"description",name:"description",value:t.description,onChange:s,className:"mt-1 p-2 border rounded-md w-full"})]}),e.jsxs("div",{children:[e.jsx("label",{htmlFor:"date",className:"block text-sm dark:text-gray-300 font-medium text-gray-700",children:"Date:"}),e.jsx("input",{type:"date",id:"date",name:"date",value:t.date,onChange:s,className:"mt-1 p-2 border rounded-md w-full"})]}),e.jsx("div",{children:e.jsx("button",{type:"submit",className:"bg-blue-500 text-white px-4 py-2 rounded-full hover:bg-blue-600",children:"Update Reminder"})})]})]})})})};export{b as default};