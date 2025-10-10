package com.shashirajraja.onlinebookstore.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shashirajraja.onlinebookstore.entity.Book;
import com.shashirajraja.onlinebookstore.entity.BookDetail;
import com.shashirajraja.onlinebookstore.entity.CurrentSession;
import com.shashirajraja.onlinebookstore.entity.Seller;
import com.shashirajraja.onlinebookstore.service.BookService;
import com.shashirajraja.onlinebookstore.service.SellerService;

@Controller
@RequestMapping("/seller")
public class SellerController {

    @Autowired
    private BookService bookService;
    
    @Autowired
    private SellerService sellerService;
    
    @Autowired
    private CurrentSession currentSession;

    // Seller Dashboard
    @GetMapping({"", "/"})
    public String sellerDashboard(Model model) {
        try {
            String username = currentSession.getUser().getUsername();
            Seller seller = sellerService.getSeller(username);
            
            if (seller == null) {
                model.addAttribute("error", "Seller profile not found!");
                return "error";
            }
            
            Set<Book> sellerBooks = seller.getBooks();
            if (sellerBooks == null) {
                sellerBooks = new java.util.HashSet<>();
            }
            
            model.addAttribute("books", sellerBooks);
            model.addAttribute("totalBooks", sellerBooks.size());
            model.addAttribute("seller", seller);
            return "seller-dashboard";
        } catch (Exception e) {
            model.addAttribute("error", "Error loading dashboard: " + e.getMessage());
            return "error";
        }
    }
    
    // View seller's books
    @GetMapping("/books")
    public String viewSellerBooks(Model model) {
        try {
            String username = currentSession.getUser().getUsername();
            Seller seller = sellerService.getSeller(username);
            
            if (seller == null) {
                model.addAttribute("error", "Seller profile not found!");
                return "error";
            }
            
            Set<Book> sellerBooks = seller.getBooks();
            model.addAttribute("books", sellerBooks);
            model.addAttribute("seller", seller);
            return "seller-books-list";
        } catch (Exception e) {
            model.addAttribute("error", "Error loading books: " + e.getMessage());
            return "error";
        }
    }
    
    // Add new book form
    @GetMapping("/books/add")
    public String showAddBookForm(Model model) {
        try {
            // Verify seller session
            if (currentSession.getUser() == null) {
                return "redirect:/login";
            }
            
            String username = currentSession.getUser().getUsername();
            Seller seller = sellerService.getSeller(username);
            
            if (seller == null) {
                model.addAttribute("error", "Seller profile not found!");
                return "error";
            }
            
            Book book = new Book();
            BookDetail bookDetail = new BookDetail();
            book.setBookDetail(bookDetail);
            
            model.addAttribute("book", book);
            model.addAttribute("seller", seller);
            return "seller-add-book";
        } catch (Exception e) {
            model.addAttribute("error", "Error loading add book form: " + e.getMessage());
            return "error";
        }
    }
    
