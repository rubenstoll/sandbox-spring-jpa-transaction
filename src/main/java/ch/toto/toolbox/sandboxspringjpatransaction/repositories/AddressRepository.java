package ch.toto.toolbox.sandboxspringjpatransaction.repositories;

import ch.toto.toolbox.sandboxspringjpatransaction.entities.Address;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressRepository extends JpaRepository<Address, Integer> {
}