class ClientRequest {
    String email;
    String username;
    String firstName;
    String lastName;
    String phone;
    String role;
    String gender;
    //bool isActive;
    String password;
    String confirmPassword;
    String idNumber;

    ClientRequest({
        required this.email,
        required this.username,
        required this.firstName,
        required this.lastName,
        required this.phone,
        required this.role,
        required this.gender,
        //required this.isActive,
        required this.password,
        required this.confirmPassword,
        required this.idNumber,
    });

}
