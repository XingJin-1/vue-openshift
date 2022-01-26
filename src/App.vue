<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <h1>Welcome to Your Vue.js App!</h1>

    <button @click="getCookie">Get Token</button>

    <p id="content"></p>

  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

<script>
import axios from 'axios';
import jwt_decode from "jwt-decode";

export default {
   methods:{
     getCookie(){
      axios.get(``)
      .then(response => {
        this.header = response.headers;
        console.log(this.header);
        var idToken = this.header['authorization'];
        idToken = idToken.replace('Bearer ','');
        var decoded = jwt_decode(idToken);
        console.log(decoded);

        let paragraph = document.getElementById("content");

        var outputText = 'Name: ' + decoded['name'] + "\n" + 'Email: ' + decoded['email'] + "\n" + 'Issuer: ' + decoded['iss'] + "\n" + 'Auth Time: ' + decoded['auth_time'] + "\n" + 'Job Token: ' + decoded['jti'] + "\n"
        paragraph.innerText = outputText;
      })
     }
   }
};
</script>