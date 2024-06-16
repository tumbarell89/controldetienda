import{j as s,Y as t,a as d}from"./app-D55QJb-h.js";import{A as l}from"./AuthenticatedLayout-BV2I3DVP.js";import"./ApplicationLogo-BDCfafCO.js";import"./transition-DgQRMRgR.js";function h({auth:i,success:c,dproducto:e,tasks:n,queryParams:r}){const a=m=>m?new Date(m).toISOString().split("T")[0]:"";return s.jsxs(l,{user:i.user,header:s.jsx("h2",{className:"font-semibold text-xl text-gray-800 leading-tight",children:"Productos en el Almacen de ventas"}),children:[s.jsx(t,{title:"Centro Comercial Arroyo Arenas"}),s.jsx("div",{className:"py-12",children:s.jsx("div",{className:"max-w-full mx-auto sm:px-6 lg:px-8 space-y-6",children:s.jsx("div",{className:"p-4 sm:p-8 bg-white shadow sm:rounded-lg",children:s.jsxs("div",{className:"w-full",children:[s.jsxs("div",{className:"sm:flex sm:items-center",children:[s.jsxs("div",{className:"sm:flex-auto",children:[s.jsx("h1",{className:"text-base font-semibold leading-6 text-gray-900",children:"Mostrar Giro"}),s.jsx("p",{className:"mt-2 text-sm text-gray-700",children:"Detalles del Producto."})]}),s.jsx("div",{className:"mt-4 sm:ml-16 sm:mt-0 sm:flex-none",children:s.jsx(d,{href:route("dalmacenventas.index"),className:"block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600",children:"Back"})})]}),s.jsx("div",{className:"flow-root",children:s.jsx("div",{className:"mt-8 overflow-x-auto",children:s.jsx("div",{className:"inline-block min-w-full py-2 align-middle",children:s.jsx("div",{className:"mt-6 border-t border-gray-100",children:s.jsxs("dl",{className:"divide-y divide-gray-100",children:[s.jsxs("div",{className:"px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0",children:[s.jsx("dt",{className:"text-sm font-medium leading-6 text-gray-900",children:"Denominacion"}),s.jsx("dd",{className:"mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0",children:e.denominacion})]}),s.jsxs("div",{className:"px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0",children:[s.jsx("dt",{className:"text-sm font-medium leading-6 text-gray-900",children:"Precio de Costo"}),s.jsx("dd",{className:"mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0",children:e.preciocosto})]}),s.jsxs("div",{className:"px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0",children:[s.jsx("dt",{className:"text-sm font-medium leading-6 text-gray-900",children:"Codigo CUP"}),s.jsx("dd",{className:"mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0",children:e.codigocup})]}),s.jsxs("div",{className:"px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0",children:[s.jsx("dt",{className:"text-sm font-medium leading-6 text-gray-900",children:"Codigo de Producto"}),s.jsx("dd",{className:"mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0",children:e.codigoproducto})]}),s.jsxs("div",{className:"px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0",children:[s.jsx("dt",{className:"text-sm font-medium leading-6 text-gray-900",children:"Unidad de Medida"}),s.jsx("dd",{className:"mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0",children:e.unidadmedida})]}),s.jsxs("div",{className:"px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0",children:[s.jsx("dt",{className:"text-sm font-medium leading-6 text-gray-900",children:"Tipo de Giro"}),s.jsx("dd",{className:"mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0",children:e.ntipogiro.denominacion})]}),s.jsxs("div",{className:"px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0",children:[s.jsx("dt",{className:"text-sm font-medium leading-6 text-gray-900",children:"Fecha de Creacion"}),s.jsx("dd",{className:"mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0",children:a(e.created_at)})]}),s.jsxs("div",{className:"px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0",children:[s.jsx("dt",{className:"text-sm font-medium leading-6 text-gray-900",children:"Fecha de actualizacion"}),s.jsx("dd",{className:"mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0",children:a(e.updated_at)})]})]})})})})})]})})})})]})}export{h as default};