    // Process add book
    @PostMapping("/books/add")
    public String addBook(@ModelAttribute("book") Book book, RedirectAttributes redirectAttributes) {
        try {
            String username = currentSession.getUser().getUsername();
            Seller seller = sellerService.getSeller(username);
            
            if (seller == null) {
                redirectAttributes.addFlashAttribute("message", "Seller profile not found!");
                redirectAttributes.addFlashAttribute("messageType", "error");
                return "redirect:/seller";
            }
            
            // Ensure BookDetail is properly initialized
            if (book.getBookDetail() == null) {
                book.setBookDetail(new BookDetail());
            }
            
            // Set default values for BookDetail fields if they're null
            BookDetail bookDetail = book.getBookDetail();
            if (bookDetail.getType() == null) {
                bookDetail.setType("Book");
            }
            if (bookDetail.getDetail() == null) {
                bookDetail.setDetail(bookDetail.getDescription() != null ? bookDetail.getDescription() : "");
            }
            
            // Set the seller for this book
            book.setSeller(seller);
            
            String result = bookService.addBook(book);
            redirectAttributes.addFlashAttribute("message", result);
            redirectAttributes.addFlashAttribute("messageType", "success");
        } catch (Exception e) {
            String errorMessage = "Error adding book. ";
            
            // Handle specific database constraint violations
            if (e.getMessage() != null) {
                if (e.getMessage().contains("Data too long for column")) {
                    if (e.getMessage().contains("'detail'")) {
                        errorMessage = "Book description is too long. Please keep it under 2000 characters.";
                    } else if (e.getMessage().contains("'author'")) {
                        errorMessage = "Author name is too long. Please keep it under 255 characters.";
                    } else if (e.getMessage().contains("'publisher'")) {
                        errorMessage = "Publisher name is too long. Please keep it under 255 characters.";
                    } else if (e.getMessage().contains("'isbn'")) {
                        errorMessage = "ISBN is too long. Please keep it under 50 characters.";
                    } else if (e.getMessage().contains("'description'")) {
                        errorMessage = "Description is too long. Please keep it under 1000 characters.";
                    } else {
                        errorMessage = "One of the fields is too long. Please check your input and try again.";
                    }
                } else if (e.getMessage().contains("Duplicate entry")) {
                    errorMessage = "A book with this ISBN already exists. Please check the ISBN and try again.";
                } else if (e.getMessage().contains("cannot be null")) {
                    errorMessage = "Please fill in all required fields and try again.";
                } else {
                    errorMessage = "Unable to add book. Please check your input and try again.";
                }
            }
            
            redirectAttributes.addFlashAttribute("message", errorMessage);
            redirectAttributes.addFlashAttribute("messageType", "error");
        }
        return "redirect:/seller";
    }
    
    // Edit book form
    @GetMapping("/books/edit")
    public String showEditBookForm(@RequestParam("bookId") int bookId, Model model, RedirectAttributes redirectAttributes) {
        String username = currentSession.getUser().getUsername();
        Seller seller = sellerService.getSeller(username);
        
        Book book = bookService.getBookById(bookId);
        if (book != null && book.getSeller() != null && book.getSeller().getUsername().equals(username)) {
            model.addAttribute("book", book);
            return "seller-edit-book";
        } else {
            redirectAttributes.addFlashAttribute("message", "Book not found or you don't have permission to edit this book!");
            redirectAttributes.addFlashAttribute("messageType", "error");
            return "redirect:/seller/books";
        }
    }
    
