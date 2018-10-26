import './main.css';
import {
  Elm
} from './Main.elm';
import registerServiceWorker from './registerServiceWorker';
import firebase from "firebase";
import ports from "./ports.js";

var config = {
  apiKey: "AIzaSyBvsN92z_WP8B2DicBvkfvSQRT3w70tZxQ",
  authDomain: "hill-cycling.firebaseapp.com",
  databaseURL: "https://hill-cycling.firebaseio.com",
  storageBucket: "hill-cycling.appspot.com",
};

firebase.initializeApp(config);

var app = Elm.Main.init({
  node: document.getElementById('root')
});

registerServiceWorker();
ports.subscribe(app, firebase);