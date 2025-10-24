package com.shashirajraja.onlinebookstore.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * Service interface for Cloudinary image management
 */
public interface CloudinaryService {
    
    /**
     * Upload image to Cloudinary
     * @param file MultipartFile to upload
     * @param folder Folder name in Cloudinary
     * @return Map containing upload result with URL
     */
    Map<String, Object> uploadImage(MultipartFile file, String folder);
    
    /**
     * Delete image from Cloudinary
     * @param publicId Public ID of the image to delete
     * @return Map containing deletion result
     */
    Map<String, Object> deleteImage(String publicId);
    
    /**
     * Get optimized image URL
     * @param publicId Public ID of the image
     * @param width Desired width
     * @param height Desired height
     * @return Optimized image URL
     */
    String getOptimizedImageUrl(String publicId, int width, int height);
}
