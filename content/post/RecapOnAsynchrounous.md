---
title: 'A Recap on Asynchronous in Js'
date: 2020-04-03T11:25:10-05:00
draft: false
description: 'Callbacks, Promises, Async and Await'
author:      "Sisi"
image: ''
tags: ['JavaScript', 'Asynchronous']
---

# A Recap on Asynchrounous in Js

## Summary

##### Why use asynchrounous code?

> Many Web API features now use asynchronous code to run, especially those that access or fetch some kind of resource from an external device, such as fetching a file from the network, accessing a database and returning data from it, accessing a video stream from a web cam.

##### 3 main types of asynchronous code style in JS

- Async Callbacks
- Promises
- Async and Await

## Callback functions

##### An example of using Callbacks

```
function loadAsset(url, type, callback) {
  let xhr = new XMLHttpRequest();
  xhr.open('GET', url);
  xhr.responseType = type;

  xhr.onload = function() {
    callback(xhr.response);
  };

  xhr.send();
}

function displayImage(blob) {
  let objectURL = URL.createObjectURL(blob);

  let image = document.createElement('img');
  image.src = objectURL;
  document.body.appendChild(image);
}

loadAsset('coffee.jpg', 'blob', displayImage);
```

##### Cons of using callbacks

When we have chained callbacks, `Callback Hells` will polutes our code. To overcome this, we can either use named function when we pass as a callback function. Or we replace Callbakcs with Promises.

## Promises

##### What is a promise?

Promise is an object that holds eventual result of an asynchronous operation. When a promise is created, it's status is Pending, after the async operation, the promise is either Fulfilled or Rejected.

##### An example of consuming promise

```
fetch('products.json').then(function(response) {
  return response.json();
}).then(function(json) {
  products = json;
  initialize();
}).catch(function(err) {
  console.log('Fetch problem: ' + err.message);
});
```

##### Pattern to create a promise:

```
let myPromise = new Promise(function (myResolve, myReject) {
  myResolve() // when successful
  myReject() // when error
})
```

##### Pattern to consume a promise

```
myPromise
  .then( (data) => {...} )
  .catch( (exp) => {...} )
```

## Async and Await

Async and Await helps you to write Asynchronous code that looks like Synchronous code.

##### Summary

- async and await make promises easier to write
- async makes a function return a Promise
- await makes a function wait for a Promise

##### An example that uses Async and Await to rewrite Promise-based code.

```
//Promise-based approach
getUser(1)
  .then((user) => getRepositories(user.userName))
  .then((repos) => getCommits(respos[0]))
  .then((commits) => console.log('Commits', commits))
  .catch((err) => console.log('Error', err.message))

//Aynsc and Await approach
const user = await getUser(1)
const repos = await getRepositories(user.userName)
const commits = await getCommits(repos[0])
console.log(commits)
```
