import{j as e,a as n,Y as d}from"./app-D55QJb-h.js";import{A as c}from"./AuthenticatedLayout-BV2I3DVP.js";import"./react-paginate-BGWrcnHq.js";import"./ApplicationLogo-BDCfafCO.js";import"./transition-DgQRMRgR.js";function x({links:i}){return e.jsx("nav",{className:"text-center mt-4",children:i.map(t=>e.jsx(n,{preserveScroll:!0,href:t.url||"",className:"inline-block py-2 px-3 rounded-lg text-gray-200 text-xs "+(t.active?"bg-gray-950 ":" ")+(t.url?"hover:bg-gray-950":"!text-gray-500 cursor-not-allowed "),dangerouslySetInnerHTML:{__html:t.label}},t.label))})}function g({auth:i,ngiros:t,children:r}){return e.jsxs(c,{user:i.user,header:e.jsx("h2",{className:"font-semibold text-xl text-gray-800 leading-tight",children:"Gestion de claisificador de Giros"}),children:[e.jsx(d,{title:"Centro Comercial Arroyo Arenas"}),e.jsx("div",{class:"py-12",children:e.jsx("div",{class:"max-w-full mx-auto sm:px-6 lg:px-8 space-y-6",children:e.jsx("div",{class:"p-4 sm:p-8 bg-white shadow sm:rounded-lg",children:e.jsxs("div",{class:"w-full",children:[e.jsxs("div",{class:"sm:flex sm:items-center",children:[e.jsxs("div",{class:"sm:flex-auto",children:[e.jsx("h1",{class:"text-base font-semibold leading-6 text-gray-900",children:"Giros"}),e.jsx("p",{class:"mt-2 text-sm text-gray-700",children:"Lista de Giros"})]}),e.jsx("div",{class:"mt-4 sm:ml-16 sm:mt-0 sm:flex-none",children:e.jsx("a",{type:"button",href:route("ngiros.create"),active:route().current("ngiros.create"),class:`block rounded-md bg-indigo-600 px-3 py-2 text-center text-sm font-semibold text-white shadow-sm
                     hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2
                      focus-visible:outline-indigo-600`,children:"Adicionar"})})]}),e.jsx("div",{class:"flow-root",children:e.jsx("div",{class:"mt-8 overflow-x-auto",children:e.jsxs("div",{class:"inline-block min-w-full py-2 align-middle",children:[e.jsxs("table",{class:"w-full divide-y divide-gray-300",children:[e.jsx("thead",{children:e.jsxs("tr",{children:[e.jsx("th",{scope:"col",class:`py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide
                             text-gray-500`,children:"No"}),e.jsx("th",{scope:"col",class:"py-3 pl-4 pr-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500",children:"Denominacion"}),e.jsx("th",{scope:"col",class:"px-3 py-3 text-left text-xs font-semibold uppercase tracking-wide text-gray-500"})]})}),e.jsx("tbody",{class:"divide-y divide-gray-200 bg-white",children:t.data.map((s,l)=>e.jsxs("tr",{className:"even:bg-gray-50",children:[e.jsx("td",{className:"whitespace-nowrap py-4 pl-4 pr-3 text-sm font-semibold text-gray-900",children:l+1}),e.jsx("td",{className:"whitespace-nowrap px-3 py-4 text-sm text-gray-500",children:s.denominacion}),e.jsx("td",{className:"whitespace-nowrap py-4 pl-4 pr-3 text-sm font-medium text-gray-900",children:e.jsxs("form",{action:`/ngiros/${s.id}`,method:"POST",onSubmit:a=>{a.preventDefault(),window.confirm("Are you sure to delete?")&&fetch("/ngiros/${ngiro.id}",{method:"DELETE",headers:{"Content-Type":"application/json","X-CSRF-TOKEN":document.querySelector('meta[name="csrf-token"]').getAttribute("content")}}).then(o=>{o.ok})},children:[e.jsx("a",{href:`/ngiros/${s.id}`,className:"text-gray-600 font-bold hover:text-gray-900 mr-2",children:"Show"}),e.jsx("a",{href:`/ngiros/${s.id}/edit`,className:"text-indigo-600 font-bold hover:text-indigo-900 mr-2",children:"Edit"}),e.jsx("button",{type:"submit",className:"text-red-600 font-bold hover:text-red-900",children:"Delete"})]})})]},s.id))})]}),e.jsx(x,{links:t.meta.links})]})})})]})})})}),r]})}export{g as default};
