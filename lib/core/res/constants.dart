const baseUrl = 'http://212.112.105.242:8800';

String apiEndpoint = '/api';

// auth endpoints
String authEndpoint = '/auth';
String authSignInEndpoint = '$authEndpoint/login';

// users endpoints
String usersEndpoint = '$apiEndpoint/users';
String usersGetMeEndpoint = '$usersEndpoint/me';

// department endpoints
String departmentsEndpoint = '$apiEndpoint/department';
String departmentsDoSearchEndpoint = '/api/department/doSearch';

// KEYS
const tokenKey = 'KEY_TOKEN';
