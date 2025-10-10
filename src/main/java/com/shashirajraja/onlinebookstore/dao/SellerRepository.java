package com.shashirajraja.onlinebookstore.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.shashirajraja.onlinebookstore.entity.Seller;

@RepositoryRestResource
public interface SellerRepository extends JpaRepository<Seller, String> {

	@Query("from Seller where lower(email)=:email_id")
	public List<Seller> findByEmail(@Param("email_id") String emailId);
	
	@Query("from Seller where lower(businessName)=:business_name")
	public List<Seller> findByBusinessName(@Param("business_name") String businessName);
}
