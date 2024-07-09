// test/app.test.js

import request from 'supertest';
import { expect as _expect } from 'chai';
import rewire from 'rewire';

const expect = _expect;

import app from '../src/index'; // Assuming your app is exported from app.js or index.js

// let app = rewire('../src/index');

describe('Testing express app routes', () => {

  afterEach(() => {
    app = rewire('../src/index');
    sandbox.restore();
  });

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
});