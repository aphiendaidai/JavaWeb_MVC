package com.thick.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thick.model.Role;
import com.thick.repository.RoleRepository;

import jakarta.annotation.PostConstruct;

@Service
public class RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @PostConstruct
    public void init() {
        if (!roleRepository.findByName("ROLE_ADMIN").isPresent()) {
            Role adminRole = new Role("ROLE_ADMIN");
            roleRepository.save(adminRole);
        }
        
        if (!roleRepository.findByName("ROLE_USER").isPresent()) {
            Role userRole = new Role("ROLE_USER");
            roleRepository.save(userRole);
        }
    }

    public Role getAdminRole() {
        return roleRepository.findByName("ROLE_ADMIN").orElseThrow(() -> 
            new RuntimeException("Admin role not found"));
    }

    public Role getUserRole() {
        return roleRepository.findByName("ROLE_USER").orElseThrow(() -> 
            new RuntimeException("User role not found"));
    }
    
    
} 