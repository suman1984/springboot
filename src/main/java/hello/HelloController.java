package hello;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloController {
    
    @RequestMapping("/")
    public String index() {
        return "<h1>Hey, I am CICD Demo for SpringBoot App .... !</h1>";
    }
    
}