package com.shashirajraja.onlinebookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shashirajraja.onlinebookstore.dao.AuthorityRepository;
import com.shashirajraja.onlinebookstore.dao.BookUserRepository;
import com.shashirajraja.onlinebookstore.dao.CustomerRepository;
import com.shashirajraja.onlinebookstore.dao.PurchaseDetailRepository;
import com.shashirajraja.onlinebookstore.dao.PurchaseHistoryRepository;
import com.shashirajraja.onlinebookstore.dao.SellerRepository;
import com.shashirajraja.onlinebookstore.dao.ShoppingCartRepository;
import com.shashirajraja.onlinebookstore.dao.UserRepository;
import com.shashirajraja.onlinebookstore.entity.Book;
import com.shashirajraja.onlinebookstore.entity.BookDetail;
import com.shashirajraja.onlinebookstore.entity.Authority;
import com.shashirajraja.onlinebookstore.service.BookService;

import java.util.Set;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BookService bookService;
    
    @Autowired
    private AuthorityRepository authorityRepository;
    
    @Autowired
    private BookUserRepository bookUserRepository;
    
    @Autowired
    private PurchaseDetailRepository purchaseDetailRepository;
    
    @Autowired
    private PurchaseHistoryRepository purchaseHistoryRepository;
    
    @Autowired
    private ShoppingCartRepository shoppingCartRepository;
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Autowired
    private SellerRepository sellerRepository;
    
    @Autowired
    private UserRepository userRepository;

    // Admin Dashboard - View system overview
    @GetMapping({"", "/"})
    public String adminDashboard(Model model) {
        Set<Book> books = bookService.getAllBooks();
        model.addAttribute("books", books);
        model.addAttribute("totalBooks", books.size());
        model.addAttribute("totalCustomers", customerRepository.count());
        model.addAttribute("totalSellers", sellerRepository.count());
        return "admin-dashboard";
    }
    
    // View all books in the system (read-only for admin)
    @GetMapping("/books")
    public String viewAllBooks(Model model) {
        Set<Book> books = bookService.getAllBooks();
        model.addAttribute("books", books);
        model.addAttribute("message", "Admin can view all books but cannot add/edit them. Only sellers can manage books.");
        model.addAttribute("messageType", "info");
        return "admin-books-view";
    }
    
    // View all customers (admin function)
    @GetMapping("/customers")
    public String viewAllCustomers(Model model) {
        model.addAttribute("customers", customerRepository.findAll());
        return "admin-customers-view";
    }
    
    // View all sellers (admin function)
    @GetMapping("/sellers")
    public String viewAllSellers(Model model) {
        model.addAttribute("sellers", sellerRepository.findAll());
        return "admin-sellers-view";
    }

    @DeleteMapping("/clear-all-users")
    public String clearAllUsersAndCustomers() {
        try {
            // Delete in proper order to maintain referential integrity
            authorityRepository.deleteAll();
            bookUserRepository.deleteAll();
            purchaseDetailRepository.deleteAll();
            purchaseHistoryRepository.deleteAll();
            shoppingCartRepository.deleteAll();
            customerRepository.deleteAll();
            sellerRepository.deleteAll();
            userRepository.deleteAll();
            
            return "All users, customers, and sellers have been successfully deleted!";
        } catch (Exception e) {
            return "Error occurred while deleting users: " + e.getMessage();
        }
    }
    
    // Promote user to admin (temporary endpoint for setup)
    @PostMapping("/promote-user")
    @ResponseBody
    public String promoteUserToAdmin(@RequestParam("username") String username) {
        try {
            // Check if user exists
            if (userRepository.findByUsername(username) == null) {
                return "User not found: " + username;
            }
            
            // Check if user already has admin role
            if (authorityRepository.findByUserUsernameAndRole(username, "ROLE_ADMIN") != null) {
                return "User " + username + " already has admin role!";
            }
            
            // Create authority entity
            Authority adminAuthority = new Authority();
            adminAuthority.setuser(userRepository.findByUsername(username));
            adminAuthority.setRole("ROLE_ADMIN");
            
            // Save authority
            authorityRepository.save(adminAuthority);
            
            return "User " + username + " has been promoted to admin successfully!";
        } catch (Exception e) {
            return "Error promoting user to admin: " + e.getMessage();
        }
    }
}