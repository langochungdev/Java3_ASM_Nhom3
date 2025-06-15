package Entity;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String id;
    private String password;
    private String fullname;
    private Date birthday;
    private boolean gender;
    private String mobile;
    private String email;
    private boolean role; 
}
