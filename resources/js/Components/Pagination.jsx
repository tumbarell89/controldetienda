import React from 'react';
import ReactPaginate from 'react-paginate';

export default function Pagination({ pageCount, onPageChange, currentPage }) {
  return (
    <div className="mt-4 px-4 flex justify-center">
      <ReactPaginate
        previousLabel={'<<'}
        nextLabel={'>>'}
        breakLabel={'...'}
        breakClassName={'break-me'}
        pageCount={pageCount}
        marginPagesDisplayed={2}
        pageRangeDisplayed={5}
        onPageChange={onPageChange}
        containerClassName={'pagination flex justify-center space-x-2'}
        subContainerClassName={'pages pagination'}
        activeClassName={'text-white bg-indigo-600 px-3 py-1 rounded'}
        previousClassName={'prev px-3 py-1 border rounded hover:bg-gray-200'}
        nextClassName={'next px-3 py-1 border rounded hover:bg-gray-200'}
        disabledClassName={'disabled opacity-50 cursor-not-allowed'}
        pageClassName={'page px-3 py-1 border rounded hover:bg-gray-200'}
        breakLinkClassName={'break px-3 py-1'}
        forcePage={currentPage - 1} // Asegúrate de que la página actual esté resaltada
      />
    </div>
  );
}
