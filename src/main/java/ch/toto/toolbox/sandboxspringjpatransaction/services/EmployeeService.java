package ch.toto.toolbox.sandboxspringjpatransaction.services;

import ch.toto.toolbox.sandboxspringjpatransaction.entities.Address;
import ch.toto.toolbox.sandboxspringjpatransaction.entities.Employee;
import ch.toto.toolbox.sandboxspringjpatransaction.repositories.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;
    
    @Autowired
    private AddressService addressService;
    
    @Transactional(rollbackFor = Exception.class)
    public Employee addEmployee(Employee employee) throws Exception {
        Employee employeeSavedToDB = this.employeeRepository.save(employee);
        
        // Create address for employee
        Address address = new Address();
        address.setAddress("Varanasi");
        address.setEmployee(employee);
        
        // This may throw an exception intentionally for testing rollback
        if (employee.getName().equalsIgnoreCase("error")) {
            throw new RuntimeException("Simulated Exception: Forcing rollback!");
        }
        
        this.addressService.addAddress(address);
        return employeeSavedToDB;
    }
}