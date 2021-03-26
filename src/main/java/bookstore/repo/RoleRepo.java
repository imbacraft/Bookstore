package bookstore.repo;

import bookstore.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepo extends JpaRepository<Role, Integer> {
    
    @Query("SELECT r FROM Role r WHERE r.rolename = :rolename")
    public Role findByRolename(@Param("rolename")String rolename);
    
    public Role findByRolenameContaining(String rolename);
}
