package com.example.cicdadvancedpipeline.repository;

import com.example.cicdadvancedpipeline.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
}
