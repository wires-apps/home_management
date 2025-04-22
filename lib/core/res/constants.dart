const baseUrl = 'https://home-folder.wires.kz';

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
