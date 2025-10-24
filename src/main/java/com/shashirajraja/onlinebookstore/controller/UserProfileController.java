package com.shashirajraja.onlinebookstore.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shashirajraja.onlinebookstore.entity.Customer;
import com.shashirajraja.onlinebookstore.entity.Seller;
import com.shashirajraja.onlinebookstore.entity.User;
import com.shashirajraja.onlinebookstore.service.CustomerService;
import com.shashirajraja.onlinebookstore.service.SellerService;
import com.shashirajraja.onlinebookstore.service.UserService;

@Controller
@RequestMapping("/profile")
public class UserProfileController {

    @Autowired
    private CustomerService customerService;
    
    @Autowired
    private SellerService sellerService;
    
    @Autowired
    private UserService userService;
    
    // Directory to store uploaded photos
    private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "online-book-store-uploads" + File.separator + "profile-photos";
    
    @GetMapping("/customer")
    public String showCustomerProfile(Model model, Principal principal) {
        String username = principal.getName();
        Customer customer = customerService.findByUsername(username);
        model.addAttribute("customer", customer);
        return "customer-profile";
    }
    
    @GetMapping("/seller")  
    public String showSellerProfile(Model model, Principal principal) {
        String username = principal.getName();
        Seller seller = sellerService.findByUsername(username);
        model.addAttribute("seller", seller);
        return "seller-profile";
    }
    
    @PostMapping("/customer/update")
    public String updateCustomerProfile(
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("mobile") long mobile,
            @RequestParam("address") String address,
            @RequestParam("newUsername") String newUsername,
            @RequestParam(value = "profilePhoto", required = false) MultipartFile profilePhoto,
            Principal principal,
            RedirectAttributes redirectAttributes) {
        
        try {
            String currentUsername = principal.getName();
            Customer customer = customerService.findByUsername(currentUsername);
            
            if (customer == null) {
                redirectAttributes.addFlashAttribute("error", "Customer not found!");
                return "redirect:/profile/customer";
            }
            
            // Update basic info
            customer.setFirstName(firstName);
            customer.setLastName(lastName);
            customer.setEmail(email);
            customer.setMobile(mobile);
            customer.setAddress(address);
            
            // Handle photo upload
            if (profilePhoto != null && !profilePhoto.isEmpty()) {
                String photoPath = saveProfilePhoto(profilePhoto, currentUsername, "customer");
                if (photoPath != null) {
                    customer.setProfilePhotoPath(photoPath);
                }
            }
            
            // Handle username change
            boolean usernameChanged = !currentUsername.equals(newUsername);
            if (usernameChanged) {
                // Check if new username already exists
                if (userService.findByUserName(newUsername) != null) {
                    redirectAttributes.addFlashAttribute("error", "Username '" + newUsername + "' is already taken!");
                    return "redirect:/profile/customer";
                }
                
                // Update username in both Customer and User entities
                customer.setUsername(newUsername);
                User user = customer.getUser();
                if (user != null) {
                    user.setUsername(newUsername);
                    userService.updateUser(user);
                }
            }
            
            customerService.updateCustomer(customer);
            
            if (usernameChanged) {
                // Log out user so they can log in with new username
                SecurityContextHolder.clearContext();
                redirectAttributes.addFlashAttribute("success", "Profile updated successfully! Please log in with your new username: " + newUsername);
                return "redirect:/showMyLoginPage";
            } else {
                redirectAttributes.addFlashAttribute("success", "Profile updated successfully!");
                return "redirect:/profile/customer";
            }
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error updating profile: " + e.getMessage());
            return "redirect:/profile/customer";
        }
    }
    
    @PostMapping("/seller/update")
    public String updateSellerProfile(
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("mobile") long mobile,
            @RequestParam("address") String address,
            @RequestParam("businessName") String businessName,
            @RequestParam("businessDescription") String businessDescription,
            @RequestParam("newUsername") String newUsername,
            @RequestParam(value = "profilePhoto", required = false) MultipartFile profilePhoto,
            Principal principal,
            RedirectAttributes redirectAttributes) {
        
        try {
            String currentUsername = principal.getName();
            Seller seller = sellerService.findByUsername(currentUsername);
            
            if (seller == null) {
                redirectAttributes.addFlashAttribute("error", "Seller not found!");
                return "redirect:/profile/seller";
            }
            
            // Update basic info
            seller.setFirstName(firstName);
            seller.setLastName(lastName);
            seller.setEmail(email);
            seller.setMobile(mobile);
            seller.setAddress(address);
            seller.setBusinessName(businessName);
            seller.setBusinessDescription(businessDescription);
            
            // Handle photo upload
            if (profilePhoto != null && !profilePhoto.isEmpty()) {
                String photoPath = saveProfilePhoto(profilePhoto, currentUsername, "seller");
                if (photoPath != null) {
                    seller.setProfilePhotoPath(photoPath);
                }
            }
            
            // Handle username change
            boolean usernameChanged = !currentUsername.equals(newUsername);
            if (usernameChanged) {
                // Check if new username already exists
                if (userService.findByUserName(newUsername) != null) {
                    redirectAttributes.addFlashAttribute("error", "Username '" + newUsername + "' is already taken!");
                    return "redirect:/profile/seller";
                }
                
                // Update username in both Seller and User entities
                seller.setUsername(newUsername);
                User user = seller.getUser();
                if (user != null) {
                    user.setUsername(newUsername);
                    userService.updateUser(user);
                }
            }
            
            sellerService.updateSeller(seller);
            
            if (usernameChanged) {
                // Log out user so they can log in with new username
                SecurityContextHolder.clearContext();
                redirectAttributes.addFlashAttribute("success", "Profile updated successfully! Please log in with your new username: " + newUsername);
                return "redirect:/showMyLoginPage";
            } else {
                redirectAttributes.addFlashAttribute("success", "Profile updated successfully!");
                return "redirect:/profile/seller";
            }
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error updating profile: " + e.getMessage());
            return "redirect:/profile/seller";
        }
    }
    
    private String saveProfilePhoto(MultipartFile photo, String username, String userType) {
        try {
            // Create uploads directory if it doesn't exist
            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            
            // Generate unique filename
            String originalFileName = photo.getOriginalFilename();
            String fileExtension = "";
            if (originalFileName != null && originalFileName.contains(".")) {
                fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            }
            String uniqueFileName = userType + "_" + username + "_" + UUID.randomUUID().toString() + fileExtension;
            
            // Save file
            Path filePath = uploadPath.resolve(uniqueFileName);
            Files.copy(photo.getInputStream(), filePath);
            
            return uniqueFileName; // Return just filename, not full path
            
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