    // Process edit book
    @PostMapping("/books/edit")
    public String editBook(@ModelAttribute("book") Book book, RedirectAttributes redirectAttributes) {
        try {
            String username = currentSession.getUser().getUsername();
            
            // Verify that the book belongs to this seller
            Book existingBook = bookService.getBookById(book.getId());
            if (existingBook == null || existingBook.getSeller() == null || 
                !existingBook.getSeller().getUsername().equals(username)) {
                redirectAttributes.addFlashAttribute("message", "You don't have permission to edit this book!");
                redirectAttributes.addFlashAttribute("messageType", "error");
                return "redirect:/seller";
            }
            
            // Ensure BookDetail is properly initialized
            if (book.getBookDetail() == null) {
                book.setBookDetail(new BookDetail());
            }
            
            // Set default values for BookDetail fields if they're null
            BookDetail bookDetail = book.getBookDetail();
            if (bookDetail.getType() == null) {
                bookDetail.setType("Book");
            }
            if (bookDetail.getDetail() == null) {
                bookDetail.setDetail(bookDetail.getDescription() != null ? bookDetail.getDescription() : "");
            }
            
            // Preserve the seller relationship
            book.setSeller(existingBook.getSeller());
            
            String result = bookService.updateBook(book);
            redirectAttributes.addFlashAttribute("message", result);
            redirectAttributes.addFlashAttribute("messageType", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error updating book: " + e.getMessage());
            redirectAttributes.addFlashAttribute("messageType", "error");
        }
        return "redirect:/seller";
    }
    
    // Delete book
    @GetMapping("/books/delete")
    public String deleteBook(@RequestParam("bookId") int bookId, RedirectAttributes redirectAttributes) {
        try {
            String username = currentSession.getUser().getUsername();
            
            // Verify that the book belongs to this seller
            Book book = bookService.getBookById(bookId);
            if (book == null || book.getSeller() == null || 
                !book.getSeller().getUsername().equals(username)) {
                redirectAttributes.addFlashAttribute("message", "You don't have permission to delete this book!");
                redirectAttributes.addFlashAttribute("messageType", "error");
                return "redirect:/seller";
            }
            
            String result = bookService.removeBookById(bookId);
            redirectAttributes.addFlashAttribute("message", result);
            redirectAttributes.addFlashAttribute("messageType", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error deleting book: " + e.getMessage());
            redirectAttributes.addFlashAttribute("messageType", "error");
        }
        return "redirect:/seller";
    }
    
    // Increase book quantity
    @PostMapping("/books/increase-quantity")
    @ResponseBody
    public String increaseBookQuantity(@RequestParam("bookId") int bookId, 
                                     @RequestParam("quantity") int quantity) {
        try {
            String username = currentSession.getUser().getUsername();
            
            Book book = bookService.getBookById(bookId);
            if (book != null && book.getSeller() != null && 
                book.getSeller().getUsername().equals(username)) {
                book.setQuantity(book.getQuantity() + quantity);
                bookService.updateBook(book);
                return "Quantity increased successfully! New quantity: " + book.getQuantity();
            } else {
                return "You don't have permission to modify this book!";
            }
        } catch (Exception e) {
            return "Error increasing quantity: " + e.getMessage();
        }
    }
    
    // Seller profile
    @GetMapping("/profile")
    public String showSellerProfile(Model model) {
        try {
            String username = currentSession.getUser().getUsername();
            Seller seller = sellerService.getSeller(username);
            
            if (seller == null) {
                model.addAttribute("error", "Seller profile not found!");
                return "error";
            }
            
            model.addAttribute("seller", seller);
            return "seller-profile";
        } catch (Exception e) {
            model.addAttribute("error", "Error loading profile: " + e.getMessage());
            return "error";
        }
    }
    
    // View orders for seller's books
    @GetMapping("/orders")
    public String viewSellerOrders(Model model) {
        try {
            String username = currentSession.getUser().getUsername();
            Seller seller = sellerService.getSeller(username);
            
            if (seller == null) {
                model.addAttribute("error", "Seller profile not found!");
                return "error";
            }
            
            // For now, we'll create dummy data for orders
            // In a real application, you'd have an Order entity and OrderService
            model.addAttribute("seller", seller);
            model.addAttribute("orders", new java.util.ArrayList<>()); // Empty list for now
            model.addAttribute("totalOrders", 0);
            model.addAttribute("pendingOrders", 0);
            model.addAttribute("totalRevenue", 0.0);
            
            return "seller-orders";
        } catch (Exception e) {
            model.addAttribute("error", "Error loading orders: " + e.getMessage());
            return "error";
        }
    }
    
    // View customers who bought from this seller
    @GetMapping("/customers")
    public String viewSellerCustomers(Model model) {
        try {
            String username = currentSession.getUser().getUsername();
            Seller seller = sellerService.getSeller(username);
            
            if (seller == null) {
                model.addAttribute("error", "Seller profile not found!");
                return "error";
            }
            
            // For now, we'll create empty customer list
            // In a real application, you'd query customers who bought from this seller
            model.addAttribute("seller", seller);
            model.addAttribute("customers", new java.util.ArrayList<>());
            
            return "seller-customers";
        } catch (Exception e) {
            model.addAttribute("error", "Error loading customers: " + e.getMessage());
            return "error";
        }
    }
}
