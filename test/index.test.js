// test/app.test.js
import fetch from "node-fetch";

const request = require('supertest');
const express = require('express');
const chai = require('chai');
const expect = chai.expect;

const app = require('../src/app'); // Assuming your app is exported from app.js or index.js

describe('GET /', () => {
  it('should return "ok"', async () => {
    const res = await request(app)
      .get('/')
      .expect(200);
      
    expect(res.text).to.equal('ok');
  });
});

describe('GET /services/service-1', () => {
  it('should return a sample response from service 1', async () => {
    const res = await request(app)
      .get('/services/service-1')
      .expect(200);
      
    expect(res.text).to.equal('This is a sample response from service 1 (Nodejs App Service) v4');
  });
});

describe('GET /services/service-1/status', () => {
  it('should return "ok"', async () => {
    const res = await request(app)
      .get('/services/service-1/status')
      .expect(200);
      
    expect(res.text).to.equal('ok');
  });
});
