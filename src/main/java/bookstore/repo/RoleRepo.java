package bookstore.repo;

import bookstore.entity.Roles;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepo extends JpaRepository<Roles, Integer> {
    
    @Query("SELECT r FROM Roles r WHERE r.rolename = :rolename")
    public Roles findByRolename(@Param("rolename")String rolename);
    
    public Roles findByRolenameContaining(String rolename);
}
