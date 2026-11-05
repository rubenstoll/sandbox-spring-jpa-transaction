package ch.toto.toolbox.sandboxspringjpatransaction.entities;

import java.util.LinkedHashSet;
import java.util.Set;

import jakarta.persistence.*;
import lombok.*;
import org.jspecify.annotations.NonNull;

@Entity
@Table(name = "add_info")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Address {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer add_id;
    
    private String address;

    // One-to-one mapping: one employee has one address
    @OneToOne
    private Employee employee;
    @NonNull
    @OneToMany
    @JoinColumn(name = "address_info_id")
    private Set<Employee> empInfos = new LinkedHashSet<>();
}