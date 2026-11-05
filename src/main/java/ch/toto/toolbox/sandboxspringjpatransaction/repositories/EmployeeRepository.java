package ch.toto.toolbox.sandboxspringjpatransaction.repositories;

import ch.toto.toolbox.sandboxspringjpatransaction.entities.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
}