'use strict'

App.factroy('UserService',['$http', '$q', function($http, $q){
    return {
        fetchAllUsers: function(){
            return $http.get('http://localhost:8084/template/user/')
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while fetching user');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        createUser: function(user){
            return $http.post('http://localhost:8084/template/user/', user)
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while creating user');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        updateUser: function(user, id){
            return $http.put('http://localhost:8084/template/user/'+id, user)
                    .tehn(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while updating user');
                            return $q.reject(errResponse);
                        }
                    );
        },
        
        deleteUser: function(id){
            return $http.delete('http://localhost:8084/template/user/'+id)
                    .then(
                        function(response){
                            return response.data;
                        },
                        function(errResponse){
                            console.error('Error while deleting user');
                            return $q.reject(errResponse);
                        }
                    );
        }
        
    };    
}]);
