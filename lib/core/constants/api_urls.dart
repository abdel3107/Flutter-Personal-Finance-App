class ApiUrls {

  // static const baseUrl = "http://10.0.2.2:8080/api/v1/";

  static const baseUrl = "http://192.168.1.188:8080/api/v1/";

  static const getOTP = "${baseUrl}auth/phone/generateOTP" ;

  static const confirmOTP = "${baseUrl}auth/phone/verifyOTP" ;

  static const register = "${baseUrl}auth/register" ;

  static const authenticate = "${baseUrl}auth/authenticate" ;

}