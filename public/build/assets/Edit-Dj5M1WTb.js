import{W as m,j as e,Y as c,a as x}from"./app-D55QJb-h.js";import{A as u}from"./AuthenticatedLayout-BV2I3DVP.js";import"./react-paginate-BGWrcnHq.js";import"./ApplicationLogo-BDCfafCO.js";import"./transition-DgQRMRgR.js";function b({auth:n,ngiro:i,children:o}){const{data:a,setData:d,patch:l,errors:t}=m({denominacion:i.denominacion||""}),r=s=>{s.preventDefault(),l(route("ngiros.update",i.id))};return e.jsxs(u,{user:n.user,header:e.jsx("h2",{className:"font-semibold text-xl text-gray-800 leading-tight",children:"Gestion de claisificador de Giros"}),children:[e.jsx(c,{title:"Centro Comercial Arroyo Arenas"}),e.jsx("div",{className:"py-12",children:e.jsx("div",{className:"max-w-full mx-auto sm:px-6 lg:px-8 space-y-6",children:e.jsx("div",{className:"p-4 sm:p-8 bg-white shadow sm:rounded-lg",children:e.jsxs("div",{className:"w-full",children:[e.jsxs("div",{className:"sm:flex sm:items-center",children:[e.jsxs("div",{className:"sm:flex-auto",children:[e.jsx("h1",{className:"text-base font-semibold leading-6 text-gray-900",children:"Update Ngiro"}),e.jsx("p",{className:"mt-2 text-sm text-gray-700",children:"Update existing Ngiro."})]}),e.jsx("div",{className:"mt-4 sm:ml-16 sm:mt-0 sm:flex-none",children:e.jsx(x,{href:route("ngiros.index"),className:"block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600",children:"Back"})})]}),e.jsx("div",{className:"flow-root",children:e.jsx("div",{className:"mt-8 overflow-x-auto",children:e.jsx("div",{className:"max-w-xl py-2 align-middle",children:e.jsxs("form",{method:"POST",onSubmit:r,encType:"multipart/form-data",children:[e.jsx("input",{type:"hidden",name:"_method",value:"PATCH"}),e.jsxs("div",{children:[e.jsx("label",{className:"block text-sm font-medium text-gray-700",children:"Denominacion"}),e.jsx("input",{type:"text",name:"denominacion",value:a.denominacion,onChange:s=>d("denominacion",s.target.value),className:"mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"}),t.denominacion&&e.jsx("div",{className:"text-red-600",children:t.denominacion})]}),e.jsx("button",{type:"submit",className:"mt-4 inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500",children:"Update"})]})})})})]})})})}),o]})}export{b as default};
