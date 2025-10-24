/**
 * Book Quick View Modal
 * Allows users to preview book details without leaving the catalog page
 */

const BookQuickView = {
    modal: null,
    
    init: function() {
        if (!this.modal) {
            // Create modal HTML
            const modalHTML = `
                <div class="modal fade" id="bookQuickViewModal" tabindex="-1" role="dialog" aria-labelledby="quickViewLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary text-white">
                                <h5 class="modal-title" id="quickViewLabel">
                                    <i class="fas fa-eye"></i> Quick View
                                </h5>
                                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <!-- Book Image -->
                                    <div class="col-md-5 text-center">
                                        <img id="qv-image" src="" class="img-fluid rounded shadow mb-3" alt="Book Cover" style="max-height: 400px;">
                                        <div id="qv-stock-badge"></div>
                                    </div>
                                    
                                    <!-- Book Details -->
                                    <div class="col-md-7">
                                        <h3 id="qv-title" class="font-weight-bold text-primary mb-3"></h3>
                                        
                                        <div class="book-meta mb-3">
                                            <p class="mb-2">
                                                <strong><i class="fas fa-user text-primary"></i> Author:</strong>
                                                <span id="qv-author"></span>
                                            </p>
                                            <p class="mb-2">
                                                <strong><i class="fas fa-tag text-primary"></i> Category:</strong>
                                                <span id="qv-category" class="badge badge-info"></span>
                                            </p>
                                            <p class="mb-2">
                                                <strong><i class="fas fa-building text-primary"></i> Publisher:</strong>
                                                <span id="qv-publisher"></span>
                                            </p>
                                            <p class="mb-2">
                                                <strong><i class="fas fa-barcode text-primary"></i> ISBN:</strong>
                                                <span id="qv-isbn"></span>
                                            </p>
                                        </div>
                                        
                                        <div class="description mb-3">
                                            <h6 class="font-weight-bold"><i class="fas fa-align-left text-primary"></i> Description</h6>
                                            <p id="qv-description" class="text-muted small"></p>
                                        </div>
                                        
                                        <div class="price-section mb-3">
                                            <h4 class="text-success font-weight-bold">
                                                INR <span id="qv-price"></span>
                                            </h4>
                                            <p class="small text-muted">
                                                <i class="fas fa-boxes"></i> <span id="qv-quantity"></span> available
                                            </p>
                                        </div>
                                        
                                        <div class="action-buttons">
                                            <button id="qv-add-to-cart" class="btn btn-success btn-lg btn-block mb-2">
                                                <i class="fas fa-cart-plus"></i> Add to Cart
                                            </button>
                                            <a id="qv-view-details" href="#" class="btn btn-outline-primary btn-block">
                                                <i class="fas fa-info-circle"></i> View Full Details
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            
            // Append modal to body
            $('body').append(modalHTML);
            this.modal = $('#bookQuickViewModal');
        }
    },
    
    show: function(bookData) {
        this.init();
        
        // Populate modal with book data
        $('#qv-image').attr('src', bookData.imageUrl || 'https://via.placeholder.com/300x400/f8f9fa/6c757d?text=Book+Cover');
        $('#qv-title').text(bookData.name);
        $('#qv-author').text(bookData.author || 'Unknown Author');
        $('#qv-category').text(bookData.category || 'N/A');
        $('#qv-publisher').text(bookData.publisher || 'Not specified');
        $('#qv-isbn').text(bookData.isbn || 'Not specified');
        $('#qv-description').text(bookData.description || 'No description available.');
        $('#qv-price').text(bookData.price);
        $('#qv-quantity').text(bookData.quantity);
        
        // Stock badge
        let stockBadge = '';
        if (bookData.quantity == 0) {
            stockBadge = '<span class="badge badge-danger badge-lg"><i class="fas fa-times-circle"></i> Out of Stock</span>';
            $('#qv-add-to-cart').prop('disabled', true).removeClass('btn-success').addClass('btn-secondary');
        } else if (bookData.quantity <= 5) {
            stockBadge = '<span class="badge badge-warning badge-lg"><i class="fas fa-exclamation-triangle"></i> Low Stock</span>';
            $('#qv-add-to-cart').prop('disabled', false).removeClass('btn-secondary').addClass('btn-success');
        } else {
            stockBadge = '<span class="badge badge-success badge-lg"><i class="fas fa-check-circle"></i> In Stock</span>';
            $('#qv-add-to-cart').prop('disabled', false).removeClass('btn-secondary').addClass('btn-success');
        }
        $('#qv-stock-badge').html(stockBadge);
        
        // Set links
        const contextPath = window.location.pathname.split('/')[1];
        $('#qv-view-details').attr('href', `/${contextPath}/books/detail?bookId=${bookData.id}`);
        $('#qv-add-to-cart').off('click').on('click', function() {
            window.location.href = `/${contextPath}/customers/cart/add?bookId=${bookData.id}`;
        });
        
        // Show modal
        this.modal.modal('show');
    }
};

// Make globally available
window.BookQuickView = BookQuickView;

// Add Quick View buttons to book cards
$(document).ready(function() {
    // Add quick view button to each book card
    $('.book-card').each(function() {
        const bookCard = $(this);
        const bookItem = bookCard.closest('.book-item');
        
        // Extract book data from data attributes
        const bookData = {
            id: bookItem.data('book-id') || bookCard.data('book-id'),
            name: bookItem.data('name') || bookCard.find('.book-title').text(),
            author: bookItem.data('author') || bookCard.find('.card-text:contains("Author")').text().replace('Author:', '').trim(),
            category: bookItem.data('category'),
            publisher: bookItem.data('publisher'),
            isbn: bookItem.data('isbn'),
            description: bookItem.data('description') || bookCard.find('.book-description').text(),
            price: bookItem.data('price'),
            quantity: bookItem.data('quantity'),
            imageUrl: bookCard.find('.book-image').attr('src')
        };
        
        // Add quick view button if not already present
        if (bookCard.find('.quick-view-btn').length === 0) {
            const quickViewBtn = $(`
                <button class="btn btn-sm btn-info quick-view-btn mt-2" style="position: absolute; top: 10px; left: 10px; z-index: 10; opacity: 0; transition: opacity 0.3s;">
                    <i class="fas fa-eye"></i> Quick View
                </button>
            `);
            
            bookCard.css('position', 'relative').prepend(quickViewBtn);
            
            // Show button on hover
            bookCard.hover(
                function() {
                    $(this).find('.quick-view-btn').css('opacity', '1');
                },
                function() {
                    $(this).find('.quick-view-btn').css('opacity', '0');
                }
            );
            
            // Handle click
            quickViewBtn.on('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                BookQuickView.show(bookData);
            });
        }
    });
});
