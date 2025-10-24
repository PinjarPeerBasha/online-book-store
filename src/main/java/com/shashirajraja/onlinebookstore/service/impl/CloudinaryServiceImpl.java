package com.shashirajraja.onlinebookstore.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.shashirajraja.onlinebookstore.service.CloudinaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Implementation of CloudinaryService for image management
 */
@Service
public class CloudinaryServiceImpl implements CloudinaryService {

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public Map<String, Object> uploadImage(MultipartFile file, String folder) {
        try {
            Map<String, Object> uploadParams = ObjectUtils.asMap(
                    "folder", folder,
                    "resource_type", "image",
                    "transformation", ObjectUtils.asMap(
                            "quality", "auto",
                            "fetch_format", "auto"
                    )
            );
            
            Map<String, Object> uploadResult = cloudinary.uploader().upload(file.getBytes(), uploadParams);
            
            // Return simplified result
            Map<String, Object> result = new HashMap<>();
            result.put("success", true);
            result.put("url", uploadResult.get("secure_url"));
            result.put("publicId", uploadResult.get("public_id"));
            result.put("format", uploadResult.get("format"));
            result.put("width", uploadResult.get("width"));
            result.put("height", uploadResult.get("height"));
            
            return result;
            
        } catch (IOException e) {
            Map<String, Object> errorResult = new HashMap<>();
            errorResult.put("success", false);
            errorResult.put("error", e.getMessage());
            return errorResult;
        }
    }

    @Override
    public Map<String, Object> deleteImage(String publicId) {
        try {
            Map<String, Object> deleteResult = cloudinary.uploader().destroy(publicId, ObjectUtils.emptyMap());
            
            Map<String, Object> result = new HashMap<>();
            result.put("success", "ok".equals(deleteResult.get("result")));
            result.put("result", deleteResult.get("result"));
            
            return result;
            
        } catch (IOException e) {
            Map<String, Object> errorResult = new HashMap<>();
            errorResult.put("success", false);
            errorResult.put("error", e.getMessage());
            return errorResult;
        }
    }

    @Override
    public String getOptimizedImageUrl(String publicId, int width, int height) {
        return cloudinary.url()
                .transformation(new com.cloudinary.Transformation()
                        .width(width)
                        .height(height)
                        .crop("fill")
                        .quality("auto")
                        .fetchFormat("auto"))
                .generate(publicId);
    }
}
