package ch.toto.toolbox.sandboxspringjpatransaction;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class SandboxSpringJpaTransactionApplication {

    static void main(String[] args) {
        SpringApplication.run(SandboxSpringJpaTransactionApplication.class, args);
    }

}
