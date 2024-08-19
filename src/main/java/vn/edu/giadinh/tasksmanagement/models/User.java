package vn.edu.giadinh.tasksmanagement.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.giadinh.tasksmanagement.enums.UserRole;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class User {
    // Fields:
    private String username;
    private String password;
    private String fullName;
    private UserRole role;
}
