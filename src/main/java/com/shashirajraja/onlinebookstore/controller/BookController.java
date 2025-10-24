package com.shashirajraja.onlinebookstore.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shashirajraja.onlinebookstore.entity.Book;
import com.shashirajraja.onlinebookstore.entity.CurrentSession;
import com.shashirajraja.onlinebookstore.entity.Customer;
import com.shashirajraja.onlinebookstore.entity.ShoppingCart;
import com.shashirajraja.onlinebookstore.service.BookService;
import com.shashirajraja.onlinebookstore.service.ShoppingCartService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	BookService theBookService;
	
	@Autowired
	ShoppingCartService theCartService;
	
	@Autowired
	CurrentSession currentSession;
	
	@GetMapping({"","/"})
	public String viewBooks(Model theModel) {
		//load the books
		Set<Book> books = theBookService.getAllBooks(); 
		
		theModel.addAttribute("books", books);
		
		Customer customer = currentSession.getUser().getCustomer();
		
		//load shoppingitems
		Set<ShoppingCart> shoppingItems = theCartService.getByUsername(customer);
		
		theModel.addAttribute("shoppingItems", shoppingItems);
		return "customer-books-list";
	}
	
	@GetMapping("/detail")
	public String viewBookDetail(@RequestParam("bookId") int bookId, Model theModel) {
		// Load the specific book
		Book book = theBookService.getBook(bookId);
		if (book == null) {
			theModel.addAttribute("message", "Book not found!");
			return "redirect:/books";
		}
		
		theModel.addAttribute("book", book);
		
		Customer customer = currentSession.getUser().getCustomer();
		
		// Load shopping items to check if book is already in cart
		Set<ShoppingCart> shoppingItems = theCartService.getByUsername(customer);
		theModel.addAttribute("shoppingItems", shoppingItems);
		
		// Add customer data for navbar
		theModel.addAttribute("customerData", customer);
		
		return "customer-book-detail";
	}
}
